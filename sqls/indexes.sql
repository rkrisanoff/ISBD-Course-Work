CREATE INDEX post_employee_idx ON "post" USING hash("employee_id");

CREATE INDEX post_role_idx ON "post" USING hash("role_id");

CREATE INDEX post_department_idx ON "post" USING hash("department_id");

CREATE INDEX robot_operator_idx ON "robot" USING hash("operator_id");

CREATE INDEX robot_asteroid_idx ON "robot" USING hash("asteroid_id");

CREATE INDEX asteroid_distance_idx ON "asteroid" USING btree("distance");