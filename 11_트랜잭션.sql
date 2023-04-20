
-- ����Ŀ�� ���� Ȯ��
SHOW AUTOCOMMIT;

-- ����Ŀ�� ��
SHOW AUTOCOMMIT ON;


SELECT * FROM emps;

INSERT INTO emps
    (employee_id, last_name, email, hire_date, job_id)
VALUES
    (303, 'kim', 'abc1234@naver.com', sysdate, 1800);
    
-- �������� ��� ������ ��������� ��� (���)
-- ���� Ŀ�� �ܰ�� ȸ��(���ư���) �� Ʈ����� ����
ROLLBACK;

-- ���̺�����Ʈ ����.
-- ANSI ǥ�� ������ �ƴϱ� ������ �׷��� ���������� ����.
SAVEPOINT insert_park;
    
    INSERT INTO emps
    (employee_id, last_name, email, hire_date, job_id)
VALUES
    (305, 'park', 'park1234@naver.com', sysdate, 1800);
    
ROLLBACK TO SAVEPOINT insert_park;

-- �������� ��� ������ ��������� ���������� �����ϸ鼭 Ʈ����� ����
-- Ŀ���� ���Ŀ��� ��� ����� ����ϴ��� �ǵ��� �� �����ϴ�.
COMMIT;