CREATE TABLE "robot" (
  "id" serial PRIMARY KEY,
  "brain_series" integer,
  "operator_id" integer ,
  "body_series" integer NOT NULL,
  "eye_series" integer NOT NULL,
  "hit_points" integer NOT NULL  CHECK ("hit_points" > 0),
  "asteroid_id" integer
);

CREATE TABLE "positronic_brain" (
  "release_series" serial PRIMARY KEY,
  "name" varchar(255) NOT NULL,
  "speed" int NOT NULL,
  "cost" int NOT NULL CHECK ("cost" > 0)
);

CREATE TABLE "body" (
  "release_series" serial PRIMARY KEY,
  "name" varchar(255),
  "max_hit_points" integer CHECK ("max_hit_points" > 0),
  "cost" int NOT NULL CHECK ("cost" > 0)
);

CREATE TABLE "eyes_sensors" (
  "release_series" serial PRIMARY KEY,
  "name" varchar(255),
  "distance" int CHECK ("distance" >= 0),
  "cost" int NOT NULL
);

CREATE TABLE "task" (
  "id" serial PRIMARY KEY,
  "description" varchar(1023),
  "state" varchar(255),
  "creator_post_id" integer,
  "executor_post_id" integer,
  "cost" integer NOT NULL CHECK ("cost" >= 0)
);

CREATE TABLE "role" (
  "id" serial PRIMARY KEY,
  "name" varchar(255) NOT NULL,
  "salary" int NOT NULL CHECK ("salary" >= 0),
  "can_operate_robot" boolean NOT NULL
);

CREATE TABLE "employee" (
  "id" serial PRIMARY KEY,
  "name" varchar(255),
  "age" integer,
  "gender" varchar(6) CHECK ("gender" = 'male' OR "gender" = 'female')
);

CREATE TABLE "asteroid" (
  "id" serial PRIMARY KEY,
  "name" varchar(255), 
  "distance" integer CHECK ("distance" > 0)
);

CREATE TABLE "deposit" (
  "id" serial PRIMARY KEY,
  "asteroid_id" integer NOT NULL,
  "bor_quantity" integer NOT NULL  CHECK ("bor_quantity" > 0)
);

CREATE TABLE "microreactor_type" (
  "id" serial PRIMARY KEY,
  "name" varchar(255) NOT NULL,
  "b2_h6_consumption_rate" integer NOT NULL CHECK ("b2_h6_consumption_rate" >= 0),
  "b5_h12_consumption_rate" integer NOT NULL CHECK ("b5_h12_consumption_rate" >= 0),
  "b10_h14_consumption_rate" integer NOT NULL CHECK ("b10_h14_consumption_rate" >= 0),
  "b12_h12_consumption_rate" integer NOT NULL CHECK ("b12_h12_consumption_rate" >= 0),
  "cost" integer NOT NULL CHECK ("cost" >= 0)
);

CREATE TABLE "microreactor_in_spaceship" (
  "microreactor_type_id" integer NOT NULL,
  "spaceship_id" integer NOT NULL,
  "deploy_date" date,
  PRIMARY KEY("microreactor_type_id","spaceship_id")
);

CREATE TABLE "spaceship" (
  "id" serial PRIMARY KEY,
  "b2_h6_quantity" integer NOT NULL CHECK("b2_h6_quantity">=0),
  "b5_h12_quantity" integer NOT NULL CHECK("b5_h12_quantity">=0),
  "b10_h14_quantity" integer NOT NULL CHECK("b10_h14_quantity">=0),
  "b12_h12_quantity" integer NOT NULL CHECK("b12_h12_quantity">=0),
  "department_id" integer NOT NULL,
  "income" integer NOT NULL CHECK("income" >= 0)
);

CREATE TABLE "post" (
  "id" serial PRIMARY KEY,
  "employee_id" integer NOT NULL ,
  "role_id" integer NOT NULL,
  "department_id" integer NOT NULL,
  "premium" integer NOT NULL CHECK("premium" >= 0),
  UNIQUE("employee_id","role_id","department_id")
);

CREATE TABLE "department" (
  "id" serial PRIMARY KEY,
  "extracted_bor_quantity" integer NOT NULL CHECK("extracted_bor_quantity" >= 0),
  "current_resource" integer NOT NULL CHECK("current_resource" >= 0)
);

ALTER TABLE "robot" ADD FOREIGN KEY ("brain_series") REFERENCES "positronic_brain" ("release_series");

ALTER TABLE "robot" ADD FOREIGN KEY ("operator_id") REFERENCES "employee" ("id");

ALTER TABLE "robot" ADD FOREIGN KEY ("body_series") REFERENCES "body" ("release_series");

ALTER TABLE "robot" ADD FOREIGN KEY ("eye_series") REFERENCES "eyes_sensors" ("release_series");

ALTER TABLE "robot" ADD FOREIGN KEY ("asteroid_id") REFERENCES "asteroid" ("id");

ALTER TABLE "task" ADD FOREIGN KEY ("creator_post_id") REFERENCES "post" ("id");

ALTER TABLE "task" ADD FOREIGN KEY ("executor_post_id") REFERENCES "post" ("id");

ALTER TABLE "deposit" ADD FOREIGN KEY ("asteroid_id") REFERENCES "asteroid" ("id");

ALTER TABLE "microreactor_in_spaceship" ADD FOREIGN KEY ("microreactor_type_id") REFERENCES "microreactor_type" ("id");

ALTER TABLE "microreactor_in_spaceship" ADD FOREIGN KEY ("spaceship_id") REFERENCES "spaceship" ("id");

ALTER TABLE "spaceship" ADD FOREIGN KEY ("department_id") REFERENCES "department" ("id");

ALTER TABLE "post" ADD FOREIGN KEY ("employee_id") REFERENCES "employee" ("id");

ALTER TABLE "post" ADD FOREIGN KEY ("role_id") REFERENCES "role" ("id");

ALTER TABLE "post" ADD FOREIGN KEY ("department_id") REFERENCES "department" ("id");
