/*
���ϸ� : ex08-select-subquery.sql

Subquery ����
    SELECT ���� ���ԵǴ� SELECT �� �Դϴ�. 
    
*/

-- ���� �� Subquery ����
SELECT last_name, salary
FROM employees
WHERE salary > ( SELECT salary FROM employees WHERE last_name = 'Abel');

-- Subquery���� �׷� �Լ� ���
SELECT last_name, job_id, salary
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

/*
���� �� Subqurery
    IN
        ����Ʈ�� ���� ����� ����
    ANY
        =, <>, >, <. <=, >= �����ڰ� �տ� �־�� �մϴ�. 
        < ANY�� �ִ밪���� ������ �ǹ��մϴ�.
        > ANY�� �ּҰ����� ŭ�� �ǹ��մϴ�. 
        = ANY�� IN�� �����ϴ�. 
    ALL
        > ALL�� �ִ밪���� ŭ�� �ǹ��մϴ�.
        < ALL�� �ּҰ����� ������ �ǹ��մϴ�. 
*/

SELECT employee_id, last_name, job_id, salary
FROM employees 
WHERE salary < ANY(SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG'; -- 'IT_PROG' �ƴ� ����

SELECT employee_id, last_name, job_id, salary
FROM employees 
WHERE salary < ALL(SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

SELECT employee_id, last_name, job_id, salary
FROM employees 
WHERE salary IN(SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

/*
EXISTS ������
    Subquery ���� �ּ��� �� ���� ���� ��ȯ�ϸ� TRUE�� �򰡵˴ϴ�. 

*/
SELECT * FROM departments
WHERE NOT EXISTS -- ����� �Ѹ��̶� ������ ���� ����� ���� �μ��� ��ȸ
        (SELECT * FROM employees
        WHERE employees.department_id = departments.department_id);
        

/*
Subquery�� null ��
    ��ȯ�� �� �� �ϳ��� null ���̸� ��ü query�� ���� ��ȯ���� �ʽ��ϴ�. 
    null ���� ���ϴ� ��� ������ ����� null�̱� �����Դϴ�. 
*/
SELECT emp.last_name
FROM employees emp
WHERE emp.employee_id NOT IN
                        (SELECT mgr.manager_id
                        FROM employees mgr);
                        
