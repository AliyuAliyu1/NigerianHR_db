DROP TABLE IF EXISTS departments CASCADE;

CREATE TABLE departments (
  departments_id SERIAL PRIMARY KEY,
   orders  varchar(255) DEFAULT NULL,
   marketing  varchar(255) DEFAULT NULL,
   accounting  varchar(255) DEFAULT NULL,
   administration  varchar(255) DEFAULT NULL,
   CONSTRAINT fk_supplier FOREIGN KEY(employees_id) REFERENCES employees(employees_id),
   created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO departments
(orders, marketing,accounting,administration ) 
VALUES
 ('Sales', 'Advertising', 'Finance', 'HR'),
  ('Shipping', 'Digital Marketing', 'Audit', 'Legal'),
  ('Customer Service', 'Public Relations', 'Taxation', 'Facilities');

DROP TABLE IF EXISTS departments CASCADE;

CREATE TABLE employees (
  employees_id SERIAL PRIMARY KEY,
   fname  varchar(255) DEFAULT NULL,
  lname  varchar(255) DEFAULT NULL,
  age  int DEFAULT NULL,
  contact_add  varchar(255) DEFAULT NULL,
  emp_email  varchar(255) DEFAULT NULL,
  full_time  boolean DEFAULT NULL,
  part_time  boolean DEFAULT NULL,
  
  CONSTRAINT fk_training_sessions FOREIGN KEY(training_sessions_id) REFERENCES training_sessions(training_sessions_id),
  CONSTRAINT fk_multiple_leaves FOREIGN KEY(multiple_leaves_id) REFERENCES multiple_leaves(multiple_leaves_id),
  CONSTRAINT fk_job_positions FOREIGN KEY(job_positions_id) REFERENCES job_positions(job_positions_id),

   created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO employees
(   fname,lname , age,contact_add,emp_email , full_time ,part_time ) 
VALUES
  ('John', 'Doe', 30, '123 Main St', 'john@example.com', 1, 0),
  ('Jane', 'Smith', 25, '456 Elm St', 'jane@example.com', 1, 0),
  ('Bob', 'Johnson', 35, '789 Oak St', 'bob@example.com', 0, 1);



-- CREATE TABLE "Departments" (
--   "id" SERIAL PRIMARY KEY,
--   "EmployeeID" "int(Foreign key, refrences Employees)",
--   "orders" varchar,
--   "marketing" varchar,
--   "accounting" varchar,
--   "administration" varchar,
--   "created_at" timestamp
-- );

CREATE TABLE "Employees" (
  "id" integer PRIMARY KEY,
  "fname" varchar,
  "lname" varchar,
  "age" integer,
  "contact_add" varchar,
  "emp_email" varchar,
  "full_time" varchar,
  "part_time" varchar,
  "training_sessionsID" "int(Foreign key, refrences training_sessions)",
  "multiple_leavesID" "int(Foreign key, refrences multiple_leaves)",
  "JobPositionsID" "int(Foreign key, refrences JobPositions)",
  "created_at" timestamp
);

CREATE TABLE "JobPositions" (
  "id" integer PRIMARY KEY,
  "accountants" varchar,
  "sales_reps" varchar,
  "dispatch_riders" varchar,
  "administrators" varchar,
  "created_at" timestamp
);

CREATE TABLE "pay_roll" (
  "id" integer PRIMARY KEY,
  "hourly_rate" int,
  "monthly_rate" int,
  "created_at" timestamp
);

CREATE TABLE "Activities" (
  "id" integer PRIMARY KEY,
  "Attendance" bollean,
  "EmployeeID" "int(Foreign key, refrences Employees)",
  "multiple_leaves" int,
  "training_sessions" int,
  "created_at" timestamp
);

CREATE TABLE "Attendance" (
  "id" integer PRIMARY KEY,
  "EmployeeID" "int(Foreign key, refrences Employees)",
  "monday" varchar,
  "tuesday" varchar,
  "wednesday" varchar,
  "thursday" varchar,
  "friday" varchar,
  "saturday" varchar,
  "sunday" varchar,
  "created_at" timestamp
);

-- ALTER TABLE "employees" ADD FOREIGN KEY ("employees_id") REFERENCES "departments" ("departments_id");

ALTER TABLE "fk_supplier" ADD FOREIGN KEY("employees_id") REFERENCES "employees" ("employees_id");
 ALTER TABLE "fk_training_sessions" ADD FOREIGN KEY("training_sessions_id") REFERENCES "training_sessions" ("training_sessions_id"),
 ALTER TABLE "fk_multiple_leaves" ADD FOREIGN KEY("multiple_leaves_id") REFERENCES "multiple_leaves" ("multiple_leaves_id"),
  ALTER TABLE "fk_job_positions" ADD FOREIGN KEY("job_positions_id") REFERENCES "job_positions" ("job_positions_id"),

ALTER TABLE "Employees" ADD FOREIGN KEY ("id") REFERENCES "JobPositions" ("id");

ALTER TABLE "JobPositions" ADD FOREIGN KEY ("id") REFERENCES "Employees" ("JobPositionsID");

ALTER TABLE "pay_roll" ADD FOREIGN KEY ("hourly_rate") REFERENCES "Employees" ("part_time");

ALTER TABLE "Employees" ADD FOREIGN KEY ("part_time") REFERENCES "pay_roll" ("id");

ALTER TABLE "pay_roll" ADD FOREIGN KEY ("monthly_rate") REFERENCES "Employees" ("full_time");

ALTER TABLE "Employees" ADD FOREIGN KEY ("full_time") REFERENCES "pay_roll" ("id");

ALTER TABLE "Activities" ADD FOREIGN KEY ("multiple_leaves") REFERENCES "Employees" ("id");

ALTER TABLE "Activities" ADD FOREIGN KEY ("training_sessions") REFERENCES "Employees" ("id");

ALTER TABLE "Activities" ADD FOREIGN KEY ("multiple_leaves") REFERENCES "Employees" ("multiple_leavesID");

ALTER TABLE "Employees" ADD FOREIGN KEY ("training_sessionsID") REFERENCES "Activities" ("training_sessions");

ALTER TABLE "Attendance" ADD FOREIGN KEY ("id") REFERENCES "Employees" ("id");

ALTER TABLE "Employees" ADD FOREIGN KEY ("id") REFERENCES "Attendance" ("EmployeeID");
