# Write your MySQL query statement below
SELECT IF(COUNT(DISTINCT(Employee.Salary)) < 2, NULL, (
  SELECT Salary as SecondHighestSalary FROM Employee
  ORDER BY Salary DESC
  LIMIT 1
  OFFSET 1
)) AS SecondHighestSalary
FROM Employee
