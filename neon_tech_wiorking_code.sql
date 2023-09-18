
DROP TABLE IF EXISTS employees CASCADE;

CREATE TABLE employees (
  employees_id SERIAL PRIMARY KEY,
  fname  varchar(255) DEFAULT NULL,
  lname  varchar(255) DEFAULT NULL,
  age  int DEFAULT NULL,
  contact_add  int DEFAULT NULL,
  emp_email  varchar(255) DEFAULT NULL,
  work_type  varchar(255) DEFAULT NULL,
  
  attendance_ID int,
  department_ID int,
  job_positions_ID int, 

  
   created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO employees
( fname,lname , age,contact_add,emp_email , work_type) 
VALUES
  ('John', 'Doe', 30, 090, 'john@example.com', 'full time'),
  ('Jane', 'Smith', 25, 54, 'jane@example.com', 'part time'),
  ('Bob', 'Johnson', 35, 24, 'bob@example.com', 'full time');

  DROP TABLE IF EXISTS departments CASCADE;

CREATE TABLE departments (
   departments_id SERIAL PRIMARY KEY,
   department_name varchar(255) DEFAULT NULL,
   employeeID int,
 
  
   created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO departments
(department_name) 
VALUES
 ('Sales'),
  ('Shipping'),
  ('Accounting'),
  ('Customer Service');

DROP TABLE IF EXISTS job_positions CASCADE;



CREATE TABLE job_positions (
  job_positions_id SERIAL PRIMARY KEY,
  position_name varchar(255) DEFAULT NULL,

   created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO job_positions
( position_name) 
VALUES
('Accountant'),
('Marketer'),
('Designer'),
('Manager');

DROP TABLE IF EXISTS full_time CASCADE;

CREATE TABLE full_time (
  full_timeid SERIAL PRIMARY KEY,
  monthly_rates int DEFAULT NULL,
  employeeID int,
  

   created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO full_time
( monthly_rates) 
VALUES
( 4000),
( 3800),
( 4200);

DROP TABLE IF EXISTS part_time CASCADE;

CREATE TABLE part_time (
  part_timeid SERIAL PRIMARY KEY,

  hourly_rates int DEFAULT NULL,
  employeeID int,
  

   created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO part_time
(hourly_rates) 
VALUES
(20),
(18),
(22);



DROP TABLE IF EXISTS leaves CASCADE;

CREATE TABLE leaves (

  leaves_id SERIAL PRIMARY KEY,
  leave_reason varchar(255) DEFAULT NULL,
  leave_start_date varchar(255) DEFAULT NULL,
  leave_end_date varchar(255) DEFAULT NULL,
   employeeID int,


   created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO leaves
(leave_reason,leave_start_date,leave_end_date) 
VALUES
('sick', '12/1/2022', '12/4/2022'),
('emergency', '12/2/2022', '12/3/2022'),
('visit', '12/8/2022', '12/9/2022');

DROP TABLE IF EXISTS attendance CASCADE;

CREATE TABLE attendance (
  attendance_id SERIAL PRIMARY KEY,
 
  attendance_date varchar(255) DEFAULT NULL,
  is_present boolean DEFAULT NULL,

  employeeID int,


 
   created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO attendance
( attendance_date,is_present) 
VALUES
('12/4/2022', TRUE),
('12/2/2022', TRUE),
('12/8/2022', FALSE);


ALTER TABLE employees
ADD CONSTRAINT training_sessions_fk FOREIGN KEY (attendance_ID) REFERENCES attendance(attendance_id),
ADD CONSTRAINT multiple_leaves_fk FOREIGN KEY (department_ID) REFERENCES departments(departments_id),
ADD CONSTRAINT job_positions_fk FOREIGN KEY (job_positions_ID) REFERENCES job_positions(job_positions_id);

ALTER TABLE attendance
ADD CONSTRAINT employee_fk FOREIGN KEY (employeeID) REFERENCES employees(employees_id);

ALTER TABLE leaves
ADD CONSTRAINT employee_fk FOREIGN KEY (employeeID) REFERENCES employees(employees_id);

ALTER TABLE part_time
ADD CONSTRAINT employee_fk FOREIGN KEY (employeeID) REFERENCES employees(employees_id);

ALTER TABLE full_time
ADD CONSTRAINT employee_fk FOREIGN KEY (employeeID) REFERENCES employees(employees_id);

ALTER TABLE departments
ADD CONSTRAINT employee_fk FOREIGN KEY (employeeID) REFERENCES employees(employees_id);
