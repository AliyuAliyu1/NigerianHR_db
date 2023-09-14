CREATE VIEW employee_summary AS
SELECT
    e.employees_id,
    e.fname,
    e.lname,
    e.age,
    e.contact_add,
    e.emp_email,
    e.full_time,
    e.part_time,
    a.attendance_id AS leaves,
    a.multiple_leaves AS absences
FROM employees e
LEFT JOIN attendance a ON e.employees_id = a.employeeID;

SELECT * FROM employee_summary;