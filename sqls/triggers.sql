CREATE OR REPLACE TRIGGER limit_robot_hitpoints_t BEFORE
INSERT
    ON robot FOR EACH ROW EXECUTE PROCEDURE "limit_robot_hitpoints"();