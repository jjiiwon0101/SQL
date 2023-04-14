-- �׷� �Լ� AVG, MAX, MIN, SUM, COUNT

SELECT
     AVG(salary),
     MAX(salary),
     MIN(salary),
     SUM(salary),
     COUNT(salary)
FROM employees;

SELECT  COUNT(*) FROM employees; -- �� �� �������� ��
SELECT  COUNT(first_name) FROM employees;
SELECT  COUNT(commission_pct) FROM employees; -- null�� �ƴ� ���� ��
SELECT  COUNT(manager_id) FROM employees;-- null�� �ƴ� ���� ��

-- �μ����� �׷�ȭ, �׷��Լ� ���
SELECT
     department_id,
     AVG(salary)
FROM employees
GROUP BY department_id;

-- ������ �� 
-- �׷� �Լ��� �Ϲ� �÷��� ���ÿ� �׳� ����� ���� �����ϴ�.
SELECT
     department_id,
     AVG(salary)
FROM employees;
 -- ������ �߻��ϴ� �ڵ�

-- GROUP BY���� ����� �� GROUP���� ������ ������ �ٸ� �÷��� ��ȸ�� �� �����ϴ�.
SELECT
     job_id,
     department_id,
     AVG(salary)
FROM employees
GROUP BY department_id;

-- GROUP BY�� 2�� ���
SELECT
     job_id,
     department_id,
     AVG(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

-- GROUP BY�� ���� �׷�ȭ�� �� �� ������ �� ��� HAVING�� ���
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;


SELECT
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 20;

-- �μ� ���̵� 50 �̻��� �͵��� �׷�ȭ ��Ű��, �׷� ���� ����� 5000 �̻� ��ȸ
SELECT
     department_id, -- ��ȸ�� 
     AVG(salary) AS ��� --�޿� ��� ��ȸ
FROM employees -- EMPLOYEES���� ��ȸ
WHERE department_id >= 50 -- ����
GROUP BY department_id --�׷�ȭ
HAVING AVG(salary) >= 5000 --����
ORDER BY department_id DESC; --����

--���� 1.
--��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
--��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���
SELECT
    job_id, -- ��ȸ�� ���̵� ��� 
    COUNT(*) AS �����  
FROM employees
GROUP BY job_id;

SELECT
    job_id, -- ��ȸ�� ���̵� ��� 
    AVG(salary) AS �������    
FROM employees
GROUP BY job_id
ORDER BY ������� DESC;

--���� 2.
--��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���. 
-- TO_CHAR�Լ��� ����ؼ� ������ ��ȯ�մϴ�. �׸��� �װ��� �׷�ȭ �մϴ�.
SELECT 
    hire_date, --�Ի� ����
    TO_CHAR(hire_date, 'yyyy')
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY');

--���� 3.
--�޿��� 5000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. 
--�� �μ� ��� �޿��� 7000�̻��� �μ��� ���
SELECT 
    department_id,
    AVG(salary) --��� �޿�
FROM employees
WHERE AVG(salary) > =5000
GROUP BY department_id
HAVING AVG(salary) >= 7000;

--���� 4.
--��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
--department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
--���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
--���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���.
SELECT
    department_id,
    TRUNC(AVG(salary + (salary*commission_pct)), 2),
    SUM(salary + salary*commission_pct),
    COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;














