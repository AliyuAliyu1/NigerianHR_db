CREATE TABLE "departments" (
  "departments_id" integer PRIMARY KEY,
  "orders" varchar,
  "marketing" varchar,
  "accounting" varchar,
  "administration" varchar,
  "employeeID" "int(Foreign key, refrences employees)",
  "created_at" timestamp
);

CREATE TABLE "employees" (
  "employees_id" integer PRIMARY KEY,
  "fname" varchar,
  "lname" varchar,
  "age" integer,
  "contact_add" varchar,
  "emp_email" varchar,
  "full_time" varchar,
  "part_time" varchar,
  "training_sessionsID" "int(Foreign key, refrences training_sessions)",
  "multiple_leavesID" "int(Foreign key, refrences multiple_leaves)",
  "job_positionsID" "int(Foreign key, refrences job_positions)",
  "created_at" timestamp
);

CREATE TABLE "job_positions" (
  "job_positions_id" integer PRIMARY KEY,
  "accountants" varchar,
  "sales_reps" varchar,
  "dispatch_riders" varchar,
  "administrators" varchar,
  "created_at" timestamp
);

CREATE TABLE "pay_roll" (
  "pay_roll_id" integer PRIMARY KEY,
  "hourly_rate" int,
  "monthly_rate" int,
  "created_at" timestamp
);

CREATE TABLE "activities" (
  "activities_id" integer PRIMARY KEY,
  "attendance" bo0lean,
  "employeeID" "int(Foreign key, refrences employees)",
  "multiple_leaves" int,
  "training_sessions" int,
  "created_at" timestamp
);

CREATE TABLE "attendance" (
  "attendance_id" integer PRIMARY KEY,
  "employeeID" "int(Foreign key, refrences employees)",
  "monday" varchar,
  "tuesday" varchar,
  "wednesday" varchar,
  "thursday" varchar,
  "friday" varchar,
  "saturday" varchar,
  "sunday" varchar,
  "created_at" timestamp
);

ALTER TABLE "employees" ADD FOREIGN KEY ("employees_id") REFERENCES "departments" ("departments_id");

ALTER TABLE "employees" ADD FOREIGN KEY ("employees_id") REFERENCES "job_positions" ("job_positions_id");

ALTER TABLE "job_positions" ADD FOREIGN KEY ("job_positions_id") REFERENCES "employees" ("job_positionsID");

ALTER TABLE "pay_roll" ADD FOREIGN KEY ("hourly_rate") REFERENCES "employees" ("part_time");

ALTER TABLE "employees" ADD FOREIGN KEY ("part_time") REFERENCES "pay_roll" ("pay_roll_id");

ALTER TABLE "pay_roll" ADD FOREIGN KEY ("monthly_rate") REFERENCES "employees" ("full_time");

ALTER TABLE "employees" ADD FOREIGN KEY ("full_time") REFERENCES "pay_roll" ("pay_roll_id");

ALTER TABLE "activities" ADD FOREIGN KEY ("multiple_leaves") REFERENCES "employees" ("employees_id");

ALTER TABLE "activities" ADD FOREIGN KEY ("training_sessions") REFERENCES "employees" ("employees_id");

ALTER TABLE "activities" ADD FOREIGN KEY ("multiple_leaves") REFERENCES "employees" ("multiple_leavesID");

ALTER TABLE "employees" ADD FOREIGN KEY ("training_sessionsID") REFERENCES "activities" ("training_sessions");

ALTER TABLE "attendance" ADD FOREIGN KEY ("attendance_id") REFERENCES "employees" ("employees_id");

ALTER TABLE "employees" ADD FOREIGN KEY ("employees_id") REFERENCES "attendance" ("employeeID");

ALTER TABLE "departments" ADD FOREIGN KEY ("employeeID") REFERENCES "employees" ("employees_id");
