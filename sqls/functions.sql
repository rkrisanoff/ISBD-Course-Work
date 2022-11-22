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