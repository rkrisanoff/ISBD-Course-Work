CREATE
OR REPLACE FUNCTION limit_robot_hitpoints() RETURNS TRIGGER AS $$ begin if (
    select
        NEW.hit_points
) > (
    select
        max_hit_points
    from
        "body"
    where
        release_series = NEW.body_series
) then NEW.hit_points = (
    select
        max_hit_points
    from
        "body"
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
			NEW.brain_series = positronic_brain.release_series
		)
		WHERE
		department.id IN (
			SELECT
			department.id
			FROM
			robot
			JOIN employee ON robot.operator_id = employee.id
			JOIN post ON post.employee_id = employee.id
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
			NEW.eye_series = eyes_sensors.release_series
		)
		WHERE
		department.id IN (
			SELECT
			department.id
			FROM
			robot
			JOIN employee ON robot.operator_id = employee.id
			JOIN post ON post.employee_id = employee.id
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
			NEW.body_series = body.release_series
		)
		WHERE
		department.id IN (
			SELECT
			department.id
			FROM
			robot
			JOIN employee ON robot.operator_id = employee.id
			JOIN post ON post.employee_id = employee.id
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
			JOIN employee ON robot.operator_id = employee.id
			JOIN post ON post.employee_id = employee.id
			JOIN role ON role.id = post.role_id AND role.can_operate_robot
			JOIN department ON department.id = post.department_id
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
			JOIN microreactor_in_spaceship ON microreactor_type_id = NEW.id
		)
		WHERE
		department.id = (
			SELECT
			department.id
			FROM
			department
			JOIN spaceship ON department.id = spaceship.department_id
			JOIN microreactor_in_spacechip ON microreactor_in_spaceship.spaceship_id = spaceship.id
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
