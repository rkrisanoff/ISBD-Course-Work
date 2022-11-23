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


CREATE
OR REPLACE FUNCTION task_complete_reward() RETURNS TRIGGER AS $$ begin 
if 
(
	select
		NEW.state
) = 'complete'
then
UPDATE 
department
SET
current_resource = current_resource + NEW.cost
WHERE
department.id = (
	SELECT
	department.id
	FROM
	task
	JOIN post ON task.executor_post_id = post.id AND task.id = NEW.id
	JOIN department ON post.department_id = department.id
);
end if;

return NEW;
end;
$$ LANGUAGE plpgsql;

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

