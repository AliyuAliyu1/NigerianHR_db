CREATE VIEW employee_summary AS
SELECT
    e.employees_id,
    e.fname,
    e.lname,
    e.age,
    e.contact_add,
    e.emp_email,
    e.work_type,
    COALESCE(l.leave_count, 0) AS leaves,
    COALESCE(a.absence_count, 0) AS absences
FROM employees e
LEFT JOIN (
    SELECT employeeID, COUNT(*) AS leave_count
    FROM leaves
    GROUP BY employeeID
) l ON e.employees_id = l.employeeID
LEFT JOIN (
    SELECT employeeID, COUNT(*) AS absence_count
    FROM attendance
    WHERE is_present = FALSE
    GROUP BY employeeID
) a ON e.employees_id = a.employeeID;
SELECT * FROM employee_summary;