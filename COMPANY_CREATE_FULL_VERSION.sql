CREATE SCHEMA IF NOT EXISTS COMPANY;
USE COMPANY;

CREATE TABLE IF NOT EXISTS EMPLOYEE (
	FNAME VARCHAR(30) NOT NULL,
    SSN CHAR(9) NOT NULL,
    BDATE DATE,
    ADDRESS VARCHAR(40),
    SEX CHAR,
    SALARY DECIMAL(10,2),
    SUPER_SSN CHAR(9),
    DNO INT NOT NULL,
    PRIMARY KEY(SSN)
);

CREATE TABLE IF NOT EXISTS DEPARTMENT (
	DNAME VARCHAR(20) NOT NULL,
    DNUMBER INT NOT NULL,
    MGR_SSN CHAR(9),
    MGR_START_DATE DATE,
    PRIMARY KEY(DNUMBER),
    UNIQUE(DNAME),
    FOREIGN KEY (MGR_SSN) REFERENCES EMPLOYEE(SSN)
);

ALTER TABLE EMPLOYEE ADD 
	FOREIGN KEY (SUPER_SSN) REFERENCES EMPLOYEE(SSN);
ALTER TABLE EMPLOYEE ADD
	FOREIGN KEY (DNO) REFERENCES DEPARTMENT(DNUMBER);
    
CREATE TABLE IF NOT EXISTS DEPT_LOCATIONS (
	DNUMBER INT NOT NULL,
    DLOCATION VARCHAR(40) NOT NULL,
    PRIMARY KEY (DLOCATION, DNUMBER),
    FOREIGN KEY (DNUMBER) REFERENCES DEPARTMENT(DNUMBER)
);

CREATE TABLE IF NOT EXISTS PROJECT (
	PNAME VARCHAR(30) NOT NULL,
    PNUMBER INT NOT NULL,
    PLOCATION VARCHAR(40) NOT NULL,
    DNUM INT NOT NULL,
    PRIMARY KEY(PNUMBER),
    FOREIGN KEY(DNUM) REFERENCES DEPARTMENT(DNUMBER)
);

CREATE TABLE IF NOT EXISTS WORKS_ON (
	ESSN CHAR(9) NOT NULL,
    PNO INT NOT NULL,
    HOURS DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (ESSN, PNO),
    FOREIGN KEY (ESSN) REFERENCES EMPLOYEE(SSN),
    FOREIGN KEY (PNO) REFERENCES PROJECT(PNUMBER)
);

CREATE TABLE IF NOT EXISTS DEPENDENT (
	ESSN CHAR(9) NOT NULL,
    DEPENDENT_NAME VARCHAR(30) NOT NULL,
    SEX CHAR,
    BDATE DATE,
    RELATIONSHIP VARCHAR(30) NOT NULL,
    PRIMARY KEY(ESSN,DEPENDENT_NAME),
    FOREIGN KEY (ESSN) REFERENCES EMPLOYEE(SSN)
);






