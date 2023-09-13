CREATE TABLE "Departments" (
  "id" integer PRIMARY KEY,
  "EmployeeID" "int(Foreign key, refrences Employees)",
  "orders" varchar,
  "marketing" varchar,
  "accounting" varchar,
  "administration" varchar,
  "created_at" timestamp
);

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

ALTER TABLE "Employees" ADD FOREIGN KEY ("id") REFERENCES "Departments" ("id");

ALTER TABLE "Departments" ADD FOREIGN KEY ("EmployeeID") REFERENCES "Employees" ("id");

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
