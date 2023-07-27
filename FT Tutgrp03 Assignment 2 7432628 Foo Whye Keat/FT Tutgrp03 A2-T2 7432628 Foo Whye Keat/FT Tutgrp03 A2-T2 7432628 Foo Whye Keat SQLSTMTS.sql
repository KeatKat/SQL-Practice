/* A2T2 Q1 */
SELECT employee_id, first_name, last_name, job_title, email
FROM employee
WHERE department_name IN (SELECT department_name
						  FROM department
						  WHERE country_name IN (SELECT country_name
												 FROM country
												 WHERE region_name = "Asia"));
                       
                       
/* A2T2 Q2 */
SELECT employee_id, first_name, last_name, job_title, supervisor_id
FROM employee
WHERE employee_id IN (SELECT employee_id
					  FROM jobhistory
					  WHERE DATEDIFF(end_date, start_date) > (365*3)
                      AND department_name = "Information Technology");
                      
/* A2T2 Q3 */

SELECT e.employee_id, e.first_name, e.last_name, e.hire_date, e.salary, COUNT(m.supervisor_id)
FROM employee e
INNER JOIN employee m ON
	e.employee_id = m.supervisor_id
GROUP BY e.employee_id
HAVING COUNT(m.supervisor_id) >= 8;

/* A2T2 Q4 */
DELETE FROM jobhistory
WHERE employee_id = 114;

UPDATE department
SET manager_id = 100
WHERE manager_id = 114;

UPDATE employee
SET supervisor_id = 100
WHERE supervisor_id = 114;

DELETE FROM employee
WHERE employee_id = 114;

/* A2T2 Q5 */
INSERT INTO job
VALUE ("VIP Customer Relations", 6000, 18000);

INSERT INTO employee
VALUE (888, "Pamela", "Anderson", "pam.anderson@mail.com", NULL, 20181018,
 "VIP Customer Relations", 8880, NULL, 204, "Public Relations");
 













 


 