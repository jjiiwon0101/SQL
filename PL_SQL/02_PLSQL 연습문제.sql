


SET SERVEROUTPUT ON;
-- 1. ������ �� 3���� ����ϴ� �͸� ����� ����� ����.
DECLARE
    A1 NUMBER := 3*1;
    A2 NUMBER := 3*2;
    A3 NUMBER := 3*3;
    A4 NUMBER := 3*4;
    A5 NUMBER := 3*5;
    A6 NUMBER := 3*6;
    A7 NUMBER := 3*7;
    A8 NUMBER := 3*8;
    A9 NUMBER := 3*9;
BEGIN
    DBMS_OUTPUT.put_line('3x1: ' || TO_CHAR(A1));
    DBMS_OUTPUT.put_line('3x2: ' || TO_CHAR(A2));
    DBMS_OUTPUT.put_line('3x3: ' || TO_CHAR(A3));
    DBMS_OUTPUT.put_line('3x4: ' || TO_CHAR(A4));
    DBMS_OUTPUT.put_line('3x5: ' || TO_CHAR(A5));
    DBMS_OUTPUT.put_line('3x6: ' || TO_CHAR(A6));
    DBMS_OUTPUT.put_line('3x7: ' || TO_CHAR(A7));
    DBMS_OUTPUT.put_line('3x8: ' || TO_CHAR(A8));
    DBMS_OUTPUT.put_line('3x9: ' || TO_CHAR(A9));

END;


-- 2. employees ���̺��� 201�� ����� �̸��� �̸��� �ּҸ� ����ϴ�
-- �͸����� ����� ����. (������ ��Ƽ� ����ϼ���.)
DECLARE
    v_emp_name employees.first_name%TYPE;
    v_emp_email employees.email%TYPE;
BEGIN
    SELECT
        first_name || ' ' || last_name,
        email
    INTO 
        v_emp_name, v_emp_email
    FROM employees e
    WHERE employee_id = 201;
    dbms_output.put_line(v_emp_name || '-' || v_emp_email);

END;



-- 3. employees ���̺��� �����ȣ�� ���� ū ����� ã�Ƴ� �� (MAX �Լ� ���)
-- �� ��ȣ + 1������ �Ʒ��� ����� emps ���̺�
-- employee_id, last_name, email, hire_date, job_id�� �ű� �����ϴ� �͸� ����� ���弼��.
-- SELECT�� ���Ŀ� INSERT�� ����� �����մϴ�. 

/*
<�����>: steven
<�̸���>: stevenjobs
<�Ի�����>: ���ó�¥
<JOB_ID.: CEO
*/
DECLARE
    emp_max employees.employee_id%TYPE;
BEGIN
    SELECT
        MAX(employee_id)+1
    INTO emp_max
    FROM employees e;
    
    INSERT INTO emps
        (employee_id, last_name, email, hire_date, job_id)
    VALUES (emp_max, 'Steven', 'stevenjobs', sysdate, 'CEO');
    
    COMMIT;
    
END;

SELECT * FROM emps;



