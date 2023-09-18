

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
