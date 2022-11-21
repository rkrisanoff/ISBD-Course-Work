CREATE FUNCTION update_department_resource(task_id integer) RETURNS integer
LANGUAGE
plpgsql
AS
$$
DECLARE
	task_cost integer;
begin
	SELECT
	cost
	INTO
	task_cost
	FROM
	task
	WHERE
	task.id = task_id;

	UPDATE
	department
	SET
	current_resource = task_cost
	WHERE
	department.id = (
		SELECT
		department.id
		FROM
		task
		JOIN post ON task.executor_id = post.employee_id and task.id = task_id
		JOIN department ON post.department.id = post.department_id
	)
	RETURN 0;
end;
$$;

CREATE TRIGGER task_update
	AFTER UPDATE OF state ON task
	FOR EACH ROW
	WHEN (NEW.state = "complete")
	EXECUTE FUNCTION update_department_resource(NEW.id);
