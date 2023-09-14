DROP TABLE IF EXISTS departments CASCADE;

CREATE TABLE departments (
  departments_id SERIAL PRIMARY KEY,
   orders  varchar(255) DEFAULT NULL,
   marketing  varchar(255) DEFAULT NULL,
   accounting  varchar(255) DEFAULT NULL,
   administration  varchar(255) DEFAULT NULL,
   CONSTRAINT fk_employees_id FOREIGN KEY(employees_id) REFERENCES employees(employees_id),
   created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO departments
(orders, marketing,accounting,administration ) 
VALUES
 ('Sales', 'Advertising', 'Finance', 'HR'),
  ('Shipping', 'Digital Marketing', 'Audit', 'Legal'),
  ('Customer Service', 'Public Relations', 'Taxation', 'Facilities');

DROP TABLE IF EXISTS employees CASCADE;

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

DROP TABLE IF EXISTS JobPositions CASCADE;

CREATE TABLE JobPositions (
  JobPositions_id SERIAL PRIMARY KEY,
  accountants varchar(255) DEFAULT NULL,
  sales_reps varchar(255) DEFAULT NULL,
  dispatch_riders varchar(255) DEFAULT NULL,
  administrators varchar(255) DEFAULT NULL,
  
   created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO JobPositions
( accountants,sales_reps,dispatch_riders,administrators) 
VALUES
('Ahmed', 'Tomas', 'Johna', 'favour'),
('David', 'Emmanuel', 'jude', 'Tolu'),
('Bivan', 'Aroh', 'Saleem', 'Hameed'),
('Tope', 'Mikail', 'Ochiba', 'Excel');


DROP TABLE IF EXISTS pay_roll CASCADE;

CREATE TABLE pay_roll (
  pay_roll_id SERIAL PRIMARY KEY,
  hourly_rate int DEFAULT NULL,
  monthly_rate int DEFAULT NULL,
   created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO pay_roll
( hourly_rate,monthly_rate) 
VALUES
(20.50, 4000.00),
(18.75, 3800.00),
(22.00, 4200.00);

DROP TABLE IF EXISTS activities CASCADE;

CREATE TABLE activities (
  activities_id SERIAL PRIMARY KEY,
  attendance boolean DEFAULT NULL,
  multiple_leaves int DEFAULT NULL,
  training_sessions int DEFAULT NULL,
  CONSTRAINT fk_employees_id FOREIGN KEY(employees_id) REFERENCES employees(employees_id),
   created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO activities
(attendance,multiple_leaves,training_sessions) 
VALUES
(1, 2, 4),
(0, 3, 6),
(1, 1, 0);

DROP TABLE IF EXISTS attendance CASCADE;

CREATE TABLE attendance (
  attendance_id SERIAL PRIMARY KEY,
  monday int DEFAULT NULL,
  tuesday int DEFAULT NULL,
  wednesday int DEFAULT NULL,
  thursday int DEFAULT NULL,
  friday int DEFAULT NULL,
  saturday int DEFAULT NULL,
  sunday int DEFAULT NULL,
 
  CONSTRAINT fk_employees_id FOREIGN KEY(employees_id) REFERENCES employees(employees_id),
   created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO attendance
(  monday,tuesday,wednesday,thursday,friday,saturday,sunday) 
VALUES
(TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE),
(FALSE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE),
(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE);

