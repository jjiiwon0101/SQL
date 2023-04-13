
-- �� ��ȯ �Լ� TO_CHAR, TO_NUMBER , TO_DATE

-- ��¥�� ���ڷ� TO_CHAR (��, ����)
SELECT TO_CHAR(sysdate) FROM dual;
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD PM HH:MI:SS') FROM dual;
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD HH24:MI:SS') FROM dual;

-- ����ϰ� ���� ���ڸ� ""�� ���� �����մϴ�.
SELECT first_name, TO_CHAR(hire_date, 'yyyy"��" mm"��" dd"��"')
FROM employees;

-- ���ڸ� ���ڷ� TO_CHAR(��, ����)
SELECT TO_CHAR(20000, '99999') FROM dual;
-- �־��� �ڸ����� ���ڸ� ��� ǥ���� �� ��� ��� #���� ǥ��˴ϴ�.
SELECT TO_CHAR(20000, '9999') FROM dual;
SELECT TO_CHAR(20000.21, '99999.9') FROM dual;
SELECT TO_CHAR(20000, '99,999') FROM dual;

SELECT TO_CHAR(salary, 'L99,999') AS salary
FROM employees;

-- ���ڸ� ���ڷ� TO_NUMBER(��, ����)
SELECT '2000' + 2000 FROM dual; -- �ڵ� �� ��ȯ (���� -> ����)
SELECT TO_NUMBER ('2000') + 2000 FROM dual; -- ����� �� ��ȯ
SELECT '$3,300' + 2000 FROM dual; -- ����
SELECT TO_NUMBER ('$3,300', '$9.999') + 2000 FROM dual;

-- ���ڸ� ��¥�� ��ȯ�ϴ� �Լ� TO_DATE(��, ����)
SELECT TO_DATE('2023-04-13') FROM dual;
SELECT sysdate - TO_DATE('2021-03-26') FROM dual;
SELECT TO_DATE('2020/12/25', 'YY-MM-DD') FROM dual;
-- �־��� ���ڿ��� ��� ��ȯ�ؾ� �մϴ�.
SELECT TO_DATE('2021-03-31 12:23:50',  'YY-MM-DD HH:MI:SS') FROM dual;


-- XXXX�� XX�� XX�� ���ڿ� �������� ��ȯ�� ������.
-- ��ȸ �÷����� dateInfo��� �ϰڽ��ϴ�.
SELECT 
TO_CHAR (
     TO_DATE('20050102', 'YYYY/ MM/ DD'),
     'YYYY"��" MM"��" DD"��"'
) AS dateInfo
FROM dual;

--NULL ���� �Լ� NVL (�÷�, ��ȯ�� Ÿ�ϰ�)
SELECT null FROM dual;
SELECT NVL(null, 0) FROM dual;

SELECT 
     first_name,
     NVL(commission_pct, 0) AS comm_pct
FROM employees;

-- NULL ���� �Լ� NVL2(�÷�, NULL�� �ƴ� ����� ��, NULL�� ����� ��)
SELECT 
   NVL2('abc', '�ξƴ�', '����')
FROM dual;

SELECT 
     first_name,
     NVL2(commission_pct, 'true', 'false')
FROM employees;

SELECT 
      first_name,
      commission-pct,
      NVL2 (commission_pct, salary + (salary * commission_pct), salary) AS real_salary
FROM employees;

-- DECODE (�÷� Ȥ�� ǥ����, �׺�1, ���1, �׸�2, ��� 2...... default)
SELECT
    DECODE('F', 'A', 'A�Դϴ�.', 'B', 'B�Դϴ�', 'C', 'C�Դϴ�.', '�𸣰ڴµ���?')
FROM dual;

SELECT 
      job_id,
      salary,
      DECODE(
           job_i,
           'IT_PROG', salary * 1.1,
           'FI_MRG', salary*1.3,
           'AD_VP', salary*1.3) 
FROM employees;

-- CASE WHEN THEN END
SELECT 
     first_name,
     salary,
     (CASE job_id
         WHEN 'IT_PROG' THEN salary*1.1
         WHEN 'FI_MGR' THEN salary*1.2
         WHEN 'AD_VP' THEN salary*1.3
         WHEN 'FI_ACCOUNT' THEN salary*1.4
         ELSE salary
     END) AS result
FROM employees

--���� 1.
--�������ڸ� �������� EMPLOYEE���̺��� �Ի�����(hire_date)�� �����ؼ� �ټӳ���� 17�� �̻���
--����� ������ ���� ������ ����� ����ϵ��� ������ �ۼ��� ������. 
--���� 1) �ټӳ���� ���� ��� ������� ����� �������� �մϴ�
SELECT 
    hire_date(
FROM employees;

--���� 2.
--EMPLOYEE ���̺��� manager_id�÷��� Ȯ���Ͽ� first_name, manager_id, ������ ����մϴ�.
--100�̶�� �������, 
--120�̶�� �����ӡ�
--121�̶�� ���븮��
--122��� �����塯
--�������� ���ӿ��� ���� ����մϴ�.
--���� 1) manager_id�� 100�� ������� ������θ� ��ȸ�մϴ�



