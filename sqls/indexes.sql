CREATE INDEX robot_operator_idx ON "robot" USING hash("operator_id");
 
CREATE INDEX robot_asteroid_idx ON "robot" USING hash("asteroid_id");
 
CREATE INDEX task_cost_idx ON "task" USING btree("cost");
 
CREATE INDEX asteroid_distance_idx ON "asteroid" USING btree("distance");
 
CREATE INDEX robot_hit_points_idx ON "robot" USING btree("hit_points");