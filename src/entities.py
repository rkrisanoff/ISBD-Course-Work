from genModel import Entity, FieldType, Domain, Field, ForeignKeyReference


positronic_brain = Entity("positronic_brain",
                          {
                              "release_series":
                              Field(
                                  name="release_series",
                                  type=FieldType.INTEGER,
                                  domain=Domain.INDEX,
                                  isPK=True,
                                  mayBeNull=False,
                                  condition=lambda: True
                              ),
                              "name":
                              Field(
                                  name="name",
                                  type=FieldType.VARCHAR,
                                  domain=Domain.POSITRONIC_BRAIN,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda val: len(val) <= 255
                              ),
                              "speed":
                              Field(
                                  name="speed",
                                  type=FieldType.INTEGER,
                                  domain=Domain.NATURAL,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda val: val > 0
                              ),
                              "cost":
                              Field(
                                  name="cost",
                                  type=FieldType.INTEGER,
                                  domain=Domain.NATURAL,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda val: val > 0
                              )
                          }
                          )
department = Entity("department",
                    {
                        "id":
                        Field(name="id",
                              type=FieldType.INTEGER,
                              domain=Domain.INDEX,
                              isPK=True,
                              mayBeNull=False,
                              condition=lambda: True
                              ),
                        "extracted_bor_quantity":
                        Field(
                            name="extracted_bor_quantity",
                            type=FieldType.INTEGER,
                            domain=Domain.NONEGATIVE_INTEGER,
                            isPK=False, mayBeNull=False,
                            condition=lambda val: val >= 0
                        ),
                        "current_resource":
                        Field(
                            name="current_resource",
                            type=FieldType.INTEGER,
                            domain=Domain.NONEGATIVE_INTEGER,
                            isPK=False,
                            mayBeNull=False,
                            condition=lambda val: val >= 0
                        )
                    }
                    )
robot = Entity("robot",
               {
                   "id":
                   Field(
                       name="id",
                       type=FieldType.INTEGER,
                       domain=Domain.INDEX,
                       isPK=True,
                       mayBeNull=False,
                       condition=lambda: True,
                       FK=None
                   ),
                   "brain_series":
                   Field(
                       name="brain_series",
                       type=FieldType.INTEGER,
                       domain=Domain.INDEX,
                       isPK=False,
                       mayBeNull=False,
                       condition=lambda: True,
                       FK=ForeignKeyReference(
                           "positronic_brain", "release_series")
                   ),
               }
               )

asteroid = Entity("asteroid", {
    "id":
    Field(
        name="id",
        type=FieldType.INTEGER,
        domain=Domain.INDEX,
        isPK=True,
        mayBeNull=False,
        condition=lambda: True,
    ),
    "name":
    Field(
        name="name",
        type=FieldType.VARCHAR,
        domain=Domain.ASTEROID,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True,
    ),
    "distance":
    Field(
        name="distance",
        type=FieldType.INTEGER,
        domain=Domain.NONEGATIVE_INTEGER,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True,
    )
})

deposit = Entity("deposit", {
    "id":
    Field(
        name="id",
        type=FieldType.INTEGER,
        domain=Domain.INDEX,
        isPK=True,
        mayBeNull=False,
        condition=lambda: True,
        FK=None
    ),
    "asteroid_id":
    Field(
        name="asteroid_id",
        type=FieldType.INTEGER,
        domain=Domain.ASTEROID,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True,
        FK=ForeignKeyReference("asteroid","id")
    ),
    "bor_quantity":
    Field(
        name="bor_quantity",
        type=FieldType.INTEGER,
        domain=Domain.INDEX,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True,
        FK=None
    ),
})
spaceship = Entity("spaceship", {
    "id":
    Field(
        name="id",
        type=FieldType.INTEGER,
        domain=Domain.INDEX,
        isPK=True,
        mayBeNull=False,
        condition=lambda: True,
    ),
    "department_id":
    Field(
        name="department_id",
        type=FieldType.INTEGER,
        domain=Domain.INDEX,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True,
        FK=ForeignKeyReference("department","id")
    ),
    "income":
    Field(
        name="income",
        type=FieldType.INTEGER,
        domain=Domain.NONEGATIVE_INTEGER,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True,
    ),
        "b2_h6_quantity":
    Field(
        name="b2_h6_quantity",
        type=FieldType.INTEGER,
        domain=Domain.NONEGATIVE_INTEGER,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True
    ),"b5_h12_quantity":
        Field(
        name="b5_h12_quantity",
        type=FieldType.INTEGER,
        domain=Domain.NONEGATIVE_INTEGER,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True
    ),"b10_h14_quantity":
        Field(
        name="b10_h14_quantity",
        type=FieldType.INTEGER,
        domain=Domain.NONEGATIVE_INTEGER,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True
    ),"b12_h12_quantity":
        Field(
        name="b12_h12_quantity",
        type=FieldType.INTEGER,
        domain=Domain.NONEGATIVE_INTEGER,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True
    )
})
microreactor_type = Entity("microreactor_type", {
    "id":
    Field(
        name="id",
        type=FieldType.INTEGER,
        domain=Domain.INDEX,
        isPK=True,
        mayBeNull=False,
        condition=lambda: True
    ),
    "name":
    Field(
        name="name",
        type=FieldType.VARCHAR,
        domain=Domain.MICROREACTOR,
        isPK=False,
        mayBeNull=False,
        condition=lambda val: len(val)<255
    ),
    "cost":
    Field(
        name="cost",
        type=FieldType.INTEGER,
        domain=Domain.NONEGATIVE_INTEGER,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True,
    ),
        "b2_h6_consumption_rate":
    Field(
        name="b2_h6_consumption_rate",
        type=FieldType.INTEGER,
        domain=Domain.NONEGATIVE_INTEGER,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True,
    ),
        "b5_h12_consumption_rate":
    Field(
        name="b5_h12_consumption_rate",
        type=FieldType.INTEGER,
        domain=Domain.NONEGATIVE_INTEGER,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True,
    ),
        "b10_h14_consumption_rate":
    Field(
        name="b10_h14_consumption_rate",
        type=FieldType.INTEGER,
        domain=Domain.NONEGATIVE_INTEGER,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True,
    ),
        "b12_h12_consumption_rate":
    Field(
        name="b12_h12_consumption_rate",
        type=FieldType.INTEGER,
        domain=Domain.NONEGATIVE_INTEGER,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True,
    ),
})
microreactor_in_spaceship = Entity("microreactor_in_spaceship", {
    "microreactor_type_id":
    Field(
        name="microreactor_type_id",
        type=FieldType.INTEGER,
        domain=Domain.INDEX,
        isPK=True,
        mayBeNull=False,
        condition=lambda: True,
        FK=ForeignKeyReference("microreactor_type","id")
    ),
    "spaceship_id":
    Field(
        name="spaceship_id",
        type=FieldType.INTEGER,
        domain=Domain.ASTEROID,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True,
        FK=ForeignKeyReference("spaceship","id")
    ),
    "deploy_date":
    Field(
        name="deploy_date",
        type=FieldType.TIMESTAMP,
        domain=Domain.DATE_INSTALL,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True,
    ),
})
post = Entity("post", {
    "id":
    Field(
        name="id",
        type=FieldType.INTEGER,
        domain=Domain.INDEX,
        isPK=True,
        mayBeNull=False,
        condition=lambda: True,
    ),
    "employee_id":
    Field(
        name="employee_id",
        type=FieldType.INTEGER,
        domain=Domain.NAME,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True,
        FK=ForeignKeyReference("employee","id")
    ),
        "role_id":
    Field(
        name="role_id",
        type=FieldType.INTEGER,
        domain=Domain.NAME,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True,
        FK=ForeignKeyReference("role","id")
    ),
    "department_id":
    Field(
        name="department_id",
        type=FieldType.INTEGER,
        domain=Domain.INDEX,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True,
        FK=ForeignKeyReference("department","id")
    ),
        "premium":
    Field(
        name="premium",
        type=FieldType.INTEGER,
        domain=Domain.INDEX,
        isPK=False,
        mayBeNull=False,
        condition=lambda: True,
    ),
})


positronic_brain = Entity("positronic_brain",
                          {
                              "release_series":
                              Field(
                                  name="release_series",
                                  type=FieldType.INTEGER,
                                  domain=Domain.INDEX,
                                  isPK=True,
                                  mayBeNull=False,
                                  condition=lambda: True
                              ),
                              "name":
                              Field(
                                  name="name",
                                  type=FieldType.VARCHAR,
                                  domain=Domain.POSITRONIC_BRAIN,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda val: len(val) <= 255
                              ),
                              "speed":
                              Field(
                                  name="speed",
                                  type=FieldType.INTEGER,
                                  domain=Domain.NATURAL,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda val: val > 0
                              ),
                              "cost":
                              Field(
                                  name="cost",
                                  type=FieldType.INTEGER,
                                  domain=Domain.NATURAL,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda val: val > 0
                              )
                          }
                          )
department = Entity("department",
                    {
                        "id":
                        Field(name="id",
                              type=FieldType.INTEGER,
                              domain=Domain.INDEX,
                              isPK=True,
                              mayBeNull=False,
                              condition=lambda: True
                              ),
                        "extracted_bor_quantity":
                        Field(
                            name="extracted_bor_quantity",
                            type=FieldType.INTEGER,
                            domain=Domain.NONEGATIVE_INTEGER,
                            isPK=False, mayBeNull=False,
                            condition=lambda val: val >= 0
                        ),
                        "current_resource":
                        Field(
                            name="current_resource",
                            type=FieldType.INTEGER,
                            domain=Domain.NONEGATIVE_INTEGER,
                            isPK=False,
                            mayBeNull=False,
                            condition=lambda val: val >= 0
                        )
                    }
                    )
robot = Entity("robot",
               {
                   "id":
                   Field(
                       name="id",
                       type=FieldType.INTEGER,
                       domain=Domain.INDEX,
                       isPK=True,
                       mayBeNull=False,
                       condition=lambda: True,
                       FK=None
                   ),
                   "brain_series":
                   Field(
                       name="brain_series",
                       type=FieldType.INTEGER,
                       domain=Domain.INDEX,
                       isPK=False,
                       mayBeNull=False,
                       condition=lambda: True,
                       FK=ForeignKeyReference(
                           "positronic_brain", "release_series")
                   ),
                   "operator_id":
                   Field(
                       name="operator_id",
                       type=FieldType.INTEGER,
                       domain=Domain.INDEX,
                       isPK=False,
                       mayBeNull=False,
                       condition=lambda: True,
                       FK=ForeignKeyReference(
                           "employee", "id")
                   ),
 
                   "body_series":
                   Field(
                       name="body_series",
                       type=FieldType.INTEGER,
                       domain=Domain.INDEX,
                       isPK=False,
                       mayBeNull=False,
                       condition=lambda: True,
                       FK=ForeignKeyReference(
                           "body", "release_series")
                   ),
                   "eye_series":
                   Field(
                       name="eye_series",
                       type=FieldType.INTEGER,
                       domain=Domain.INDEX,
                       isPK=False,
                       mayBeNull=False,
                       condition=lambda: True,
                       FK=ForeignKeyReference(
                           "eyes_sensors", "release_series")
                   ),
                   "hit_points":
                   Field(
                       name="hit_points",
                       type=FieldType.INTEGER,
                       domain=Domain.NONEGATIVE_INTEGER,
                       isPK=False,
                       mayBeNull=False,
                       condition=lambda: True,
                       FK=None
                   ),
                   "asteroid_id":
                   Field(
                       name="asteroid_id",
                       type=FieldType.INTEGER,
                       domain=Domain.INDEX,
                       isPK=False,
                       mayBeNull=False,
                       condition=lambda: True,
                       FK=ForeignKeyReference(
                           "asteroid", "id")
                   )
               }
               )
body = Entity("body",
                          {
                              "release_series":
                              Field(
                                  name="release_series",
                                  type=FieldType.INTEGER,
                                  domain=Domain.INDEX,
                                  isPK=True,
                                  mayBeNull=False,
                                  condition=lambda: True
                              ),
                              "name":
                              Field(
                                  name="name",
                                  type=FieldType.VARCHAR,
                                  domain=Domain.BODY,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda val: len(val) <= 255
                              ),
                              "max_hit_points":
                              Field(
                                  name="max_hit_points",
                                  type=FieldType.INTEGER,
                                  domain=Domain.NONEGATIVE_INTEGER,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda: True
                              ),
                              "cost":
                              Field(
                                  name="cost",
                                  type=FieldType.INTEGER,
                                  domain=Domain.NATURAL,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda val: val > 0
                              )
                          }
                          )
eyes_sensors = Entity("eyes_sensors",
                          {
                              "release_series":
                              Field(
                                  name="release_series",
                                  type=FieldType.INTEGER,
                                  domain=Domain.INDEX,
                                  isPK=True,
                                  mayBeNull=False,
                                  condition=lambda: True
                              ),
                              "name":
                              Field(
                                  name="name",
                                  type=FieldType.VARCHAR,
                                  domain=Domain.EYES_SENSORS,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda val: len(val) <= 255
                              ),
                              "distance":
                              Field(
                                  name="distance",
                                  type=FieldType.INTEGER,
                                  domain=Domain.NONEGATIVE_INTEGER,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda: True
                              ),
                              "cost":
                              Field(
                                  name="cost",
                                  type=FieldType.INTEGER,
                                  domain=Domain.NATURAL,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda val: val > 0
                              )
                          }
                          )
 
task = Entity("task",
                          {
                              "id":
                              Field(
                                  name="id",
                                  type=FieldType.INTEGER,
                                  domain=Domain.INDEX,
                                  isPK=True,
                                  mayBeNull=False,
                                  condition=lambda: True
                              ),
                              "description":
                              Field(
                                  name="description",
                                  type=FieldType.VARCHAR,
                                  domain=Domain.DESCRIPTIONS,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda: True
                              ),
                              "state":
                              Field(
                                  name="state",
                                  type=FieldType.VARCHAR,
                                  domain=Domain.TASK_STATES,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda: True
                              ),
                              "creator_post_id":
                              Field(
                                  name="creator_post_id",
                                  type=FieldType.INTEGER,
                                  domain=Domain.INDEX,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda: True,
                                  FK=ForeignKeyReference(
                                     "post", "id")
                              ),
                              "executor_post_id":
                              Field(
                                  name="executor_post_id",
                                  type=FieldType.INTEGER,
                                  domain=Domain.INDEX,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda: True,
                                  FK=ForeignKeyReference(
                                     "post", "id")
                              ),
                              "cost":
                              Field(
                                  name="cost",
                                  type=FieldType.INTEGER,
                                  domain=Domain.NATURAL,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda val: val > 0
                              )
                          }
                          )
role = Entity("role",
                          {
                              "id":
                              Field(
                                  name="id",
                                  type=FieldType.INTEGER,
                                  domain=Domain.INDEX,
                                  isPK=True,
                                  mayBeNull=False,
                                  condition=lambda: True
                              ),
                              "name":
                              Field(
                                  name="name",
                                  type=FieldType.VARCHAR,
                                  domain=Domain.ROLE_NAMES,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda val: len(val) <= 255
                              ),
                              "salary":
                              Field(
                                  name="salary",
                                  type=FieldType.INTEGER,
                                  domain=Domain.NONEGATIVE_INTEGER,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda val: val > 0
                              ),
                              "can_operate_robot":
                              Field(
                                  name="can_operate_robot",
                                  type=FieldType.BOOLEAN,
                                  domain=Domain.BOOLEAN,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda: True,
                              )
                          }
                          )
employee = Entity("employee",
                          {
                              "id":
                              Field(
                                  name="id",
                                  type=FieldType.INTEGER,
                                  domain=Domain.INDEX,
                                  isPK=True,
                                  mayBeNull=False,
                                  condition=lambda: True
                              ),
                              "name":
                              Field(
                                  name="name",
                                  type=FieldType.VARCHAR,
                                  domain=Domain.NAME,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda: True
                              ),
                              "age":
                              Field(
                                  name="age",
                                  type=FieldType.INTEGER,
                                  domain=Domain.AGE,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda val: val > 18
                              ),
                              "gender":
                              Field(
                                  name="gender",
                                  type=FieldType.VARCHAR,
                                  domain=Domain.GENDER,
                                  isPK=False,
                                  mayBeNull=False,
                                  condition=lambda val: val == 'male' or val == 'female'
                              )
                          }
                          )
