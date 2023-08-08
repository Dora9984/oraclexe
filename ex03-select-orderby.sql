/*
파일명 : ex03-select-orderby.sql

ORDER BY 절
    ORDER BY 절을 사용하여 검색된 행을 정렬합니다. 
        ASC : 오름차순, 기본값
        DESC : 내림차순
    SELECT 문의 맨 마지막에 옵니다.
    
[SELECT 문 기본형식]
SELECT (DISTINT) 컬럼명1, 컬럼명2 ...               .5
FROM 테이블명                                      .1
WHERE 조건절                                       .2
GROUP BY 컬럼명                                    .3
HAVING 조건절                                      .4
ORDER BY 컬럼명 [ASC/DESC]                         .6
*/
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date;

-- 내림차순 정렬
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC;

-- 열 alias를 기준으로 정렬
SELECT employee_id, last_name, salary*12 annsal
FROM employees
ORDER BY annsal; -- 별칭은 WHERE문 등에서는 못쓰고 ORDER BY 에서만 가능

-- 열 숫자 위치를 사용하여 정렬
SELECT last_name, job_id, department_id, hire_date -- 1,2,3,4
FROM employees
ORDER BY 3;

-- 여러 열을 기준으로 정렬
SELECT last_name, job_id, department_id, salary
FROM employees
ORDER BY department_id, salary DESC; -- department_id로 먼저 정렬하고, 같을 경우 salary에 따라 내림차순