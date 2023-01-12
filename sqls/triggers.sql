set search_path to 's284712';
CREATE TRIGGER limit_robot_hitpoints_t 
AFTER INSERT
    ON robot FOR EACH ROW EXECUTE PROCEDURE "limit_robot_hitpoints"();


--CREATE TRIGGER task_complete_reward_t 
--AFTER INSERT OR UPDATE
--    ON task FOR EACH ROW EXECUTE PROCEDURE "task_complete_reward"();


CREATE TRIGGER check_can_operate_robot_t
AFTER INSERT OR UPDATE
    ON post FOR EACH ROW EXECUTE PROCEDURE "check_can_operate_robot"();


CREATE TRIGGER body_creation_reward_t
AFTER INSERT
    ON body FOR EACH ROW EXECUTE PROCEDURE "body_creation_reward"();


CREATE TRIGGER update_robots_brain_pay_t
AFTER UPDATE
    ON robot FOR EACH ROW EXECUTE PROCEDURE "update_robots_brain_pay"();


CREATE TRIGGER update_robots_eyes_pay_t
AFTER UPDATE
    ON robot FOR EACH ROW EXECUTE PROCEDURE "update_robots_eyes_pay"();


CREATE TRIGGER update_robots_body_pay_t
AFTER UPDATE
    ON robot FOR EACH ROW EXECUTE PROCEDURE "update_robots_body_pay"();


CREATE TRIGGER update_robots_hp_pay_t
AFTER UPDATE
    ON robot FOR EACH ROW EXECUTE PROCEDURE "update_robots_hp_pay"();


CREATE TRIGGER update_spaceship_microreactor_pay_t
AFTER INSERT OR UPDATE
    ON microreactor_in_spaceship FOR EACH ROW EXECUTE PROCEDURE "update_spaceship_microreactor_pay"();


CREATE TRIGGER update_task_reward_t
AFTER INSERT OR UPDATE
    ON task FOR EACH ROW EXECUTE PROCEDURE "update_task_reward"();


CREATE TRIGGER update_bor_quantity_t
AFTER UPDATE
    ON spaceship FOR EACH ROW EXECUTE PROCEDURE "update_bor_quantity"();
