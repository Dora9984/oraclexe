/*
DCL(Data Control Language)
    DCL�� ���̺� �����͸� ������ �� �ʿ��� ������ �����ϴ� ��ɾ�
    
���� Ű����
    CONNECT : �����ͺ��̽��� �����ϴ� ������ �����մϴ�. 
    RESOUCE : ���̺�, ������ ���ν��� ���� ������ �� �ִ� ������ �ο��մϴ�. 
    ALTER, DROP : ��ü�� ���� �Ǵ� ���� ������ �����մϴ�. 
    DBA : �����ͺ��̽� �����ڷμ� �ý����� ������ ������ �� �ִ� ������ �ο��մϴ�. 
*/

ALTER SESSION SET "_ORACLE_SCRIPT"=true;

-- ����� �����ϱ�
CREATE USER scott3 IDENTIFIED BY tiger;

-- GRANT ���� �����ֱ�
GRANT CREATE SESSION TO scott3;
GRANT CONNECT TO scott3;

-- GRANT ���� ���� �����ϱ�
REVOKE CREATE SESSION FROM scott3;
REVOKE CONNECT FROM scott3;

-- OBJECT �����ֱ�
GRANT CREATE SEQUENCE scott3;
GRANT CREATE SYNONYM scott3;
GRANT CREATE TABLE TO scott3;
GRANT CREATE PROCEDURE TO scott3;
GRANT CREATE VIEW TO scott3;

-- ��� ���� �ֱ�
GRANT CONNECT, DBA, RESOURCE TO scott3;

-- ���� �����ϱ�
REVOKE CONNECT, DBA, RESOURCE FROM scott3;

-- ����� ��й�ȣ ����
ALTER USER scott3 IDENTIFIED BY tiger2;

/*
ROLE - ���� �׷�
*/

-- role ���� ���
CREATE ROLE role01;

-- role ���� �Ҵ�
GRANT CREATE SESSION, CREATE TABLE, INSERT ANY TABLE TO role01;

-- ����ڿ��� role �ο�
GRANT role01 TO scott3;
REVOKE role01 FROM scott3;

-- ����� �����ϱ�
DROP USER scott3;
DROP USER scott3 CASCADE;
