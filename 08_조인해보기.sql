/*
# �����̶�?
- ���� �ٸ� ���̺��� ������ ���谡 �����Ͽ�
1�� �̻��� ���̺��� �����͸� ��ȸ�ϱ� ���� ����մϴ�.

SELECT �÷�����Ʈ FROM ���� ����� �Ǵ� ���̺� (1�� �̻�)
WHERE ���� ���� -> ����Ŭ ����
*/

-- employees ���̺��� �μ� id�� ��ġ�ϴ� departments�� ���̺��� �μ� id�� ã�Ƽ�
-- SELECT ���Ͽ� �ִ� �÷����� ����ϴ� ������.
SELECT
    first_name, last_name, hire_date,
    salary, job_id, e.department_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id; -- ����Ŭ ����

SELECT
    first_name, last_name, hire_date,
    salary, job_id, e.department_id, department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id; --ANSI ǥ�� ���� ����

/*
������ ���̺� ���������� �����ϴ��÷��� ��쿡��
���̺� �̸��� �����ص� �����մϴ�. �ױ׷���, �ؼ��� ��Ȯ���� ����
���̺� �̸��� �ۼ��ϼż� �Ҽ��� ǥ���� �ִ� ���� �ٶ����մϴ�.
���̺� �̸��� �ʹ� �� �ÿ��� ALIAS�� �ۼ��Ͽ� Ī�մϴ�.
�� ���̺� ��� ������ �ִ� �÷��� ��� �ݵ�� ����� �ּž� �մϴ�.
*/

-- 3���� ���̺��� �̿��� ���� ���� (INNER JOIN)
--���� ���� : �� ���̺� ��ο��� ��ġ�ϴ� ���� ���� �ุ ��ȯ.
SELECT
    e.first_name, e.last_name, e.department_id,
    d.department_name,
    j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;


SELECT
    e.first_name, e.last_name,
    d.department_id, d.department_name,
    j.job_title,
    loc.city
FROM 
    employees e,
    departments d,
    jobs j,
    locations loc
WHERE
     e.department_id = d.department_id
AND 
    e.job_id = j.job_id --3, 4
AND 
    d.location_id = loc.location_id --2
AND
    loc.state_province = 'California' --1


/*
1. loc ���̺��� province = 'California' ���ǿ� �´� ���� �������
2. location_id ���� ���� ���� ������ �����͸�
   departments���� ã�Ƽ� ����
3. ���� ����� ������ department_id�� ����
    employees ���̺��� �����͸� ã�Ƽ� ����
4. ���� ����� jobs ���̺��� ���Ͽ� �����ϰ� ���� ����� ���.
*/