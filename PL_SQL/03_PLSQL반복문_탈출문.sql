
-- WHILE��

DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <= 10
    LOOP
        dbms_output.put_line(v_num);
        v_count := v_count + 1; 
    END LOOP;
END;

-- Ż�⹮
DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <= 10
    LOOP
        dbms_output.put_line(v_num);
        EXIT WHEN v_count = 5;
        v_count := v_count + 1; 
    END LOOP;
END;

-- FOR��
DECLARE
    v_num NUMBER := 3;
BEGIN
    FOR i IN 1...9 
    LOOP
        dbms_output.put_line(v_num || 'X' || i ||'=' || v_num*i);
    END LOOP;
END;



-- COUNTINUE ��
DECLARE
    v_num NUMBER := 3;
BEGIN
    FOR i IN 1...9 
    LOOP
        CONTINUE WHEN i = 5;
        dbms_output.put_line(v_num || 'X' || i ||'=' || v_num*i);
    END LOOP;
    
END;


-- 1. ��� �������� ����ϴ� �͸� ����� ���弼��. (2 ~ 9��)
DECLARE
    
BEGIN
    FOR i IN 2..9
    LOOP
        FOR j IN 1..9
        LOOP
        dbms_output.put_line(i || 'X' || j ||'=' || i*j);
        END LOOP;
    END LOOP;    
END;

-- 2. INSERT�� 300�� �����ϴ� �͸� ����� ó���ϼ���.
-- board��� �̸��� ���̺��� ���弼��. (bno, writer, title �÷��� �����մϴ�.)
-- bno��� SEQUENCE�� �÷� �ֽð�, writer�� title�� ��ȣ�� �ٿ��� INSERT ������ �ּ���.
-- EX) 1, test1, title1 -> 2 test2 title2 -> 3 test3 title3 ...
CREATE TABLE board (
    bno NUMBER PRIMARY KEY,
    writer VARCHAR(20),
    title VARCHAR(20)
);

DROP TABLE board;

SELECT * FROM board;


DECLARE
    
BEGIN

        FOR i IN 1..300
        LOOP
        INSERT INTO board
        (bno, writer, title)
        VALUES
            (i, 'test'||i, 'title'||i);
        END LOOP;
      
END;









































