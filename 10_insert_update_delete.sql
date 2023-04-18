-- insert
-- 테이블 구조 확인
DESC departments;

-- INSERT의 첫번째 방법 (모든 컬럼 데이터를 한 번에 지정)
INSERT INTO departments
VALUES (290, '영업부');

SELECT * FROM departments;
ROLLBACK; --실행 시점을 다시 뒤로 되돌리는 키워드

-- INSERT의 두 번째 방법 (직접 컬럼을 지정하고 저장, NOT NULL 확인하세요!)
INSERT INTO departments
    (department_id, department_name, location_id)
VALUES
    (280, '개발자', 1700);
    
    
-- 사본 테이블 생성
-- 사본 테이블을 생성할 때 그냥 생성하면 -> 조회된 데이터까지 모두 복사
-- WHERE 절에 FALSE값 (1 = 2) 지정하면 -> 테이블의 구조만 복사하고 데이터는 복사 X
CREATE TABLE managers AS 
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2);

SELECT * FROM managers;
DROP TABLE managers;
    
