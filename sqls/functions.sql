set search_path to 's284712';
CREATE
OR REPLACE FUNCTION limit_robot_hitpoints() RETURNS TRIGGER AS $$ begin if (
    select
        NEW.hit_points
) > (
    select
        max_hit_points
    from
        body
    where
        release_series = NEW.body_series
) then NEW.hit_points = (
    select
        max_hit_points
    from
        body
    where
        release_series = NEW.body_series
);
end if;

return NEW;
end;
$$ LANGUAGE plpgsql;


--CREATE
--OR REPLACE FUNCTION task_complete_reward() RETURNS TRIGGER AS $$ begin 
--if 
--(
--	select
--		NEW.state
--) = 'complete'
--then
--UPDATE 
--department
--SET
--current_resource = current_resource + NEW.cost
--WHERE
--department.id = (
--	SELECT
--	department.id
--	FROM
--	task
--	JOIN post ON task.executor_post_id = post.id AND task.id = NEW.id
--	JOIN department ON post.department_id = department.id
--);
--end if;
--
--return NEW;
--end;
--$$ LANGUAGE plpgsql;



CREATE
OR REPLACE FUNCTION check_can_operate_robot() RETURNS TRIGGER AS $$ begin
if
	(
		SELECT
		COUNT(*)
		FROM
		post
		JOIN
		role on role.id = post.role_id
		WHERE
		post.employee_id = NEW.employee_id and role.can_operate_robot = true
	) > 1
then
	RAISE EXCEPTION 'cannot create or update post with id % because there already exists post with can_operate_operator = true and such employee_id %', NEW.id, NEW.employee_id;
else
	return NEW;
end if;
return NEW;
end;
$$ LANGUAGE plpgsql;



CREATE
OR REPLACE FUNCTION body_creation_reward() RETURNS TRIGGER AS $$ begin
	UPDATE department
	SET current_resource = current_resource + (
		SELECT
		NEW.cost
	);

end;
$$ LANGUAGE plpgsql;



CREATE
OR REPLACE FUNCTION update_robots_brain_pay() RETURNS TRIGGER AS $$ begin
	if (NEW.brain_series != OLD.brain_series)
	then
		UPDATE department
		SET current_resource = current_resource - 0.05 * (
			SELECT
			cost
			FROM
			body
			WHERE
			release_series = NEW.body_series
		) - (
			SELECT
			cost
			FROM
			positronic_brain
			WHERE
			positronic_brain.release_series = NEW.brain_series
		)
		WHERE
		department.id IN (
			SELECT
			department.id
			FROM
			robot
			JOIN post ON robot.operator_post_id = post.id and robot.id = NEW.id
			JOIN role ON role.id = post.role_id AND role.can_operate_robot
			JOIN department ON department.id = post.department_id
		);
	end if;
	RETURN NEW;
end;
$$ LANGUAGE plpgsql;



CREATE
OR REPLACE FUNCTION update_robots_eyes_pay() RETURNS TRIGGER AS $$ begin
	if (NEW.eye_series != OLD.eye_series)
	then
		UPDATE department
		SET current_resource = current_resource - 0.01 * (
			SELECT
			cost
			FROM
			body
			WHERE
			release_series = NEW.body_series
		) - (
			SELECT
			cost
			FROM
			eyes_sensors
			WHERE
			eyes_sensors.release_series = NEW.eye_series
		)
		WHERE
		department.id IN (
			SELECT
			department.id
			FROM
			robot
			JOIN post ON robot.operator_post_id = post.id and robot.id = NEW.id
			JOIN role ON role.id = post.role_id AND role.can_operate_robot
			JOIN department ON department.id = post.department_id
		);
	end if;
	RETURN NEW;
end;
$$ LANGUAGE plpgsql;




CREATE
OR REPLACE FUNCTION update_robots_body_pay() RETURNS TRIGGER AS $$ begin
	if (NEW.body_series != OLD.body_series)
	then
		UPDATE department
		SET current_resource = current_resource - (
			SELECT
			cost
			FROM
			body
			WHERE
      body.release_series = NEW.body_series 
		)
		WHERE
		department.id IN (
			SELECT
			department.id
			FROM
			robot
			JOIN post ON robot.operator_post_id = post.id and robot.id = NEW.id
			JOIN role ON role.id = post.role_id AND role.can_operate_robot
			JOIN department ON department.id = post.department_id
		);
	end if;
	RETURN NEW;
end;
$$ LANGUAGE plpgsql;




CREATE
OR REPLACE FUNCTION update_robots_hp_pay() RETURNS TRIGGER AS $$ begin
	if (NEW.hit_points - OLD.hit_points > 0)
	then
		UPDATE department
		SET current_resource = current_resource - 0.01 * (NEW.hit_points - OLD.hit_points)
		WHERE
		department.id IN (
			SELECT
			department.id
			FROM
			robot
      JOIN post on robot.operator_post_id = post.id and robot.id = NEW.id
      JOIN role on role.id = post.role_id and role.can_operate_robot
			JOIN departent on department.id = post.department_id
		);
	end if;
	RETURN NEW;
end;
$$ LANGUAGE plpgsql;



CREATE
OR REPLACE FUNCTION update_spaceship_microreactor_pay() RETURNS TRIGGER AS $$ begin
	if (NEW.microreactor_type_id != OLD.microreactor_type_id)
	then
		UPDATE department
		SET current_resource = current_resource - (
			SELECT
			cost
			FROM
			microreactor_type
			JOIN microreactor_in_spaceship ON NEW.microreactor_type_id = microreactor_type.id
		)
		WHERE
		department.id = (
			SELECT
			department.id
			FROM
			department
			JOIN spaceship ON department.id = spaceship.department_id
			JOIN microreactor_in_spacechip ON NEW.spaceship_id = spaceship.id
		);
	end if;
	RETURN NEW;
end;
$$ LANGUAGE plpgsql;



CREATE
OR REPLACE FUNCTION update_task_reward() RETURNS TRIGGER AS $$ begin
	if (NEW.state == 'complete')
	then
		UPDATE 
		department
		SET
		current_resource = current_resource - NEW.cost
		WHERE
		department.id = (
			SELECT
			department.id
			FROM
			department
			JOIN post ON post.department_id = department.id
			JOIN task ON task.creator_post_id = post.id AND NEW.id = task.id
		);

		if (
			SELECT
			COUNT(*)
			FROM
			task
			JOIN post ON task.executor_post_id = post.id AND post.id = NEW.executor_post_id
			WHERE
			task.state = 'complete'
		) > 10
		then
			UPDATE
			post
			SET
			premium = premium + 0.1 * NEW.cost
			WHERE
			post.id = NEW.executor_post_id;
		end if;
	end if;
	RETURN NEW;
end;
$$ LANGUAGE plpgsql;




CREATE
OR REPLACE FUNCTION update_bor_quantity() RETURNS TRIGGER AS $$
	DECLARE
		reactor record;
	begin	
	FOR reactor IN (
		SELECT
		*
		FROM
		microreactor_type
		JOIN microreactor_in_spaceship ON microreactor_in_spaceship.microreactor_type_id = microreactor_type.id
		JOIN spaceship ON microreactor_in_spaceship.spaceship_id = NEW.id
	) LOOP
		raise notice 'selected %', reactor;
		IF (
			SELECT
			b2_h6_consumption_rate
			FROM
			microreactor_type
			WHERE
			microreactor_type.id = reactor.id
		) < NEW.b2_h6_quantity THEN
			
			DELETE FROM
			microreactor_in_spaceship
			WHERE
			microreactor_in_spaceship.microreactor_type_id = reactor.id
			AND
			microreactor_in_spaceship.spaceship_id = NEW.id;
		END IF;

		IF (
			SELECT
			b5_h12_consumption_rate
			FROM
			microreactor_type
			WHERE
			microreactor_type.id = reactor.id
		) < NEW.b5_h12_quantity THEN
			
			DELETE FROM
			microreactor_in_spaceship
			WHERE
			microreactor_in_spaceship.microreactor_type_id = reactor.id
			AND
			microreactor_in_spaceship.spaceship_id = NEW.id;
		END IF;

		IF (
			SELECT
			b10_h14_consumption_rate
			FROM
			microreactor_type
			WHERE
			microreactor_type.id = reactor.id
		) < NEW.b10_h14_quantity THEN
			
			DELETE FROM
			microreactor_in_spaceship
			WHERE
			microreactor_in_spaceship.microreactor_type_id = reactor.id
			AND
			microreactor_in_spaceship.spaceship_id = NEW.id;
		END IF;

		IF (
			SELECT
			b12_h12_consumption_rate
			FROM
			microreactor_type
			WHERE
			microreactor_type.id = reactor.id
		) < NEW.b12_h12_quantity THEN
			
			DELETE FROM
			microreactor_in_spaceship
			WHERE
			microreactor_in_spaceship.microreactor_type_id = reactor.id
			AND
			microreactor_in_spaceship.spaceship_id = NEW.id;
		END IF;


		IF (
			SELECT
			COUNT(*)
			FROM
			microreactor_in_spaceship
			WHERE
			microreactor_in_spaceship.spaceship_id = NEW.id AND microreactor_in_spaceship.microreactor_type_id = reactor.id
		) = 0 THEN
			DELETE FROM
			spaceship
			WHERE
			spacehip.id = NEW.id;
		END IF;
	END LOOP;
	RETURN NEW;
end;
$$ LANGUAGE plpgsql;



CREATE
OR REPLACE FUNCTION complete_task(task_id integer) RETURNS integer AS $$ begin
	UPDATE 
	task
	SET
	state = 'complete'
	WHERE
	task.id = task_id;
	RETURN 0;
end;
$$ LANGUAGE plpgsql;



CREATE
OR REPLACE FUNCTION send_robot() RETURNS TRIGGER AS $$ begin
	if (NEW.asteroid_id IS NOT NULL) then
		UPDATE
		robot
		SET
		NEW.hit_points = OLD.hit_points - 0.05 * (
			SELECT
			distance
			FROM
			asteroid
			WHERE
			asteroid.id = NEW.asteroid_id
		);
	else
		UPDATE
		robot
		SET
		NEW.hit_points = OLD.hit_points - 0.05 * (
			SELECT
			distance
			FROM
			asteroid
			WHERE
			asteroid.id = OLD.asteroid_id
		);
	end if;	

	if (
		NEW.hit_points <= 0
	) then
		DELETE FROM
		robot
		WHERE 
		robot.id = NEW.id;
	end if;

	RETURN NEW;
end;
$$ LANGUAGE plpgsql;




CREATE
OR REPLACE FUNCTION create_task(description_param varchar, state_param varchar, creator_id integer, executor_id integer, cost_param integer) RETURNS integer AS $$ begin
	
	INSERT INTO
	task (description, state, creator_post_id, executor_post_id, cost)
	VALUES
	(description_param, state_param, creator_id, executor_id, cost_param);
	RETURN 0;
end;
$$ LANGUAGE plpgsql;



CREATE
OR REPLACE FUNCTION take_task(task_id integer, post_id integer) RETURNS integer AS $$ begin

	UPDATE
	task
	SET
	executor_post_id = post_id
	WHERE
	task.id = task_id;	
	RETURN 0;
end;
$$ LANGUAGE plpgsql;



CREATE
OR REPLACE FUNCTION extracting_damage(robot_id integer) RETURNS integer AS $$ begin

	UPDATE
	robot
	SET
	robot.hit_points = robot.hit_points - 3
	WHERE
	robot.id = robot_id;

	if (
		SELECT
		robot.hit_points
		FROM
		robot
		WHERE
		robot.id = robot_id
	) <= 0 then
		DELETE FROM
		robot
		WHERE
		robot.id = robot_id;
  end if;
	RETURN 0;
end;
$$ LANGUAGE plpgsql;
