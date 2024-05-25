## ##########################################
##
## The first step is to create the schema and load the data 
## ###########################################



## ###########################################
-- QUESTION 1
-- Department-wise Employee Count:
# This query determines the number of employees in each department, filtering out departments with fewer than two employees.
## ###########################################


WITH DepartmentEmployeeCount AS (
    SELECT department, COUNT(*) AS employee_count
    FROM employees
    GROUP BY department
    HAVING COUNT(*) >= 2
)
SELECT * FROM DepartmentEmployeeCount;


## ###########################################
-- QUESTION 2
-- Employee Reporting Structure:
## ###########################################

WITH RECURSIVE ReportingStructure AS (
    SELECT employee_id, employee_name, manager_id, department, 0 AS level 
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.employee_name, e.manager_id, e.department, rs.level + 1 
    FROM employees e
    JOIN ReportingStructure rs ON e.manager_id = rs.employee_id
)
SELECT * FROM ReportingStructure;


## ###########################################
# Question 3
-- Top Performing Departments:
#This query identifies the top-performing departments based on the average salary of employees within each department.
## ###########################################


WITH DepartmentAverageSalary AS (
    SELECT department, AVG(s.salary_amount) AS avg_salary
    FROM employees e
    JOIN salaries s ON e.employee_id = s.employee_id
    GROUP BY department
)
SELECT department, avg_salary,
    RANK() OVER (ORDER BY avg_salary DESC) AS department_rank
FROM DepartmentAverageSalary;


## ###########################################
# Question 4
-- Hierarchy Depth Analysis:
-- This query analyzes the depth of the employee hierarchy by calculating the maximum depth of the reporting structure within the organization.
## ###########################################

WITH RECURSIVE HierarchyDepth AS (
    SELECT employee_id, employee_name, manager_id, department, 0 AS depth
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.employee_name, e.manager_id, e.department, hd.depth + 1
    FROM employees e
    JOIN HierarchyDepth hd ON e.manager_id = hd.employee_id
)
SELECT MAX(depth) AS max_hierarchy_depth FROM HierarchyDepth;


## ###########################################
-- QUESTION 5
-- Compare the total amount of each order with the average order amount at the corresponding store.
## ###########################################
-- Note:  Load the Data from the Given CSV File
## ###########################################

WITH avg_per_store AS
  (
	SELECT store, AVG(amount) AS average_order
   FROM dsailva_demo2
   GROUP BY store
)
SELECT o.id, o.store, o.amount, avg.average_order AS avg_for_store
FROM dsailva_demo2 o
JOIN avg_per_store avg
ON o.store = avg.store;

