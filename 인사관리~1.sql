SELECT *
FROM employees;

SELECT SUM(salary), MAX(salary), MIN(salary), AVG(salary)
FROM employees;

SELECT *
FROM employees;

SELECT SUM(salary), MAX(salary), MIN(salary), AVG(salary)
FROM employees
WHERE department_id = 60;

SELECT MIN(last_name), MAX(last_name)
FROM employees; 

SELECT MIN(hire_date), MAX(hire_date)
FROM employees;

SELECT COUNT(*), COUNT(department_id), COUNt(DISTINCT department_id)
FROM employees;

SELECT *
FROM employees;

SELECT AVG(commission_pct), AVG(NVL(commission_pct,0))
FROM employees;

--GROUP BY ���� ���
SELECT department_id, SUM(salary), COUNT(*)
FROM employees
GROUP BY department_id
ORDER BY 1;

SELECT department_id, job_id, SUM(salary), COUNT(*)
FROM employees
GROUP BY department_id, job_id
ORDER BY 1, job_id;

SELECT department_id, job_id, SUM(salary), COUNT(*)
FROM employees
WHERE department_id >= 50
GROUP BY department_id, job_id
ORDER BY 1, job_id;

--Having

SELECT department_id, job_id, SUM(salary), COUNT(*)
FROM employees
GROUP BY department_id, job_id
HAVING COUNT(*) <> 1
ORDER BY 1, job_id;

--GROUP �Լ��� ��ø
SELECT MAX(SUM(salary))
FROM employees
GROUP BY department_id;

SELECT department_id, MAX(SUM(salary))
FROM employees
GROUP BY department_id;

SELECT employee_id, last_name, department_name
FROM employees, departments;

--JOIN

--1) EQUI-JOIN

SELECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id;

SELECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id;

--Departments �� location �� Equi ������ Ȱ���ؼ� ������ ��ȸ
SELECT d.department_name, d.department_id, l.location_id, l.city
FROM departments d, locations l
WHERE d.location_id = l.location_id;

--NON -EQUI join

SELECT *
FROM job_grades;
SELECT e.employee_id, e.last_name, e.salary, j.grade_level
FROM employees e, job_grades j
WHERE e.salary BETWEEN j.lowest_sal AND HIGHEST_SAL;

SELECT *
FROM jobs;

SELECT *
FROM departments;
-- ����1) ������� �̸�, �μ���ȣ, �μ����� ����϶�
SELECT e.first_name "������� �̸�", d.department_id "�μ���ȣ", d.department_name "�μ���"
FROM employees e, departments d
WHERE e.department_id = d.department_id;
-- ����2) ����̸��� �μ���� ������ ����ϴµ� ������ 3000 �̻��� ����� ����϶�
SELECT e.first_name "����̸�", d.department_name "�μ���", e.salary "����"
FROM employees e , departments d 
WHERE e.department_id = d.department_id and e.salary >= 3000
ORDER BY e.salary;

-- ����1) Ŀ�̼��� �޴� ����� �̸�, ����, �μ���ȣ,�μ����� ����϶�
SELECT e.last_name, e.job_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id and e.commission_pct is not null;

-- ����2) ������ȣ 2500 ���� �ٹ��ϴ� ����� �̸�, ����,�μ���ȣ,�μ����� ����϶�
SELECT e.last_name, e.job_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id and d.location_id = 2500;

-- ����3) �̸��� A�� ���� ������� �̸��� �μ��̸��� ����϶�
SELECT e.first_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id and d.department_name like '%%';

-- ����4) ����̸��� �μ���� ������ ����ϴµ� ������ 3000 �̻��� ����� ����϶�
SELECT e.last_name, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id and e.salary>=3000;

-- ����5) �޿��� 3000���� 5000������ ����� �̸��� �ҼӺμ��� ����϶�
SELECT e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id and salary BETWEEN 3000 AND 5000;

-- ����6) ACCOUNTING �μ� �Ҽ� ����� �̸��� �Ի��� ����϶�
SELECT e.last_name, e.hire_date
FROM employees e, departments d
WHERE e.department_id = d.department_id and d.department_name = 'Accounting';

SELECT *
FROM departments;

SELECT *
FROM employees;
--1
SELECT employee_id, first_name, job_id, hire_date
FROM employees;

--2
SELECT distinct employee_id
FROM employees
WHERE manager_id is not null;

--3
SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE salary BETWEEN 7000 AND 12000 and last_name like 'H%';

--4
SELECT employee_id, first_name, hire_date, substr (email,1,3) AS EMAIL, length(email) AS "EMAIL LENGTH"
FROM employees
WHERE hire_date >= '20050101';

--5
SELECT first_name, hire_date, add_months(hire_date,6), next_day(hire_date,6),TRUNC(MONTHS_BETWEEN(sysdate,hire_date)),LAST_DAY(hire_date)+1 
FROM employees
ORDER BY hire_date;

--6
SELECT employee_id, first_name, TO_CHAR(hire_date,'dd/mm/yyyy day'),TO_CHAR(commission_pct*salary,'$999,999.99') AS ����
FROM employees
WHERE commission_pct is not null
ORDER BY ���� desc;

--7
SELECT employee_id, first_name, job_id, salary, department_id
FROM employees
WHERE department_id IN(50,60) AND salary>5000;

--8
SELECT employee_id, job_id, phone_number, department_id
FROM employees
WHERE SUBSTR(phone_number,1,3)=515;

--9
SELECT employee_id, first_name, NVL2(commission_pct,12*(salary+salary*commission_pct),salary*12) AS ����, TO_CHAR(hire_date,'yyyy'), NVL2(salary*commission_pct,'COMN','NOCOMM') AS ���, department_id
FROM employees
ORDER BY department_id, ����;

--10
SELECT employee_id, first_name, department_id, CASE department_id WHEN 20 THEN 'Canada' WHEN 80 THEN 'UK' ELSE 'USA' END AS �ٹ�����
FROM employees;


--OUTER JOIN

SELECT *
FROM departments LEFT OUTER JOIN employees
ON (departments.department_id = employees.department_id);














































