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


SELECT * FROM employee_summary;