/*
파일명 : ex14-DDL.sql

DDL(Data Definition Language) - 데이터 정의어 
    데이터 베이스 내의 구조 및 객체(테이블, 시퀀스.. 등)를 생성, 변경, 삭제하기 위해 사용되는 SQL 문입니다. 
*/

/*
CREATE TABLE 문
    데이터를 저장할 테이블을 생성합니다. 
*/

CREATE TABLE dept(
    deptno NUMBER(6),
    dname VARCHAR2(200),
    loc VARCHAR2(200),
    create_date DATE DEFAULT SYSDATE
    );
    
DESC dept;

/*
데이터 유형
    VARCHAR2(size) 가변 길이 문자 데이터 (4000)
    NUMBER(p,s) 가변 길이 숫자 데이터
    CHAR(size) 고정 길이 문자 (2000)
    DATE 날짜 및 시간 값
    CLOB 문자 데이터 (최대 4GB)
    BLOB 바이너리 데이터(최대 4GB)
    BFILE 파일위치와 메타데이터 저장(최대 4GB)
*/

