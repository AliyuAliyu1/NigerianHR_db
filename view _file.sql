/* CREATE VIEW employee_summary AS
SELECT
    e.employees_id,
    e.fname,
    e.lname,
    e.age,
    e.contact_add,
    e.emp_email,
    e.full_time,
    e.part_time,
    COALESCE(SUM(leaves_per_day), 0) AS Leaves
FROM employees e
LEFT JOIN (
    SELECT
        employeeID,
        CASE
            WHEN monday OR tuesday OR wednesday OR thursday OR friday OR saturday OR sunday THEN 1
            ELSE 0
        END AS leaves_per_day
    FROM attendance
) a ON e.employees_id = a.employeeID
GROUP BY e.employees_id, e.fname, e.lname, e.age, e.contact_add, e.emp_email, e.full_time, e.part_time;


SELECT * FROM employee_summary; */

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