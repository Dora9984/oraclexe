-- 1. �� ������ ��(last_name)�� �ش� ������ �Ŵ����� ������ ��(last_name) ��ȸ�ϱ�
SELECT worker.last_name emp, manager.last_name mgr
FROM employees worker JOIN employees manager
ON worker.manager_id = manager.employee_id;

-- 2. �� ������ ��(last_name)�� �ش� ������ �μ� �̸�(department_name) ��ȸ�ϱ�
SELECT e.last_name, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

-- 3. �� �μ��� �̸�(department_name)�� �ش� �μ��� ��� �޿�(avg_salary) ��ȸ�ϱ�
SELECT d.department_name, AVG(e.salary) AS avg_sal
FROM departments d JOIN employees e
ON e.department_id = d.department_id group by d.department_name;

-- 4. �� �μ��� �̸�(department_name)�� �ش� �μ��� �ִ� �޿�(max_salary) ��ȸ�ϱ�
-- 5. �� ������ ��(last_name)�� �ش� ������ ���� �μ��� �ּ� �޿�(min_salary) ��ȸ�ϱ�
-- 6. �� �μ��� �̸�(department_name)�� �ش� �μ��� ���� ���� �� ���� ���� �޿�(highest_salary) ��ȸ�ϱ�
-- 7. �� ������ ��(last_name)�� �ش� ������ �Ŵ����� ��(last_name) �� �μ� �̸�(department_name) ��ȸ�ϱ�
-- 8. �� ������ ��(last_name)�� �ش� ������ ���� �μ��� �Ŵ����� ��(last_name) ��ȸ�ϱ�
-- 9. �� ������ ��(last_name)�� �ش� ������ ���� ��簡 �ִ� ��� ���� ����� ��(last_name) ��ȸ�ϱ�
-- 10. ������ �߿��� �޿�(salary)�� 10000 �̻��� �������� ��(last_name)�� �ش� ������ �μ� �̸�(department_name) ��ȸ�ϱ�
/*
11.
�� �μ��� �̸�(department_name), �ش� �μ��� �Ŵ����� ID(manager_id)�� �Ŵ����� ��(last_name),
������ ID(employee_id), ������ ��(last_name), �׸��� �ش� ������ �޿�(salary) ��ȸ�ϱ�.
�������� �޿�(salary)�� �ش� �μ��� ��� �޿����� ���� �������� ��ȸ�մϴ�.
����� �μ� �̸��� ������ �޿��� ���� ������ ���ĵ˴ϴ�.
*/