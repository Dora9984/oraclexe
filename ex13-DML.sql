/*
파일명 : ex13-DML.sql

DML(Data Manipulation Language)
    DB에서 데이터를 조작하고 처리하는 SQL
    
    INSERT문 : 테이블에 새로운 레코드 삽입
    UPDATE문 : 테이블에 기존 레코드를 갱신(업데이트) 하는데 사용
    DELETE문 : 테이블에서 특정 레코드를 삭제
    
    SELECT는 DML 포함될 수 있지만, 보통 DQL(Date Query Language)로 분류한다.
*/

/*
INSERT 문
[기본형식]
    INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...)
    VALUES(값1, 값2, ...);
    
    또는
    
    INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...) subquery;
*/
SELECT * FROM departments;

INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (280, 'Public Relations', 100, 1700);

COMMIT; -- DML 결과를 영구적으로 DB에 반영. COMMIT 까지 해야 다른사람들이 볼 때도 반영됨.

-- NULL 값을 가진 행 삽입
-- 열 생략
INSERT INTO departments (department_id, department_name)
VALUES (290, 'Purchasing');

ROLLBACK; -- DML문의 실행결과를 취소할 때(COMMIT 안했다는 가정 하에)

/* INSERT subquery

*/
CREATE TABLE sales_reps
AS (SELECT employee_id id, last_name name, salary, commission_pct
    FROM employees
    WHERE 1 = 2
    )
;

SELECT * FROM sales_reps;

-- job_id REP 포함된 사원
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%'
;

INSERT INTO sales_reps(id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%'
;

COMMIT;

SELECT * FROM sales_reps;

/*
UPDATE 문
    테이블의 기존 값을 수정합니다. 
    
[기본형식]
    UPDATE 테이블명
    SET 컬럼명1 = 수정값, 컬럼명2 = 수정값
    WHERE 조건절
*/

CREATE TABLE copy_emp
AS SELECT * FROM employees WHERE 1 = 2;

INSERT INTO copy_emp
SELECT * FROM employees;

COMMIT;

SELECT * FROM copy_emp;

-- 부서 번호 50번으로 변경
UPDATE copy_emp
SET department_id = 50
WHERE employee_id = 113;

ROLLBACK;

UPDATE copy_emp
SET department_id = 110;
-- SELECT 문 없이 UPDATE가 되어버리면 위험할 수 있으니까 주의하기 

ROLLBACK;

UPDATE copy_emp
SET department_id = (SELECT department_id
                        FROM employees 
                        WHERE employee_id = 100)
WHERE job_id = (SELECT job_id
                FROM employees
                WHERE employee_id = 200);
                
SELECT * FROM copy_emp WHERE department_id = 200;

/*
DELETE 문
    DELETE 문을 사용하여 테이블에서 기존 행을 제거할 수 있습니다. 

*/

-- 사원번호 200번 사원 삭제
DELETE FROM copy_emp
WHERE employee_id = 200;

ROLLBACK;

-- 테이블 전체 데이터 삭제
DELETE FROM copy_emp;

SELECT * FROM copy_emp;

ROLLBACK;

/*
TRUNCATE 문
    테이블을 빈 상태로, 테이블 구조 그대로 남겨둔 채 테이블에서 모든 행을 제거합니다. 
    DML 문이 아니라 DDL(데이터 정의어) 문이므로 쉽게 UN-DO할 수 없습니다. 
*/
TRUNCATE TABLE copy_emp; --웬만하면 쓰지 말 것

/*
트랜잭션(Transaction)
    데이터 처리의 한 단위입니다. 
    오라클에서 발생하는 여러 개의 SQL 명령문을  
    하나의 논리적인 작업 단위로 처리하는데 이를 트랜잭션이라고 합니다. 
    
    COMMIT : SQL문의 결과를 영구적으로 DB에 반영
    ROLLBACK : SQL문의 실행결과를 취소할 때 
    SAVEPOINT : 트랜잭션의 한 지점에서 표시하는 임시 저장점
*/

CREATE TABLE member(
    num NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    ADDR VARCHAR2(50)
    );
    
INSERT INTO member VALUES(1, '피카츄', '태초마을');
COMMIT;
INSERT INTO member VALUES(2, '라이츄', '태초마을');
INSERT INTO member VALUES(3, '파이리', '태초마을');
INSERT INTO member VALUES(4, '꼬부기', '태초마을');
ROLLBACK;

SELECT * FROM member;

-- SAVEPOINT
INSERT INTO member VALUES(5, '버터플', '태초마을');
SAVEPOINT mypoint;
INSERT INTO member VALUES(6, '야도란', '태초마을');
INSERT INTO member VALUES(7, '피존투', '태초마을');
INSERT INTO member VALUES(8, '또가스', '태초마을');
ROLLBACK TO mypoint;
COMMIT;

/*
SELECT 문의 FOR UPDATE 절
    FOR UPDATE 는 특정 레코드를 잠금(lock) 처리하는 SQL 구문입니다.
    COMMIT 또는 ROLLBACK 으로 잠금해제합니다. 
*/
SELECT employee_id, salary, job_id
FROM employees
WHERE job_id = 'SA_REP'
FOR UPDATE; -- lock을 걸면 다른 사람이 해당 데이터에 대해 작업할 수 없음. 웬만하면 lock은 걸지 않는 것이 좋음.

COMMIT;




