-- 숫자함수
--ROUND(반올림)
--원하는 반올림 위치를 매개값으로 지정. 음수를 주는 것도 가능
SELECT 
     ROUND(3.1415, 3), ROUND(45.923, 0), ROUND(45.923, -1)
FROM dual;

-- TRUNC(절사)
-- 정해진 소수점 자리수까지 잘라냅니다.
SELECT
    TRUNC(3.1415, 3), TRUNC(45.923, 0), TRUNC(45.923, -1)
FROM dual;

-- ABS (절대값)
SELECT ABS(-34) FROM dual;

-- CEIL(올림), FLOOR(내림)
SELECT CEIL(3.14), FLOOR(3.14)
FROM dual;

-- MOD(나머지) 
SELECT 10 / 4, MOD(10, 4)
FROM dual;

--날짜 함수
SELECT sysdate FROM dual;
SELECT systimestamp FROM dual;

--날짜도 연산이 가능하다

SELECT sysdate + 1 FROM dual;

SELECT first_time, sysdate - hire_date
(sysdate - hire_date) / AS year
FROM employees;

-- 날짜 반올림, 절사
SELECT ROUND(sysdate) FROM dual;
SELECT ROUND(sysdate, 'year') FROM dual;
SELECT ROUND(sysdate, 'month') FROM dual;
SELECT ROUND(sysdate) FROM dual;