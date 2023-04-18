--���� 1.
--EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� ( AVG(�÷�) ���)
SELECT
    *
FROM employees
WHERE salary >
    (
    SELECT
    AVG(salary)
    FROM employees
    );
--EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ���
SELECT
    COUNT(*)
FROM employees
WHERE salary > (SELECT AVG(salary)FROM employees);

--EMPLOYEES ���̺��� job_id�� IT_PFOG�� ������� ��ձ޿����� ���� ������� �����͸� ����ϼ���
--SELECT
--    *
--FROM employees
--WHERE salary > ALL
--    (
--    SELECT
--    AVG(salary)
--    FROM employees
--    WHERE job_id = 'IT_PROG'
--    );

SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees
                WHERE job_id = 'IT_PROG');
                
                
--���� 2.
--DEPARTMENTS���̺��� manager_id�� 100�� ����� department_id��
--EMPLOYEES���̺��� department_id�� ��ġ�ϴ� ��� ����� ������ �˻��ϼ���.
SELECT 
    *
FROM employees
WHERE department_id = 
    (
    SELECT manager_id
    FROM departments 
    WHERE manager_id = 100
    );

--���� 3.
--EMPLOYEES���̺��� ��Pat���� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� ����ϼ���
SELECT 
   *
FROM employees e
WHERE manager_id >
    (
    SELECT manager_id
    FROM employees 
    WHERE e.first_name = 'Pat'
    );


--EMPLOYEES���̺��� ��James��(2��)���� manager_id�� ���� ��� ����� �����͸� ����ϼ���.
SELECT 
    *
FROM manager_id IN
    (
    SELECT manager_id
    FROM employees
    WHERE first_name = 'James'
    );


--���� 4.
---EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� �� ��ȣ, �̸��� ����ϼ���
SELECT * FROM
(
SELECT ROWNUM AS rn, tbl.first_name
FROM 
    (
    SELECT * FROM employees
    ORDER BY first_name DESC;
    )tbl
 )  
 WHERE rn BETWEEN 41 AND 50;
    
--���� 5.
---EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� �� ��ȣ, ���id, �̸�, ��ȣ, 
--�Ի����� ����ϼ���.
SELECT * FROM
 (
 SELECT ROWNUM AS rn, tbl.* FROM
    (
    SELECT employee_id, first_name, phone_number, hire_date
    FROM employees
    ORDER BY hire_date ASC
    ) tbl
 )
WHERE rn > 30 AND rn <= 40;

--���� 6.
--employees���̺� departments���̺��� left �����ϼ���
--����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
--����) �������̵� ���� �������� ����
SELECT
    e.department_id, 
    CONCAT(first_name, last_name) AS �̸�,
    e.department_id,
    d.department_name
FROM employees e
LEFT JOIN department d
ON e.department_id = d.department_id
ORDER BY employee_id ASC;

--���� 7.
--���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
SELECT 
    department_id, 
    CONCAT(first_name, last_name) AS �̸�,
    e.department_id,
    (
    SELECT
    FROM departments d
    WHERE d.department_id = e.department_id
    )AS department_name
FROM employees e
ORDER BY employee_id ASC;

--���� 8.
--departments���̺� locations���̺��� left �����ϼ���
--����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, ��Ʈ��_��巹��, ����Ż �ڵ�, ��Ƽ �� ����մϴ�
--����) �μ����̵� ���� �������� ����
SELECT
    d.department_id, 
    d.department_name,
    d.manager_id,
    d.location_id, 
    loc.street_address, 
    loc.postal_code, 
    loc.city
FROM departments d
LEFT JOIN locations loc
ON d.location_id = loc.location_id
ORDER BY department_id ASC;

--���� 9.
--���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
SELECT d.department_id, d.department_name, d.manager_id, d.location_id,
    (SELECT loc.location_id
     FROM locations loc
     WHERE loc.location_id = d.location_id),
    (SELECT loc.street_address
      FROM locations loc
      WHERE loc.location_id = d.location_id),
     (SELECT loc.postal_code
      FROM locations loc
      WHERE loc.location_id = d.location),
      (SELECT loc.city
FROM departments d
ORDER BY d.department_id ASC;


--���� 10.
--locations���̺� countries ���̺��� left �����ϼ���
--����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_name �� ����մϴ�
--����) country_name���� �������� ����
--���� 11.
--���� 10�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���

