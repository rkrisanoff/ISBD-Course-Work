from enum import Enum
from typing import NamedTuple,Callable
import random as rnd
from domains import Domain


class FieldTypeDefinition(NamedTuple):
    name: str
    """
    name is unique value that detemrnies field in entity
    """
    toSql: Callable[['any'], 'str']
    """
    To Sql - translate python-value to value in SQL
    """

class FieldType(FieldTypeDefinition, Enum):
    INTEGER = FieldTypeDefinition(
        name="INTEGER",
        toSql=lambda value: str(value)
    )
    VARCHAR = FieldTypeDefinition(
        name="VARCHAR",
        toSql=lambda value: str("'"+value+"'")
    )
    BOOLEAN = FieldTypeDefinition(
        name="BOOLEAN",
        toSql=lambda value: "TRUE" if value else "NOT"
    )
    TIMESTAMP = FieldTypeDefinition(
        name="TIMESTAMP",
        toSql=lambda value: str("'"+value+"'")
    )


class ForeignKeyReference:
    entity: str
    field: str

    def __init__(self, entityName, fieldName) -> None:
        self.entity = entityName
        self.field = fieldName


class Field:
    type: FieldType
    condition: Callable[['any'], 'bool']
    name: str
    isPK: bool
    """
    flag whether the value is a primary key
    """
    mayBeNull: bool
    """
    flag whether the value is a NULL
    """
    FK: ForeignKeyReference | None
    domain: Domain

    def __init__(self, name: str, type: FieldType, domain: Domain, isPK: bool, mayBeNull: bool, condition, FK: ForeignKeyReference = None) -> None:
        self.type = type
        self.condition = condition
        self.name = name
        self.isPK = isPK
        self.mayBeNull = mayBeNull
        self.domain = domain
        self.FK = FK

    def randomValueFromDomain(self):
        return self.domain()


class Entity:
    name: str
    fields: dict[str, Field]

    def __init__(self, name, fields: dict[str, Field]) -> None:
        self.name = name
        self.fields = fields

class GeneratedEntity:
    entity:Entity
    values:dict[str,any]





class EntityFactory:
    config: dict[str, str]

    def __init__(self, config) -> None:
        self.config = config

    def transormToSql(self, entityName:str, insertValues:dict[str,any]):
        """
        transform generated values to string sort of \n
        'INSERT INTO (entity) ([...keys]) VALUES ([...values])'
        """
        keys = ','.join(insertValues.keys())
        values = ','.join(insertValues.values())
        if 'schema' in self.config:
            return f"INSERT INTO {self.config['schema']}.{entityName} ({keys}) VALUES ({values});\n"
        else:
            return f"INSERT INTO {entityName} ({keys}) VALUES ({values});\n"

    def generateInsert(self ,entity: Entity,localDomains:dict[str,list]={}) -> dict[str, any]:
        """
        generate data for one insert-request\n
        {localDomains} - dictionary of domain values from others entitie's fields where this entity must reference
        """
        values = {}.fromkeys(entity.fields.keys())
        for field in list(entity.fields.values()):
            value = None
            if field.FK:
                value = rnd.choice(localDomains[field.FK.entity])
            else:
                while not (value := field.randomValueFromDomain()):
                    pass
            values[field.name] = field.type.toSql(value)
        return values

    def generateInserts(self, sqls, entity: Entity, number:int):
        """
        generate data for {number} insert-requests\n
        """
        localDomains = {}
        for field in list(entity.fields.values()):
            if field.FK and sqls[field.FK.entity]:
                localDomains[field.FK.entity] = [entity[field.FK.field] for entity in sqls[field.FK.entity]]
        return [self.generateInsert(entity,localDomains) for _ in range(number)]
        
    def generateData(self, entities: list[Entity],numbers:dict[str,int],preDetermine:dict[str,list[dict[str]]]={}):
        """
        generate insert-requests data for every entity we sent in {entities}\n
        """
        orderedEntities = self.resolveDependencies(entities)
        requestsValues = {}.fromkeys([entity.name for entity in orderedEntities])
        for entity in orderedEntities:
            if entity.name not in preDetermine:
                requestsValues[entity.name] = self.generateInserts(requestsValues, entity, numbers[entity.name])
            else:
                requestsValues[entity.name] = preDetermine[entity.name]
        return requestsValues

    def resolveDependencies(self,entities:dict[str,Entity]) -> list[Entity]:
        fieldsDependenciesInEntityes:dict[str,set] = {}
        for entity in entities.values():
            fieldsDependenciesInEntityes[entity.name] = set()
            for field in entity.fields.values():
                if field.FK:
                 fieldsDependenciesInEntityes[entity.name].add(field.FK.entity)
        orderedEntityNameList = []
        orderedEntityNameSet = set()
        unOrdered = set(fieldsDependenciesInEntityes.keys())
  
        while unOrdered:
            for entityName in unOrdered:
                if fieldsDependenciesInEntityes[entityName].issubset(orderedEntityNameSet):
                    orderedEntityNameList.append(entityName)
                    orderedEntityNameSet.add(entityName)
                    unOrdered.remove(entityName)
                    break
  
        return [entities[name] for name in orderedEntityNameList]
            
    def generateSqlRequests(self,entities: list[Entity],numbers:dict[str,int],preDetermine:dict[str,list[dict[str]]]={}):
        finalRequst = ""
        for entityName, inserts in self.generateData(entities,numbers,preDetermine).items():
            for insert in inserts:
                finalRequst += self.transormToSql(entityName, insert)
        return finalRequst