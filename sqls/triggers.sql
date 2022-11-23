CREATE OR REPLACE TRIGGER limit_robot_hitpoints_t 
BEFORE INSERT
    ON robot FOR EACH ROW EXECUTE PROCEDURE "limit_robot_hitpoints"();


CREATE OR REPLACE TRIGGER task_complete_reward_t 
BEFORE INSERT OR UPDATE
    ON task FOR EACH ROW EXECUTE PROCEDURE "task_complete_reward"();


CREATE OR REPLACE TRIGGER check_can_operate_robot_t
BEFORE INSERT OR UPDATE
    ON post FOR EACH ROW EXECUTE PROCEDURE "check_can_operate_robot"();



