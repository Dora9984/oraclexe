/*
���ϸ� : ex14-DDL.sql

DDL(Data Definition Language) - ������ ���Ǿ� 
    ������ ���̽� ���� ���� �� ��ü(���̺�, ������.. ��)�� ����, ����, �����ϱ� ���� ���Ǵ� SQL ���Դϴ�. 
*/

/*
CREATE TABLE ��
    �����͸� ������ ���̺��� �����մϴ�. 
*/

CREATE TABLE dept(
    deptno NUMBER(6),
    dname VARCHAR2(200),
    loc VARCHAR2(200),
    create_date DATE DEFAULT SYSDATE
    );
    
DESC dept;

/*
������ ����
    VARCHAR2(size) ���� ���� ���� ������ (4000)
    NUMBER(p,s) ���� ���� ���� ������
    CHAR(size) ���� ���� ���� (2000)
    DATE ��¥ �� �ð� ��
    CLOB ���� ������ (�ִ� 4GB)
    BLOB ���̳ʸ� ������(�ִ� 4GB)
    BFILE ������ġ�� ��Ÿ������ ����(�ִ� 4GB)
*/

