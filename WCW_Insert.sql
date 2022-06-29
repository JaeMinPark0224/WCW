INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명1', 'www.회사명1.com', DEFAULT
    , '담당자1 이름', '담당자1@email.com', '010-0000-0000', DEFAULT, '1234');

INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명2', 'www.회사명2.com', DEFAULT
    , '담당자2 이름', '담당자2@email.com', '010-0000-0000', DEFAULT, '1234');

INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명3', 'www.회사명3.com', DEFAULT
    , '담당자3 이름', '담당자3@email.com', '010-0000-0000', DEFAULT, '1234');

INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명4', 'www.회사명4.com', DEFAULT
    , '담당자4 이름', '담당자4@email.com', '010-0000-0000', DEFAULT, '1234');
    
INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명5', 'www.회사명5.com', DEFAULT
    , '담당자5 이름', '담당자5@email.com', '010-0000-0000', DEFAULT, '1234');    

INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명6', 'www.회사명6.com', DEFAULT
    , '담당자6 이름', '담당자6@email.com', '010-0000-0000', DEFAULT, '1234');
    
INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명7', 'www.회사명7.com', DEFAULT
    , '담당자7 이름', '담당자7@email.com', '010-0000-0000', DEFAULT, '1234');
    
INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명8', 'www.회사명8.com', DEFAULT
    , '담당자8 이름', '담당자8@email.com', '010-0000-0000', DEFAULT, '1234');
    
INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명9', 'www.회사명9.com', DEFAULT
    , '담당자9 이름', '담당자9@email.com', '010-0000-0000', DEFAULT, '1234');
    
INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명10', 'www.회사명10.com', DEFAULT
    , '담당자10 이름', '담당자10@email.com', '010-0000-0000', DEFAULT, '1234');       

INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 1, '영업팀'
    , DEFAULT, DEFAULT, NULL, NULL);

INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 1, '국내 영업팀'
    , DEFAULT, DEFAULT, NULL, 10);

INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 1, '해외 영업팀'
    , DEFAULT, DEFAULT, NULL, 10);

INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 1, '인사팀'
    , DEFAULT, DEFAULT, NULL, NULL);
    
INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 1, '개발팀'
    , DEFAULT, DEFAULT, NULL, NULL);    

INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 1, '마캐팅팀'
    , DEFAULT, DEFAULT, NULL, NULL); 

INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 1, '생산팀'
    , DEFAULT, DEFAULT, NULL, NULL);

INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '대표', 0, 1);
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '전무', 1, 1);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '상무', 2, 1);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '부장', 3, 1);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '차장', 4, 1);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '과장', 5, 1);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '대리', 6, 1);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '주임', 7, 1);     
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '사원', 8, 1);
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '인턴', 9, 1);     
    
CREATE TABLE TB_EMPLOYEE (
	EMP_NO	        NUMBER		                    NOT NULL,
	EMAIL	        VARCHAR2(100)		            NOT NULL,
	PWD	            VARCHAR2(256)		            NOT NULL,
	NAME	        VARCHAR2(30)		            NOT NULL,
	INTL_NO	        VARCHAR2(30)		            NOT NULL,
	PHONE	        VARCHAR2(30)		            NOT NULL,
	PROFILE	        VARCHAR2(600)		            NULL,
	SIGN	        VARCHAR2(600)		            NULL,
	IP	            VARCHAR2(30)		            NOT NULL,
	JOIN_DATE	    DATE	        DEFAULT SYSDATE	NOT NULL,
	RESIGN_DATE	    DATE	        DEFAULT SYSDATE	NULL,
	RESIGN_YN	    VARCHAR2(1)	    DEFAULT 'N'	    NOT NULL,
	DEPT_NO     	NUMBER		                    NOT NULL,
	JOB_TITLE_NO	NUMBER		                    NOT NULL
);    
    
INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp1@email.com', 1234
    , '사원1', '0001', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 10, 1);
    
INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp2@email.com', 1234
    , '사원2', '0002', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 10, 2);
    
INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp3@email.com', 1234
    , '사원3', '0003', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 10, 3);    
    
INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp4@email.com', 1234
    , '사원4', '0004', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 10, 4);    
    
INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp5@email.com', 1234
    , '사원5', '0005', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 10, 5);    
    
INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp6@email.com', 1234
    , '사원6', '0006', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 10, 6);    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    