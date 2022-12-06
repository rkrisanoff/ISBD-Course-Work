#!/usr/bin/python

from genModel import EntityFactory
import entities

ef = EntityFactory({})

entities = {
    "post":entities.post,
    "positronic_brain": entities.positronic_brain, 
    "body": entities.body,
    "eyes_sensors":entities.eyes_sensors,
    "department": entities.department,
    "employee":entities.employee,
    "asteroid": entities.asteroid,
    "deposit":entities.deposit,
    "robot": entities.robot,
    "microreactor_type": entities.microreactor_type,
    "spaceship": entities.spaceship,
    "microreactor_in_spaceship": entities.microreactor_in_spaceship,
    "role":entities.role,
    "task":entities.task,
}
numbers = {
    "positronic_brain": 50,
    "body": 50,
    "eyes_sensors":50,
    "department": 50,
    "employee":700,
    "asteroid": 1000,
    "deposit":500,
    "robot": 1000,
    "microreactor_type": 10,
    "spaceship": 100,
    "microreactor_in_spaceship": 500,
    "role":4,
    "post":2000,
    "task":1000,
}
"""
Create table ROLE(
    id 
    major_name [manager,cleaner,operator,programmer,motherfucker,vovkakiller2005]
    minor_name [intern,junior,middle,senior,tear-lead,top]
)
"""

preDetermine = {
    "role":[
                {
            "id":"1",
            "name":"'intern-operator'",
            "salary":"250",
            "can_operate_robot":"TRUE"
        },
        {
            "id":"2",
            "name":"'operator'",
            "salary":"1000",
            "can_operate_robot":"TRUE"
        },
        {
            "id":"3",
            "name":"'manager'",
            "salary":"2500",
            "can_operate_robot":"FALSE"
        },
                {
            "id":"4",
            "name":"'top-manager'",
            "salary":"12500",
            "can_operate_robot":"FALSE"
        }
    ]
}

print(ef.generateSqlRequests(entities, numbers,preDetermine))