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
    "positronic_brain": 5,
    "body": 5,
    "eyes_sensors":5,
    "department": 5,
    "employee":20,
    "asteroid": 10,
    "deposit":20,
    "robot": 30,
    "microreactor_type": 4,
    "spaceship": 15,
    "microreactor_in_spaceship": 30,
    "role":2,
    "post":20,
    "task":10,
}

preDetermine = {
    "role":[
        {
            "id":"1",
            "name":"'operator'",
            "salary":"1000",
            "can_operate_robot":"TRUE"
        },
        {
            "id":"2",
            "name":"'manager'",
            "salary":"2500",
            "can_operate_robot":"FALSE"
        }
    ]
}

print(ef.generateSqlRequests(entities, numbers,preDetermine))