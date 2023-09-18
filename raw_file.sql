/* 


CREATE TABLE "employees" (
  "employees_id" integer PRIMARY KEY,
  "fname" varchar,
  "lname" varchar,
  "age" integer,
  "contact_add" varchar,
  "emp_email" varchar,
  "full_time" varchar,
  "part_time" varchar,
  "training_sessions" int,
  "multiple_leaves" int,
  "job_positions" int,
  "training_sessionsID" "int(Foreign key, refrences training_sessions)",
  "multiple_leavesID" "int(Foreign key, refrences multiple_leaves)",
  "job_positionsID" "int(Foreign key, refrences job_positions)",
  "created_at" timestamp
);
CREATE TABLE "departments" (
  "departments_id" integer PRIMARY KEY,
  "orders" varchar,
  "marketing" varchar,
  "accounting" varchar,
  "administration" varchar,
  "employeeID" "int(Foreign key, refrences employees)",
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
  "attendance" boolean,
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
 */

 CREATE TABLE "departments" (
  "departments_id" integer PRIMARY KEY,
  "department_name" varchar,
  "created_at" timestamp
);

CREATE TABLE "employees" (
  "employees_id" integer PRIMARY KEY,
  "fname" varchar,
  "lname" varchar,
  "age" integer,
  "contact_add" int,
  "emp_email" varchar,
  "work_type" varchar,
  "attendanceID" "int(Foreign key, refrences attendance)",
  "departmentID" "int(Foreign key, refrences departments)",
  "job_positionsID" "int(Foreign key, refrences job_positions)",
  "created_at" timestamp
);

CREATE TABLE "job_positions" (
  "job_positions_id" integer PRIMARY KEY,
  "position_name" varchar,
  "created_at" timestamp
);

CREATE TABLE "full_time" (
  "full_timeid" integer PRIMARY KEY,
  "monthly_rates" int,
  "employeeID" "int(Foreign key, refrences employees)",
  "created_at" timestamp
);

CREATE TABLE "part_time" (
  "part_timeid" integer PRIMARY KEY,
  "hourly_rates" int,
  "employeeID" "int(Foreign key, refrences employees)",
  "created_at" timestamp
);

CREATE TABLE "leaves" (
  "leaves_id" integer PRIMARY KEY,
  "leave_reason" varchar,
  "leave_start_date" varchar,
  "leave_end_date" varchar,
  "employeeID" "int(Foreign key, refrences employees)",
  "created_at" timestamp
);

CREATE TABLE "training_sessions" (
  "training_sessions_id" integer PRIMARY KEY,
  "session_name" varchar,
  "session_date" varchar,
  "employeeID" "int(Foreign key, refrences employees)",
  "created_at" timestamp
);

CREATE TABLE "attendance" (
  "attendance_id" integer PRIMARY KEY,
  "attendance_date" varchar,
  "is_present" Boolean,
  "employeeID" "int(Foreign key, refrences employees)",
  "created_at" timestamp
);

ALTER TABLE "employees" ADD FOREIGN KEY ("departmentID") REFERENCES "departments" ("departments_id");

ALTER TABLE "employees" ADD FOREIGN KEY ("job_positionsID") REFERENCES "job_positions" ("job_positions_id");

ALTER TABLE "employees" ADD FOREIGN KEY ("attendanceID") REFERENCES "attendance" ("attendance_id");

ALTER TABLE "leaves" ADD FOREIGN KEY ("employeeID") REFERENCES "employees" ("employees_id");

ALTER TABLE "training_sessions" ADD FOREIGN KEY ("employeeID") REFERENCES "employees" ("employees_id");

ALTER TABLE "partime_time" ADD FOREIGN KEY ("employeeID") REFERENCES "employees" ("employees_id");

ALTER TABLE "full_time" ADD FOREIGN KEY ("employeeID") REFERENCES "employees" ("employees_id");
