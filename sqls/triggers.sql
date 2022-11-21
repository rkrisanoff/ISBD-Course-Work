CREATE FUNCTION update_department_money(cost integer, department_id integer) RETURNS integer
LANGUAGE
plpgsql
AS
$$
begin
	UPDATE
	department
	SET
	current_resource = cost
	WHERE
	department.id = department_id;
	RETURN 0;
end;
$$

