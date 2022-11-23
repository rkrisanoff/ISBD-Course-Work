CREATE OR REPLACE TRIGGER limit_robot_hitpoints_t 
BEFORE INSERT
    ON robot FOR EACH ROW EXECUTE PROCEDURE "limit_robot_hitpoints"();


CREATE OR REPLACE TRIGGER task_complete_reward_t 
BEFORE INSERT OR UPDATE
    ON task FOR EACH ROW EXECUTE PROCEDURE "task_complete_reward"();
