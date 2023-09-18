-- Create a function named show_employee_payroll
CREATE OR REPLACE FUNCTION show_employee_payroll(
  employee_id INT,
  period_start DATE,
  period_end DATE
) RETURNS TABLE (
  fname VARCHAR(255),
  lname VARCHAR(255),
  work_type VARCHAR(255),
  total_salary NUMERIC
) AS $$
BEGIN
  RETURN QUERY
  SELECT
    e.fname,
    e.lname,
    e.work_type,
    CASE
      WHEN e.work_type = 'full time' THEN f.monthly_rates
      WHEN e.work_type = 'part time' THEN (p.hourly_rates * hours_worked.total_hours)
      ELSE 0::NUMERIC -- Ensure a consistent data type for the total_salary column
    END AS total_salary
  FROM employees e
  LEFT JOIN full_time f ON e.employees_id = f.employeeID
  LEFT JOIN part_time p ON e.employees_id = p.employeeID
  LEFT JOIN (
    SELECT
      a.employeeID,
      SUM(CASE WHEN a.is_present = TRUE THEN 1 ELSE 0 END) AS total_hours
    FROM attendance a
    WHERE a.employeeID = employee_id
      AND a.attendance_date::DATE BETWEEN period_start AND period_end
    GROUP BY a.employeeID
  ) AS hours_worked ON e.employees_id = hours_worked.employeeID;
END;
$$ LANGUAGE plpgsql;


-- Example usage of the function
SELECT * FROM show_employee_payroll(1, '2022-12-01', '2022-12-31');