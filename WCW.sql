
DROP TABLE TB_EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE TB_FORJOIN CASCADE CONSTRAINTS;
DROP TABLE TB_APPROVAL CASCADE CONSTRAINTS;
DROP TABLE TB_DRAFT CASCADE CONSTRAINTS;
DROP TABLE TB_COMPANY CASCADE CONSTRAINTS;
DROP TABLE TB_JOB_TITLE CASCADE CONSTRAINTS;
DROP TABLE TB_PROJECT_EMP CASCADE CONSTRAINTS;
DROP TABLE TB_PROJECT_BOARD CASCADE CONSTRAINTS;
DROP TABLE TB_PROJECT_FILE CASCADE CONSTRAINTS;
DROP TABLE TB_PROJECT_WORK CASCADE CONSTRAINTS;
DROP TABLE TB_PROJECT_TODO CASCADE CONSTRAINTS;
DROP TABLE TB_PROJECT_COMMENT CASCADE CONSTRAINTS;
DROP TABLE TB_PROJECT_WORK_PARTICIPANT CASCADE CONSTRAINTS;
DROP TABLE TB_NOTIFICATION CASCADE CONSTRAINTS;
DROP TABLE TB_CHAT_ROOM CASCADE CONSTRAINTS;
DROP TABLE WCW CASCADE CONSTRAINTS;
DROP TABLE TB_CHAT_PARTICIPANT CASCADE CONSTRAINTS;
DROP TABLE TB_DEPARTMENT CASCADE CONSTRAINTS;
DROP TABLE TB_MESSAGE CASCADE CONSTRAINTS;
DROP TABLE TB_PROJECT CASCADE CONSTRAINTS;
DROP TABLE TB_MESSAGE_READ CASCADE CONSTRAINTS;
DROP TABLE TB_NOTICE CASCADE CONSTRAINTS;
DROP TABLE TB_ATTENDANCE CASCADE CONSTRAINTS;
DROP TABLE TB_VACATION CASCADE CONSTRAINTS;
DROP TABLE TB_VACATION_USE CASCADE CONSTRAINTS;
DROP TABLE TB_SPEND CASCADE CONSTRAINTS;
DROP TABLE TB_PROJECT_NOTICE CASCADE CONSTRAINTS;
DROP TABLE TB_FAVORITE CASCADE CONSTRAINTS;
DROP TABLE TB_ATTENDANCE_APPROVAL CASCADE CONSTRAINTS;
DROP TABLE TB_PROJECT_FILE_FOLDER CASCADE CONSTRAINTS;
DROP TABLE TB_PROJECT_HASHTAG CASCADE CONSTRAINTS;
DROP TABLE TB_PROJECT_BOARD_HASHTAG CASCADE CONSTRAINTS;
DROP TABLE TB_PROJECT_BOARD_MENTION CASCADE CONSTRAINTS;
DROP TABLE TB_PROJECT_FAVORITE CASCADE CONSTRAINTS;
DROP TABLE TB_PROJECT_BOARD_FIX CASCADE CONSTRAINTS;

CREATE TABLE TB_EMPLOYEE (
	EMP_NO	        NUMBER		                    NOT NULL,
	EMAIL	        VARCHAR2(100)		            NOT NULL,
	PWD	            VARCHAR2(256)		            NOT NULL,
	NAME	        VARCHAR2(30)		            NOT NULL,
	INTL_NO	        VARCHAR2(30)		            NOT NULL,
	PHONE	        VARCHAR2(30)		            NOT NULL,
	PROFILE	        VARCHAR2(600)		            NULL,
	SIGN	        CLOB		            NULL,
	IP	            VARCHAR2(30)		            NULL,
	JOIN_DATE	    DATE	        DEFAULT SYSDATE	NOT NULL,
	RESIGN_DATE	    DATE	        DEFAULT SYSDATE	NULL,
	RESIGN_YN	    VARCHAR2(1)	    DEFAULT 'N'	    NOT NULL,
	DEPT_NO     	NUMBER		                    NOT NULL,
	JOB_TITLE_NO	NUMBER		                    NOT NULL,
    HR_YN           varchar2(1)     DEFAULT 'N'     NOT NULL
);

COMMENT ON COLUMN TB_EMPLOYEE.EMP_NO IS '사번은 100번부터 시작';

COMMENT ON COLUMN TB_EMPLOYEE.PWD IS '자동 부여';

COMMENT ON COLUMN TB_EMPLOYEE.RESIGN_YN IS '재직: N / 퇴사: Y';



CREATE TABLE TB_FORJOIN (
	EMAIL	    VARCHAR2(100)		NOT NULL,
	RANDOM_NUM	VARCHAR2(30)		NOT NULL
);



CREATE TABLE TB_COMPANY (
	CP_NO	            NUMBER		                    NOT NULL,
	CP_NAME	            VARCHAR2(200)		            NOT NULL,
	CP_URL	            VARCHAR2(200)		            NULL,
	CP_DATE	            DATE	        DEFAULT SYSDATE	NOT NULL,
	CP_JOIN_NAME	    VARCHAR2(30)		            NOT NULL,
	CP_JOIN_EMAIL	    VARCHAR2(100)		            NOT NULL,
	CP_JOIN_PHONE	    VARCHAR2(30)		            NOT NULL,
	CP_APPR_YN	        VARCHAR2(1) 	DEFAULT 'N'	    NOT NULL,
	CP_PWD	            VARCHAR2(256)		            NOT NULL
);

COMMENT ON COLUMN TB_COMPANY.CP_APPR_YN IS '승인: Y / 비승인: N';



CREATE TABLE TB_DRAFT (
	DR_NO	            NUMBER		            NOT NULL,
	EP_NO	            NUMBER		            NOT NULL,
	DR_SORT	            NUMBER		            NOT NULL,
	DR_TIER	            NUMBER		            NOT NULL,
	DR_RESULT	        NUMBER		            NOT NULL,
	DR_TITLE	        VARCHAR2(600)		    NOT NULL,
	DR_CONTENT	        VARCHAR2(1000)		    NULL,
	DR_DATE	            DATE	DEFAULT SYSDATE	NULL,
	DR_DUE_DATE	        DATE		            NULL,
	DR_COMMENT	        VARCHAR2(1000)		    NULL,
	DR_EXPECT_DATE	    DATE		            NULL,
	DR_AMOUNT	        NUMBER		            NULL
);

COMMENT ON COLUMN TB_DRAFT.DR_NO IS '기안 번호는 100번부터 시작';

COMMENT ON COLUMN TB_DRAFT.DR_SORT IS '1. 기안서 / 2. 지출 품의서 / 3. 정산서';

COMMENT ON COLUMN TB_DRAFT.DR_TIER IS '7: 0/3승인//6: 1/3승인//4: 2/3승인//0: 결재완료---3:0/2승인//2:1/2승인 --- 1:0/1승인';

COMMENT ON COLUMN TB_DRAFT.DR_RESULT IS '1. 진행중 / 2. 승인 / 3. 부결 / 4. 반려';

COMMENT ON COLUMN TB_DRAFT.DR_DUE_DATE IS '기안 작성일 기준 + 14일 이후는 자동 부결처리';


CREATE TABLE TB_APPROVAL (
	APPR_NO	    NUMBER		            NOT NULL,
	DR_NO	    NUMBER		            NOT NULL,
	EMP_NO	    NUMBER		            NOT NULL,
	APPR_ORDER	NUMBER		            NOT NULL,
	APPR_RESULT	NUMBER		            NOT NULL,
	APPR_DATE	DATE	DEFAULT SYSDATE	NULL
);

COMMENT ON COLUMN TB_APPROVAL.APPR_ORDER IS '1,2,4,8,';

COMMENT ON COLUMN TB_APPROVAL.APPR_RESULT IS '1. 승인 / 2. 반려 /3. 대기';


CREATE TABLE TB_JOB_TITLE (
	JOB_TITLE_NO	NUMBER		        NOT NULL,
	JOB_TITLE	    VARCHAR2(100)		NOT NULL,
	JOB_LEVEL	    NUMBER		        NOT NULL,
	CP_NO	        NUMBER		        NOT NULL
);


CREATE TABLE TB_PROJECT (
	PR_NO	        NUMBER		                NOT NULL,
	PR_TITLE	    VARCHAR2(100)		        NOT NULL,
	PR_CONTENT	    VARCHAR2(1000)		        NOT NULL,
	PR_OPEN_YN	    VARCHAR2(1)		            NOT NULL,
	PR_JOIN_OPEN	VARCHAR2(1)		            NOT NULL,
	PR_DATE	        DATE	    DEFAULT SYSDATE	NOT NULL,
	CP_NO	        NUMBER		                NOT NULL,
	PR_COMPLETE_YN	VARCHAR2(1)	DEFAULT 'N'	    NOT NULL
);

COMMENT ON COLUMN TB_PROJECT.PR_OPEN_YN IS '프로젝트 사내 공개여부';

COMMENT ON COLUMN TB_PROJECT.PR_JOIN_OPEN IS '프로젝트 참여 공개 여부';


CREATE TABLE TB_PROJECT_EMP (
	PR_NO	            NUMBER		            NOT NULL,
	EP_NO	            NUMBER		            NOT NULL,
	PR_EMP_DATE	        DATE	DEFAULT SYSDATE	NOT NULL,
	PR_EMP_AUTHORITY	VARCHAR2(1)		        NOT NULL
);


CREATE TABLE TB_PROJECT_BOARD (
	PB_NO	    NUMBER		            NOT NULL,
	PR_NO	    NUMBER		            NOT NULL,
	PB_TITLE	VARCHAR2(100)		    NOT NULL,
	PB_CONTENT	VARCHAR2(2000)		    NOT NULL,
	EMP_NO	    NUMBER		            NOT NULL,
	PB_DATE	    DATE	DEFAULT SYSDATE	NOT NULL
);


CREATE TABLE TB_PROJECT_FILE (
	PF_NO	NUMBER		            NOT NULL,
	PF_URL	VARCHAR2(600)		    NOT NULL,
	PR_DATE	DATE	DEFAULT SYSDATE	NOT NULL,
	PB_NO	NUMBER		            NULL,
	PFF_NO	NUMBER		            NOT NULL
);


CREATE TABLE TB_PROJECT_WORK (
	PW_NO	        NUMBER		        NOT NULL,
	PW_TITLE	    VARCHAR2(100)		NOT NULL,
	EP_NO	        NUMBER		        NOT NULL,
	PW_STATUS	    NUMBER	DEFAULT 1	NOT NULL,
	PW_PRIORITY	    NUMBER		        NOT NULL,
	PW_START_DATE	DATE		        NOT NULL,
	PW_END_DATE	    DATE		        NOT NULL,
	PW_CONTENT	    VARCHAR2(2000)		NOT NULL,
	PW_TIER	        NUMBER	DEFAULT 0	NOT NULL,
	PW_REF_NO	    NUMBER		        NOT NULL,
	PW_ORDER	    NUMBER	DEFAULT 0	NOT NULL,
	PR_NO	        NUMBER		        NOT NULL,
    	PW_DATE         DATE    DEFAULT SYSDATE NOT NULL
);



CREATE TABLE TB_PROJECT_WORK_PARTICIPANT (
	PWP_NO	        NUMBER		    NOT NULL,
	PW_NO	        NUMBER		    NOT NULL,
	EMP_NO	        NUMBER		    NOT NULL,
	PWP_AUTHORITY	VARCHAR2(1)		NOT NULL
);


CREATE TABLE TB_PROJECT_TODO (
	PT_NO	        NUMBER		            NOT NULL,
	EMP_NO	        NUMBER		            NOT NULL,
	PR_NO	        NUMBER		            NOT NULL,
	PT_DATE	        DATE		            NOT NULL,
	PT_CONTENT	    VARCHAR2(100)		    NOT NULL,
	PT_COMPLETE_YN	VARCHAR2(1)	DEFAULT 'N'	NOT NULL
);


CREATE TABLE TB_PROJECT_COMMENT (
	PC_NO	    NUMBER		            NOT NULL,
	EMP_NO	    NUMBER		            NOT NULL,
	PB_NO	    NUMBER		            NULL,
	PW_NO	    NUMBER		            NULL,
	PC_CONTENT	VARCHAR2(1000)		    NOT NULL,
	PC_DATE	    DATE	DEFAULT SYSDATE	NOT NULL
);


CREATE TABLE TB_NOTIFICATION (
	NOTI_NO	        NUMBER		                NOT NULL,
	EP_NO	        NUMBER		                NOT NULL,
	NOTI_TITLE	    VARCHAR2(300)		        NOT NULL,
	NOTI_CONTENT	VARCHAR2(1000)		        NULL,
	NOTI_DATE	    DATE	    DEFAULT SYSDATE	NOT NULL,
	NOTI_STATUS	    VARCHAR2(1)	DEFAULT 'N'	    NOT NULL,
	NOTI_SORT	    VARCHAR2(1)		            NOT NULL
);


CREATE TABLE TB_CHAT_ROOM (
	CR_NO	NUMBER		        NOT NULL,
	CR_NAME	VARCHAR2(100)		NOT NULL,
	CR_SORT	VARCHAR2(1)		    NOT NULL,
	EP_NO	NUMBER		        NOT NULL,
	CR_ID	VARCHAR2(256)		NULL
);


CREATE TABLE WCW (
	ID	VARCHAR2(100)		NOT NULL,
	PWD	VARCHAR2(256)		NOT NULL
);


CREATE TABLE TB_CHAT_PARTICIPANT (
	EMP_NO	            NUMBER		                        NOT NULL,
	CR_NO	            NUMBER		                        NOT NULL,
	RECENT_ACTIVE_TIME	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	FIX_YN	            VARCHAR2(1)	DEFAULT 'N'	            NOT NULL,
	NOTI_YN	            VARCHAR2(1)	DEFAULT 'Y'	            NOT NULL,
	REENTER_YN	        VARCHAR2(1)	DEFAULT 'N'	            NOT NULL
);


CREATE TABLE TB_DEPARTMENT (
	DEPT_NO	        NUMBER		            NOT NULL,
	CP_NO	        NUMBER		            NOT NULL,
	DEPT_NAME	    VARCHAR2(100)		    NOT NULL,
	DEPT_DATE	    DATE	DEFAULT SYSDATE	NOT NULL,
	ACTIVE_YN	    VARCHAR2(1)	DEFAULT 'Y'	NOT NULL,
	EMP_NO	        NUMBER		            NULL,
	DEPT_UPPER_NO	NUMBER		            NULL
);

COMMENT ON COLUMN TB_DEPARTMENT.DEPT_NO IS '부서 번호는 10번부터 시작';

COMMENT ON COLUMN TB_DEPARTMENT.ACTIVE_YN IS '활성화: Y / 비활성화: N';

COMMENT ON COLUMN TB_DEPARTMENT.EMP_NO IS '사번은 100번부터 시작';


CREATE TABLE TB_MESSAGE (
	MSG_NO	        NUMBER		                        NOT NULL,
	CR_NO	        NUMBER		                        NOT NULL,
	EMP_NO	        NUMBER		                        NOT NULL,
	MSG_CONTENT	    VARCHAR2(1000)		                NOT NULL,
	MSG_TIME	    TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	MSG_DELETE_YN	VARCHAR2(1)	DEFAULT 'N'	            NOT NULL
);



CREATE TABLE TB_MESSAGE_READ (
	MR_NO	NUMBER		            NOT NULL,
	CM_NO	NUMBER		            NOT NULL,
	EP_NO	NUMBER		            NOT NULL,
	READ_YN	VARCHAR2(1)	DEFAULT 'N'	NOT NULL
);


CREATE TABLE TB_NOTICE (
	NT_NO	    NUMBER		            NOT NULL,
	CP_NO	    NUMBER		            NOT NULL,
	NT_TITLE	VARCHAR2(300)		    NOT NULL,
	NT_CONTENT	VARCHAR2(1000)		    NOT NULL,
	NT_DATE	    DATE	DEFAULT SYSDATE	NOT NULL,
	NT_CNT	    NUMBER	DEFAULT 0	    NOT NULL
);


CREATE TABLE TB_ATTENDANCE (
	ATT_NO	        VARCHAR2(20)		        NOT NULL,
	EMP_NO	        NUMBER		                NOT NULL,
	ATT_DATE	    DATE    DEFAULT SYSDATE     NOT NULL,
	ATT_CLOCK_IN	TIMESTAMP    DEFAULT SYSTIMESTAMP     NOT NULL,
	ATT_CLOCK_OUT	TIMESTAMP	DEFAULT SYSTIMESTAMP     NULL,
	IP_CLOCK_IN	    VARCHAR2(20)		        NOT NULL,
	IP_CLOCK_OUT	VARCHAR2(20)		        NULL,
	ATT_STATUS	    VARCHAR2(1)		            NULL
);


CREATE TABLE TB_VACATION (
	VACA_NO	            VARCHAR2(20)		    NOT NULL,
	EMP_NO	            NUMBER		            NOT NULL,
	VACA_SORT	        VARCHAR2(1)		        NOT NULL,
	VACA_START	        DATE		            NOT NULL,
	VACA_END	        DATE		            NOT NULL,
	VACA_CNT	        NUMBER		            NOT NULL,
	VACA_COMMENT	    VARCHAR2(300)		    NOT NULL,
	VACA_REQ_DATE	    DATE	            	NOT NULL,
	VACA_CONFIRM	    NUMBER		            NOT NULL,
	VACA_APPROVER	    NUMBER		            NOT NULL,
    VACA_ALLDAY         VARCHAR2(1)             NOT NULL
);

COMMENT ON COLUMN TB_VACATION.VACA_SORT IS '1. 연차휴가 2. 출산휴가 3.배우자 출산휴가 4. 생리휴가 5. 가족돌봄휴가';

COMMENT ON COLUMN TB_VACATION.VACA_CONFIRM IS '1. 진행중 / 2. 승인 / 3. 부결 / 4. 반려';


CREATE TABLE TB_VACATION_USE (
	VU_NO	            VARCHAR2(20)	NOT NULL,
	EMP_NO	            NUMBER		    NOT NULL,
	VU_YEAR	            NUMBER		    NOT NULL,
	VU_COUNT	        NUMBER		    NOT NULL,
	VU_USE_DAYS	        NUMBER		    NOT NULL,
	VU_REGISTER_DATE	DATE		    NOT NULL,
    VACA_SORT           VARCHAR2(1)     NOT NULL
);


CREATE TABLE TB_SPEND (
	DR_NO	            NUMBER		        NOT NULL,
	SPEND_DATE	        DATE		        NOT NULL,
	SPEND_SORT	        VARCHAR2(1000)		NOT NULL,
	SPEND_PURPOSE	    VARCHAR2(1000)		NULL,
	SPEND_CONTENT	    VARCHAR2(1000)		NOT NULL,
	SPEND_AMOUNT	    NUMBER		        NOT NULL,
	SPEND_CONTENT_PRVT	VARCHAR2(1000)		NOT NULL,
	SPEND_AMOUNT_PRVT	NUMBER		        NOT NULL,
	SPEND_SUM	        NUMBER		        NOT NULL
);

COMMENT ON COLUMN TB_SPEND.DR_NO IS '기안 번호는 100번부터 시작';


CREATE TABLE TB_PROJECT_NOTICE (
	PN_NO	    NUMBER		            NOT NULL,
	PN_TITLE	VARCHAR2(100)		    NOT NULL,
	PN_CONTENT	VARCHAR2(2000)		    NOT NULL,
	PN_DATE	    DATE	DEFAULT SYSDATE	NOT NULL,
	PR_NO	    NUMBER		            NOT NULL,
    EMP_NO      NUMBER                  NOT NULL
);



CREATE TABLE TB_FAVORITE (
	FAV_NO	    NUMBER		        NOT NULL,
	FAV_NAME	VARCHAR2(100)		NOT NULL,
	FAV_SEQ	    NUMBER		        NOT NULL,
	EMP_NO	    NUMBER		        NOT NULL,
	FAV_LEVEL	NUMBER		        NOT NULL,
	FAV_REF	    NUMBER		        NOT NULL
);


CREATE TABLE TB_ATTENDANCE_APPROVAL (
	ATT_APPR_NO	        NUMBER		        NOT NULL,
	ATT_NO	            VARCHAR2(20)	    NOT NULL,
	EMP_NO	            NUMBER		        NULL,
	ATT_APPR_CONTENT	VARCHAR2(300)		NOT NULL,
	ATT_APPR_RESULT	    VARCHAR2(1)		    DEFAULT '3' NOT NULL,
	ATT_APPR_CLOCK_IN	timestamp		    NOT NULL,
	ATT_APPR_CLOCK_OUT	timestamp		    NOT NULL,
    ATT_APPR_DATE       DATE                NULL,
    ATT_APPR_REQ_DATE   DATE                DEFAULT SYSDATE NOT NULL
);


CREATE TABLE TB_PROJECT_FILE_FOLDER (
	PFF_NO	    NUMBER		        NOT NULL,
	PFF_NAME	VARCHAR2(100)		NOT NULL,
	PFF_REF	    NUMBER		        NOT NULL,
	PFF_LEVEL	NUMBER		        NOT NULL,
	PFF_ORDER	NUMBER		        NOT NULL,
	PR_NO	    NUMBER		        NOT NULL
);


CREATE TABLE TB_PROJECT_HASHTAG (
	PH_NO	    NUMBER		        NOT NULL,
	PR_NO	    NUMBER		        NOT NULL,
	PH_TITLE	VARCHAR(255)		NOT NULL
);


CREATE TABLE TB_PROJECT_BOARD_HASHTAG (
	PB_NO	NUMBER		NOT NULL,
	PH_NO	NUMBER		NOT NULL
);


CREATE TABLE TB_PROJECT_BOARD_MENTION (
	PB_NO	NUMBER		NOT NULL,
	EMP_NO	NUMBER		NOT NULL
);

CREATE TABLE TB_PROJECT_FAVORITE (
    PR_NO NUMBER NOT NULL,
    EMP_NO NUMBER NOT NULL
);

CREATE TABLE TB_PROJECT_BOARD_FIX (
    PB_NO NUMBER NOT NULL,
    EMP_NO NUMBER NOT NULL
);

ALTER TABLE TB_PROJECT_BOARD_FIX ADD CONSTRAINT PK_TB_BOARD_FIX PRIMARY KEY (
    PB_NO,
    EMP_NO
);

ALTER TABLE TB_PROJECT_FAVORITE ADD CONSTRAINT PK_TB_PROJECT_FAVORITE PRIMARY KEY (
	PR_NO,
	EMP_NO
);

ALTER TABLE TB_EMPLOYEE ADD CONSTRAINT PK_TB_EMPLOYEE PRIMARY KEY (
	EMP_NO
);

ALTER TABLE TB_COMPANY ADD CONSTRAINT PK_TB_COMPANY PRIMARY KEY (
	CP_NO
);

ALTER TABLE TB_DRAFT ADD CONSTRAINT PK_TB_DRAFT PRIMARY KEY (
	DR_NO
);

ALTER TABLE TB_APPROVAL ADD CONSTRAINT PK_TB_APPROVAL PRIMARY KEY (
	APPR_NO
);

ALTER TABLE TB_JOB_TITLE ADD CONSTRAINT PK_TB_JOB_TITLE PRIMARY KEY (
	JOB_TITLE_NO
);

ALTER TABLE TB_PROJECT ADD CONSTRAINT PK_TB_PROJECT PRIMARY KEY (
	PR_NO
);

ALTER TABLE TB_PROJECT_EMP ADD CONSTRAINT PK_TB_PROJECT_EMP PRIMARY KEY (
	PR_NO,
	EP_NO
);

ALTER TABLE TB_PROJECT_BOARD ADD CONSTRAINT PK_TB_PROJECT_BOARD PRIMARY KEY (
	PB_NO
);

ALTER TABLE TB_PROJECT_FILE ADD CONSTRAINT PK_TB_PROJECT_FILE PRIMARY KEY (
	PF_NO
);

ALTER TABLE TB_PROJECT_WORK ADD CONSTRAINT PK_TB_PROJECT_WORK PRIMARY KEY (
	PW_NO
);

ALTER TABLE TB_PROJECT_WORK_PARTICIPANT ADD CONSTRAINT PK_TB_PROJECT_WORK_PARTICIPANT PRIMARY KEY (
	PWP_NO
);

ALTER TABLE TB_PROJECT_TODO ADD CONSTRAINT PK_TB_PROJECT_TODO PRIMARY KEY (
	PT_NO
);

ALTER TABLE TB_PROJECT_COMMENT ADD CONSTRAINT PK_TB_PROJECT_COMMENT PRIMARY KEY (
	PC_NO
);

ALTER TABLE TB_NOTIFICATION ADD CONSTRAINT PK_TB_NOTIFICATION PRIMARY KEY (
	NOTI_NO
);

ALTER TABLE TB_CHAT_ROOM ADD CONSTRAINT PK_TB_CHAT_ROOM PRIMARY KEY (
	CR_NO
);

ALTER TABLE TB_CHAT_PARTICIPANT ADD CONSTRAINT PK_TB_CHAT_PARTICIPANT PRIMARY KEY (
	EMP_NO,
	CR_NO
);

ALTER TABLE TB_DEPARTMENT ADD CONSTRAINT PK_TB_DEPARTMENT PRIMARY KEY (
	DEPT_NO
);

ALTER TABLE TB_MESSAGE ADD CONSTRAINT PK_TB_MESSAGE PRIMARY KEY (
	MSG_NO
);

ALTER TABLE TB_MESSAGE_READ ADD CONSTRAINT PK_TB_MESSAGE_READ PRIMARY KEY (
	MR_NO
);

ALTER TABLE TB_NOTICE ADD CONSTRAINT PK_TB_NOTICE PRIMARY KEY (
	NT_NO
);

ALTER TABLE TB_ATTENDANCE ADD CONSTRAINT PK_TB_ATTENDANCE PRIMARY KEY (
	ATT_NO
);

ALTER TABLE TB_VACATION ADD CONSTRAINT PK_TB_VACATION PRIMARY KEY (
	VACA_NO
);

ALTER TABLE TB_VACATION_USE ADD CONSTRAINT PK_TB_VACATION_USE PRIMARY KEY (
	VU_NO
);

ALTER TABLE TB_SPEND ADD CONSTRAINT PK_TB_SPEND PRIMARY KEY (
	DR_NO
);

ALTER TABLE TB_PROJECT_NOTICE ADD CONSTRAINT PK_TB_PROJECT_NOTICE PRIMARY KEY (
	PN_NO
);

ALTER TABLE TB_FAVORITE ADD CONSTRAINT PK_TB_FAVORITE PRIMARY KEY (
	FAV_NO
);

ALTER TABLE TB_ATTENDANCE_APPROVAL ADD CONSTRAINT PK_TB_ATTENDANCE_APPROVAL PRIMARY KEY (
	ATT_APPR_NO
);

ALTER TABLE TB_PROJECT_FILE_FOLDER ADD CONSTRAINT PK_TB_PROJECT_FILE_FOLDER PRIMARY KEY (
	PFF_NO
);

ALTER TABLE TB_PROJECT_HASHTAG ADD CONSTRAINT PK_TB_PROJECT_HASHTAG PRIMARY KEY (
	PH_NO
);

ALTER TABLE TB_PROJECT_BOARD_HASHTAG ADD CONSTRAINT PK_TB_PROJECT_BOARD_HASHTAG PRIMARY KEY (
	PB_NO,
	PH_NO
);

ALTER TABLE TB_PROJECT_BOARD_MENTION ADD CONSTRAINT PK_TB_PROJECT_BOARD_MENTION PRIMARY KEY (
	PB_NO,
	EMP_NO
);

ALTER TABLE TB_PROJECT_EMP ADD CONSTRAINT FK_PROJECT_TO_PROJECT_EMP FOREIGN KEY (
	PR_NO
)
REFERENCES TB_PROJECT (
	PR_NO
);

ALTER TABLE TB_PROJECT_EMP ADD CONSTRAINT FK_EMP_TO_PROJECT_EMP FOREIGN KEY (
	EP_NO
)
REFERENCES TB_EMPLOYEE (
	EMP_NO
);

ALTER TABLE TB_CHAT_PARTICIPANT ADD CONSTRAINT FK_EMP_TO_PARTICIPANT FOREIGN KEY (
	EMP_NO
)
REFERENCES TB_EMPLOYEE (
	EMP_NO
);

ALTER TABLE TB_CHAT_PARTICIPANT ADD CONSTRAINT FK_CHAT_ROOM_TO_PARTICIPANT FOREIGN KEY (
	CR_NO
)
REFERENCES TB_CHAT_ROOM (
	CR_NO
);

ALTER TABLE TB_SPEND ADD CONSTRAINT FK_TB_DRAFT_TO_TB_SPEND_1 FOREIGN KEY (
	DR_NO
)
REFERENCES TB_DRAFT (
	DR_NO
);

ALTER TABLE TB_PROJECT_BOARD_HASHTAG ADD CONSTRAINT FK__BOARD_TO__BOARD_HASHTAG FOREIGN KEY (
	PB_NO
)
REFERENCES TB_PROJECT_BOARD (
	PB_NO
);

ALTER TABLE TB_PROJECT_BOARD_HASHTAG ADD CONSTRAINT FK_HASHTAG_TO_BOARD_HASHTAG FOREIGN KEY (
	PH_NO
)
REFERENCES TB_PROJECT_HASHTAG (
	PH_NO
);

ALTER TABLE TB_PROJECT_BOARD_MENTION ADD CONSTRAINT FK_BOARD_TO_MENTION FOREIGN KEY (
	PB_NO
)
REFERENCES TB_PROJECT_BOARD (
	PB_NO
);

ALTER TABLE TB_PROJECT_BOARD_MENTION ADD CONSTRAINT FK_EMPLOYEE_TO_BOARD_MENTION FOREIGN KEY (
	EMP_NO
)
REFERENCES TB_EMPLOYEE (
	EMP_NO
);

ALTER TABLE TB_PROJECT_FAVORITE ADD CONSTRAINT FK_EMPLOYEE_TO_FAVORITE FOREIGN KEY (
	EMP_NO
)
REFERENCES TB_EMPLOYEE (
	EMP_NO
);

ALTER TABLE TB_PROJECT_FAVORITE ADD CONSTRAINT FK_PROJECT_TO_FAVORITE FOREIGN KEY (
	PR_NO
)
REFERENCES TB_PROJECT (
	PR_NO
);

ALTER TABLE TB_PROJECT_BOARD_FIX ADD CONSTRAINT FK_EMPLOYEE_TO_BOARD_FIX FOREIGN KEY (
	EMP_NO
)
REFERENCES TB_EMPLOYEE (
	EMP_NO
);

ALTER TABLE TB_PROJECT_BOARD_FIX ADD CONSTRAINT FK_PROJECT_TO_BOARD_FIX FOREIGN KEY (
	PB_NO
)
REFERENCES TB_PROJECT_BOARD (
	PB_NO
);

ALTER TABLE TB_PROJECT_NOTICE ADD CONSTRAINT FK_PROJECT_TO_NOTICE FOREIGN KEY (
    PR_NO
)
REFERENCES TB_PROJECT (
    PR_NO
);

ALTER TABLE TB_PROJECT_NOTICE ADD CONSTRAINT FK_EMP_TO_PR_NOTICE FOREIGN KEY (
    EMP_NO
)
REFERENCES TB_EMPLOYEE (
    EMP_NO
);
