-- Create Table in Employees Databases
CREATE TABLE employees (
    employee_id VARCHAR(20),
    job_title VARCHAR(100),
    experience_years INT,
    education_level VARCHAR(50),
    skills_count INT,
    industry VARCHAR(100),
    company_size VARCHAR(50),
    location VARCHAR(100),
    remote_work VARCHAR(20),
    certifications INT,
    salary NUMERIC(12,2)
);
--Loaded employee salary data from a CSV file into PostgreSQL 
--and created a structured database table for analysis.
--This step enabled efficient querying, reporting, and salary prediction modeling.
-- Show All Data
select * from employees;




-- 1. What is the max , average and min salary of employees across the organization?

select max(salary) as maximum_salary,
       round(avg(salary),2) as average_salary,
	   min(salary) as minimum_salary      
from employees;


-- 2. Which job title has the highest average salary?

SELECT job_title,
       ROUND(AVG(salary),2) AS avg_salary
FROM employees
GROUP BY job_title
ORDER BY avg_salary DESC
LIMIT 8;



--3. How does salary vary with experience

SELECT experience_years,
       ROUND(AVG(salary),2) AS avg_salary
FROM employees
GROUP BY experience_years
ORDER BY experience_years 
limit 10;



-- 4. Which education level receive highest salary
SELECT education_level,
       ROUND(max(salary),2) AS max_salary
FROM employees
GROUP BY education_level
ORDER BY max_salary DESC;




-- 5. Does skill count impact salary

select skills_count,
       round(avg(salary) , 2) as avg_salary
from employees 
group by skills_count
order by avg_salary
limit 10;





-- 6. Which Industry pay highest salary

select industry,
       round(max(salary) ,2) as highest_salary
from employees 
group by industry
order by highest_salary;



--7. Rank Employees by salary
SELECT employee_id,
       job_title,
       salary,
       RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employees;



-- 8. Top paid employee in each industry
SELECT *
FROM (
    SELECT employee_id,
           industry,
           salary,
           ROW_NUMBER() OVER(
               PARTITION BY industry
               ORDER BY salary DESC
           ) AS rn
    FROM employees
) t
WHERE rn = 1;

--9. Experience Category Analysis
SELECT
CASE
    WHEN experience_years < 3 THEN 'Beginner'
    WHEN experience_years < 7 THEN 'Intermediate'
    ELSE 'Expert'
END AS experience_level,
ROUND(AVG(salary),2) AS avg_salary
FROM employees
GROUP BY experience_level;


-- 10. Salary Categories Segmentation

SELECT employee_id,
       job_title,
       salary,
       CASE
           WHEN salary < 150000 THEN 'Low'
           WHEN salary < 200000 THEN 'Medium'
           ELSE 'High'
       END AS salary_category
FROM employees;



-- 11. Top 2 Highest Paid Employees in Each Job Role
SELECT *
FROM (
    SELECT employee_id,
           job_title,
           salary,
           ROW_NUMBER() OVER(
               PARTITION BY job_title
               ORDER BY salary DESC
           ) AS rn
    FROM employees
) t
WHERE rn < 3;


--12. Running Salary Analysis
SELECT employee_id,
       industry,
	   experience_years,
       salary,
       SUM(salary) OVER(
           ORDER BY salary
       ) AS running_total
FROM employees;







-- 13. Highest Salary Gap Analysis

SELECT employee_id,
       industry,
       salary,
       salary - AVG(salary) OVER(PARTITION BY industry) AS salary_gap
FROM employees;









-- 14. Highest Paying Education + Industry Combination
SELECT education_level,
       industry,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY education_level, industry
ORDER BY avg_salary DESC
LIMIT 10;
















































