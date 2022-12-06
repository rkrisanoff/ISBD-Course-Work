CREATE OR REPLACE TRIGGER limit_robot_hitpoints_t 
BEFORE INSERT
    ON robot FOR EACH ROW EXECUTE PROCEDURE "limit_robot_hitpoints"();


--CREATE OR REPLACE TRIGGER task_complete_reward_t 
--BEFORE INSERT OR UPDATE
--    ON task FOR EACH ROW EXECUTE PROCEDURE "task_complete_reward"();


CREATE OR REPLACE TRIGGER check_can_operate_robot_t
BEFORE INSERT OR UPDATE
    ON post FOR EACH ROW EXECUTE PROCEDURE "check_can_operate_robot"();


CREATE OR REPLACE TRIGGER body_create_reward_t
BEFORE INSERT
    ON body FOR EACH ROW EXECUTE PROCEDURE "body_create_reward"();


CREATE OR REPLACE TRIGGER update_robots_brain_pay_t
BEFORE UPDATE
    ON robot FOR EACH ROW EXECUTE PROCEDURE "update_robots_brain_pay"();


CREATE OR REPLACE TRIGGER update_robots_eyes_pay_t
BEFORE UPDATE
    ON robot FOR EACH ROW EXECUTE PROCEDURE "update_robots_eyes_pay"();


CREATE OR REPLACE TRIGGER update_robots_body_pay_t
BEFORE UPDATE
    ON robot FOR EACH ROW EXECUTE PROCEDURE "update_robots_body_pay"();


CREATE OR REPLACE TRIGGER update_robots_hp_pay_t
BEFORE UPDATE
    ON robot FOR EACH ROW EXECUTE PROCEDURE "update_robots_hp_pay"();


CREATE OR REPLACE TRIGGER update_spaceship_microreactor_pay_t
BEFORE INSERT OR UPDATE
    ON microreactor_type FOR EACH ROW EXECUTE PROCEDURE "update_spaceship_microreactor_pay"();


CREATE OR REPLACE TRIGGER update_task_reward_t
BEFORE INSERT OR UPDATE
    ON task FOR EACH ROW EXECUTE PROCEDURE "update_task_reward"();


CREATE OR REPLACE TRIGGER update_bor_quantity_t
BEFORE UPDATE
    ON spaceship FOR EACH ROW EXECUTE PROCEDURE "update_bor_quantity"();
