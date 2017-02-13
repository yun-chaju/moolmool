 DROP TABLE QUESTION; -- QNA 질문
 DROP TABLE ANSWER; -- QNA 답변
 DROP TABLE QNA_SATISFACTION; -- QNA 만족도
 DROP TABLE BOARD_TYPE; -- 게시판 타입
 DROP TABLE BOARD; -- 게시판(물)
 DROP TABLE BOARD_REPORT; -- 게시물 신고
 DROP TABLE BOARD_COMMENT; -- 게시판(물) 댓글
 DROP TABLE BOARD_EVALUATE; -- 게시물 평가(like/unlike)
 DROP TABLE MESSAGE; -- 쪽지
 DROP TABLE FAQ_TYPE; -- FAQ 타입
 DROP TABLE FAQ; -- FAQ
 DROP TABLE MEMBER; -- 회원
 DROP TABLE NOTICE; -- 공지사항
 DROP TABLE TRADE; -- 거래시스템
 DROP TABLE TRADE_FILE_ATTACH; -- 거래글 등록  파일
 DROP TABLE TRADE_CATEGORY; -- 거래 범주
 DROP TABLE TRADE_COMMENT; -- 거래 댓글
 DROP TABLE MEMO; -- 메모
 DROP TABLE PERSONACON; -- 퍼스나콘(https://goo.gl/9L9yFU)
 DROP TABLE PERSONACON_ORDER_HISTORY; -- 퍼스나콘 구매 내역
 DROP TABLE SHOP_ITEM; -- 포인트샵 아이템
 DROP TABLE SHOP_ITEM_ORDER_HISTORY; -- 포인트샵 아이템 구매 내역
 DROP TABLE POINT; -- 포인트
 DROP TABLE SLIDE_CONTENT; -- 슬라이드 컨텐츠
 DROP TABLE JIBUN_ADDRESS;
 
 DROP SEQUENCE SEQ_QUESTION_QNO;
 DROP SEQUENCE SEQ_ANSWER_ANO;
 DROP SEQUENCE SEQ_BOARD_BNO;
 DROP SEQUENCE SEQ_BOARD_COMMNET_CNO;
 DROP SEQUENCE SEQ_MESSAGE_MNO;
 DROP SEQUENCE SEQ_FNO;
 DROP SEQUENCE SEQ_MEMBER_MNO;
 DROP SEQUENCE SEQ_NOTICE_NNO;
 DROP SEQUENCE SEQ_TRADE_TNO; -- 거래 글 번호
 DROP SEQUENCE SEQ_TRADE_FILE_ATTACH_FNO;
 DROP SEQUENCE SEQ_TRADE_CATEGORY_TDC_NO; -- 거래 카테고리 번호
 DROP SEQUENCE SEQ_TRADE_COMMENT_TC_NO; -- 거래 댓글 번호
 DROP SEQUENCE SEQ_PSC_NO;
 DROP SEQUENCE SEQ_SLIDE_CONTENT_NO;
 
 CREATE TABLE MEMBER(
   MEM_NO NUMBER(11) PRIMARY KEY,
   ROLE_CODE VARCHAR2(30),
   ID VARCHAR2(20) UNIQUE,
   PASSWORD VARCHAR2(20) NOT NULL,
   NAME VARCHAR2(20) NOT NULL,
   NICKNAME VARCHAR2(20) UNIQUE,
   EMAIL VARCHAR2(50) UNIQUE,
   ZIP_CODE VARCHAR2(6),
   ROAD_ADDR_PART VARCHAR2(256),
   JIBUN_ADDR VARCHAR2(256),
   ADDR_DETAIL VARCHAR2(256),
   PHONE VARCHAR2(11),
   REGDATE DATE DEFAULT SYSDATE,
   LAST_MOD_DATE DATE DEFAULT SYSDATE,
   POINT NUMBER(11) DEFAULT 0,
   TOT_POINT NUMBER(11,11) DEFAULT 0,
   AUTH_NUMBER NUMBER(6) DEFAULT 314159,
   STATUS CHAR(1) DEFAULT 'A',
   PSC_CODE NUMBER(11) DEFAULT 0 -- 사용중인 퍼스나콘 번호
 );
 
 CREATE TABLE QUESTION(
   QNO NUMBER(11),
   WRITER_NO NUMBER(11) ,
   WRITER_NICKNAME VARCHAR2(20),
   TITLE VARCHAR2(200) NOT NULL,
   CONTENT CLOB NOT NULL,
   REGDATE DATE,
   MODDATE DATE,
   IS_PRIVATE CHAR(1) DEFAULT 'N',
   IS_DELETED CHAR(1) DEFAULT 'N',
   REPLY CHAR(1) DEFAULT 'N',
   CONSTRAINT QUESTION_QNO_PK PRIMARY KEY(QNO),
   CONSTRAINT QUESTION_ISPRIVATE_CHK CHECK (IS_PRIVATE IN ('Y', 'N')),
   CONSTRAINT QUESTION_ISDELETED_CHK CHECK (IS_DELETED IN ('Y', 'N')),
   CONSTRAINT QUESTION_REPLY_CHK CHECK (REPLY IN ('Y', 'N'))
 );
 
 CREATE TABLE ANSWER(
   ANO NUMBER(11),
   QNO NUMBER(11),
   ADMIN_NO NUMBER(11),
   CONTENT VARCHAR2(4000) NOT NULL,
   REGDATE DATE,
   MODDATE DATE,
   IS_EVALUATED CHAR(1) DEFAULT 'N',
   CONSTRAINT ANSWER_ANO_PK PRIMARY KEY(ANO),
   CONSTRAINT ANSWER_ISEVALUATED_CHK CHECK (IS_EVALUATED IN ('Y', 'N'))
 );
 
 CREATE TABLE QNA_SATISFACTION (
   ANO NUMBER(11),
   WRITER_NO NUMBER(11),
   RATE NUMBER(2, 1),
   OPINION VARCHAR2(2000),
   REGDATE DATE,
   CONSTRAINT SATIS_ANO_PK PRIMARY KEY(ANO)
   --CONSTRAINT SATIS_ANO_KF FOREIGN KEY(ANO) REFERENCES ANSWER(ANO)
   -- FK 제약 조건은 프로젝트 마무리 단계에서 작성
 );
 
 CREATE TABLE BOARD_TYPE (
 	bt_code VARCHAR2(20) PRIMARY KEY,
 	bt_name VARCHAR2(30),
 	description VARCHAR2(2000)
 );
 
 CREATE TABLE BOARD (
   bno NUMBER(11) PRIMARY KEY,
   title VARCHAR2(200),
   content CLOB,
   writer_no NUMBER(11),
   writer_nickname VARCHAR2(20),
   regdate DATE,
   moddate DATE,
   hit NUMBER(11) DEFAULT 0,
   is_deleted CHAR(1) DEFAULT 'N',
   bt_code VARCHAR2(20)
 );
 
 CREATE TABLE BOARD_REPORT ( -- 하나의 게시물에 대한 중복 신고는 불가
 	bno NUMBER(11), -- BOARD의 PK 
 	mem_no NUMBER(11), -- MEMBER의 PK
 	regdate DATE,
 	PRIMARY KEY(bno, mem_no)
 );
 
 CREATE TABLE BOARD_COMMENT (
   cno NUMBER(11) PRIMARY KEY,
   bno NUMBER(11),
   content VARCHAR2(4000) NOT NULL,
   writer_no NUMBER(11),
   writer_nickname VARCHAR2(20),
   parent_writer_no NUMBER(11),
   parent_writer_nickname VARCHAR2(20),
   regdate DATE,
   moddate DATE,
   parent_no NUMBER(11),
   is_deleted CHAR(1) DEFAULT 'N'
 );
 
 CREATE TABLE BOARD_EVALUATE (
 	bno NUMBER(11),
 	mem_no NUMBER(11),
 	regdate DATE,
 	e_type VARCHAR2(6) CHECK (e_type IN ('LIKE', 'UNLIKE')),
 	PRIMARY KEY(bno, mem_no)
 );
 
 CREATE TABLE MESSAGE(
   MNO NUMBER(11) PRIMARY KEY,
   SENDER_NO NUMBER(11),
   RECEIVER_NO NUMBER(11),
   IS_OPENED CHAR(1) DEFAULT 'N' CHECK( IS_OPENED IN('Y','N')) ,
   S_DELETED CHAR(1) DEFAULT 'N' CHECK( S_DELETED IN('Y','N')),
   R_DELETED CHAR(1) DEFAULT 'N' CHECK( R_DELETED IN('Y','N')),
   SEND_DATE DATE DEFAULT SYSDATE,
   OPEN_DATE DATE,
   TITLE VARCHAR2(200) NOT NULL,
   CONTENT VARCHAR2(4000) NOT NULL,
   PARENT_MNO NUMBER(11) 
 );
 
 CREATE TABLE FAQ_TYPE(
   FNAME VARCHAR2(20) PRIMARY KEY,
   DESCRIPTION VARCHAR2(2000) NOT NULL
 );
 
 CREATE TABLE FAQ(
   FNO NUMBER(11) PRIMARY KEY,
   FNAME VARCHAR2(20),
   TITLE VARCHAR2(200) NOT NULL,
   CONTENT VARCHAR2(4000) NOT NULL,
   REGDATE DATE,
   MODDATE DATE
 );
 
 CREATE TABLE NOTICE (
   nno NUMBER(11) PRIMARY KEY,
   title VARCHAR2(1000) NOT NULL,
   content CLOB NOT NULL,
   category VARCHAR2(30) DEFAULT '공지',
   hit NUMBER(11) DEFAULT 0,
   regdate DATE DEFAULT SYSDATE,
   moddate DATE DEFAULT SYSDATE,
   Is_Deleted CHAR(1) CHECK (is_deleted in('Y','N'))
 );
 
 CREATE TABLE TRADE_CATEGORY (
   tdc_no NUMBER(11) PRIMARY KEY,
   name VARCHAR(100) NOT NULL,
   parent_no NUMBER(11)
 );
 
 CREATE TABLE TRADE (
   tno NUMBER(11) PRIMARY KEY,
   target_tno NUMBER(11),
   tdc_no NUMBER(11),
   title VARCHAR2(1000) NOT NULL,
   content VARCHAR2(4000) NOT NULL,
   price NUMBER(11),
   road_addr_part VARCHAR2(256),
   sido VARCHAR2(50),
 		sigugun VARCHAR2(50),
 		dongmyun VARCHAR2(50),
   addr_detail VARCHAR2(256),
   lat NUMBER(11,8),
   lng NUMBER(11,8),
   trade_code CHAR(1),--거래진행상태(대기/진행/완료, S/P/C)
   regdate DATE DEFAULT SYSDATE,
   moddate DATE DEFAULT SYSDATE,
   writer_uno NUMBER(11),
   writer_nickname VARCHAR2(22),
   enddate DATE DEFAULT SYSDATE,
   trade_type CHAR(1),--거래유형(교환/자유/구함, S/F/W)
   file1 VARCHAR2(256),
   file2 VARCHAR2(256),
   file3 VARCHAR2(256)
 );
 
 CREATE TABLE TRADE_FILE_ATTACH (
 	fno NUMBER(11) PRIMARY KEY,
 	tno NUMBER(11),
 	file_path VARCHAR2(256)
 );
 
 CREATE TABLE TRADE_COMMENT (
 	tc_no NUMBER(11) PRIMARY KEY,
 	tno NUMBER(11),
 	content VARCHAR2(4000) NOT NULL,
 	alink VARCHAR2(256),
 	regdate DATE DEFAULT SYSDATE,
 	writer_uno NUMBER(11),
 	writer_nickname VARCHAR2(22)
 );

CREATE TABLE SHOP_ITEM (
	item_no NUMBER(11) PRIMARY KEY,
	name VARCHAR2(100),
	description VARCHAR2(1000),
	html_tag VARCHAR2(256),
	item_type CHAR(4),
	price NUMBER(11),
	regdate DATE,
	moddate DATE
);

CREATE TABLE SHOP_ITEM_ORDER_HISTORY (
  item_no NUMBER(11),
  mem_no NUMBER(11),
  orderDate DATE,
  PRIMARY KEY(item_no, mem_no)
);
 
 CREATE TABLE MEMO(
   WRITER_NO NUMBER(11),
   TARGET_NO NUMBER(11),
   CONTENT VARCHAR2(1000), -- 크기 검토 필요
   REGDATE DATE,
   MODDATE DATE,
   PRIMARY KEY (WRITER_NO, TARGET_NO)
 );
 
 CREATE TABLE PERSONACON(
 	psc_no NUMBER(11) PRIMARY KEY,
 	name VARCHAR2(100),
 	description VARCHAR2(1000),
 	html_tag VARCHAR2(256),
 	psc_type CHAR(4), -- imgs / icon / font 등...
 	price NUMBER(11),
 	regdate DATE,
 	moddate DATE
 );
 
 CREATE TABLE PERSONACON_ORDER_HISTORY (
 	psc_no NUMBER(11),
 	mem_no NUMBER(11),
 	orderdate DATE,
 	PRIMARY KEY (psc_no, mem_no)
 );
 
 CREATE TABLE POINT (
   MEM_NO NUMBER(11,0),
   LOG_COMMENT VARCHAR2(500),
   POINT_CHANGE NUMBER(11,0),
   ADD_ELI char(1), -- 포인트 변동시 추가인지 삭제인지 표시
   POINT_DATE DATE DEFAULT SYSDATE
 );
 
 CREATE TABLE SLIDE_CONTENT (
 	sno NUMBER(11) PRIMARY KEY,
 	content VARCHAR2(2000),
 	regdate DATE,
 	moddate DATE,
 	writer_no NUMBER(11)
 	-- 사용 여부 컬럼 필요
 );
 
 CREATE TABLE JIBUN_ADDRESS (
 	sido VARCHAR2(30),
 	gugun VARCHAR2(30),
 	emd VARCHAR2(30)
 );
 
 
 CREATE SEQUENCE SEQ_MEMBER_MNO
 START WITH  1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE SEQ_QUESTION_QNO
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE SEQ_ANSWER_ANO
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE SEQ_BOARD_BNO
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE SEQ_BOARD_COMMNET_CNO
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE SEQ_MESSAGE_MNO
 INCREMENT BY 1
 START WITH 1
 NOCACHE NOCYCLE;
 
 CREATE SEQUENCE SEQ_FNO
 START WITH  1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE SEQ_NOTICE_NNO
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE SEQ_TRADE_TNO
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE SEQ_TRADE_FILE_ATTACH_FNO
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE SEQ_TRADE_CATEGORY_TDC_NO
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE SEQ_TRADE_COMMENT_TC_NO
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE SEQ_PSC_NO
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE SEQ_SLIDE_CONTENT_NO
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 
 
 INSERT INTO MEMBER VALUES(SEQ_MEMBER_MNO.NEXTVAL,'ROLE_ADMIN','admin','admin','이름관리자','닉넴관리자','admin@moolmool.com','000000','관리자시 관리자구 관리자동 관리자아파트','관리자시 관리자구 관리자동 관리자아파트','나머지관리자주소','00000000000',default,default,0,default,default, default, default);
 INSERT INTO MEMBER VALUES(SEQ_MEMBER_MNO.NEXTVAL,'ROLE_USER','user01','pass01','이름사용자','닉넴사용자','user01@moolmool.com','111111','사용자시 사용자구 사용자동 사용자아파트','관리자시 관리자구 관리자동 관리자아파트','나머지사용자1주소','11111111111',default,default,80,default,default, default, default);
 INSERT INTO MEMBER VALUES(SEQ_MEMBER_MNO.NEXTVAL,'ROLE_USER','user02','pass02','이름','닉넴','user02@moolmool.com','222222','사용자시 사용자구 사용자동 사용자아파트','관리자시 관리자구 관리자동 관리자아파트','나머지사용자1주소','11111111111',default,default,10,default,default, default, default);
 INSERT INTO MEMBER VALUES(SEQ_MEMBER_MNO.NEXTVAL,'ROLE_USER','user03','pass03','이름사','닉넴사','user03@moolmool.com','333333','사용자시 사용자구 사용자동 사용자아파트','관리자시 관리자구 관리자동 관리자아파트','나머지사용자1주소','11111111111',default,default,10,default,default, default, default);
 INSERT INTO MEMBER VALUES(SEQ_MEMBER_MNO.NEXTVAL,'ROLE_USER','user04','pass04','이름사용','닉넴사용','user04@moolmool.com','444444','사용자시 사용자구 사용자동 사용자아파트','관리자시 관리자구 관리자동 관리자아파트','나머지사용자1주소','11111111111',default,default,10,default,default, default, default);
 
 INSERT INTO QUESTION VALUES (SEQ_QUESTION_QNO.NEXTVAL, 1, '관리자', 'QNA 게시물  테스트 1번 입니다.', 'QNA 게시물  테스트 1번 입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT, 'Y');
 INSERT INTO QUESTION VALUES (SEQ_QUESTION_QNO.NEXTVAL, 1, '관리자', 'QNA 게시물 테스트 2번 입니다.', 'QNA 게시물 테스트 2번 입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT, 'Y');
 INSERT INTO QUESTION VALUES (SEQ_QUESTION_QNO.NEXTVAL, 2, '사용자01', '회원 탈퇴는 어떻게 하나요', '가장 시급한 기능인 거 같은데 안 보이네요.', SYSDATE, SYSDATE, DEFAULT, DEFAULT, 'Y');
 INSERT INTO QUESTION VALUES (SEQ_QUESTION_QNO.NEXTVAL, 2, '사용자01', 'QNA 게시물 테스트 4번 입니다.', 'QNA 게시물 테스트 4번 입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT, 'Y');
 INSERT INTO QUESTION VALUES (SEQ_QUESTION_QNO.NEXTVAL, 2, '사용자01', 'QNA 게시물 테스트 5번 입니다.', 'QNA 게시물 테스트 5번 입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT, 'Y');
 INSERT INTO QUESTION VALUES (SEQ_QUESTION_QNO.NEXTVAL, 2, '사용자01', 'QNA 게시물 테스트 6번 입니다.', 'QNA 게시물 테스트 6번 입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT);
 INSERT INTO QUESTION VALUES (SEQ_QUESTION_QNO.NEXTVAL, 2, '사용자01', 'QNA 게시물 테스트 7번 입니다.', 'QNA 게시물 테스트 7번 입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT);
 INSERT INTO QUESTION VALUES (SEQ_QUESTION_QNO.NEXTVAL, 2, '사용자01', 'QNA 게시물 테스트 8번 입니다.', 'QNA 게시물 테스트 8번 입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT);
 INSERT INTO QUESTION VALUES (SEQ_QUESTION_QNO.NEXTVAL, 2, '사용자01', 'QNA 게시물 테스트 9번 입니다.', 'QNA 게시물 테스트 9번 입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT);
 INSERT INTO QUESTION VALUES (SEQ_QUESTION_QNO.NEXTVAL, 2, '사용자01', 'QNA 게시물 테스트 10번 입니다.', 'QNA 게시물 테스트 10번 입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT);
 INSERT INTO QUESTION VALUES (SEQ_QUESTION_QNO.NEXTVAL, 2, '사용자01', 'QNA 게시물 테스트 11번 입니다.', 'QNA 게시물 테스트 11번 입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT);
 INSERT INTO QUESTION VALUES (SEQ_QUESTION_QNO.NEXTVAL, 2, '사용자01', 'QNA 게시물 테스트 12번 입니다.', 'QNA 게시물 테스트 12번 입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT);
 INSERT INTO QUESTION VALUES (SEQ_QUESTION_QNO.NEXTVAL, 2, '사용자01', 'QNA 게시물 테스트 13번 입니다.', 'QNA 게시물 테스트 13번 입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT);
 
 INSERT INTO ANSWER VALUES(SEQ_ANSWER_ANO.NEXTVAL, 1, 1, 'QNA 답글 테스트 1번입니다.', SYSDATE, SYSDATE, DEFAULT);
 INSERT INTO ANSWER VALUES(SEQ_ANSWER_ANO.NEXTVAL, 2, 1, 'QNA 답글 테스트 2번입니다.', SYSDATE, SYSDATE, DEFAULT);
 INSERT INTO ANSWER VALUES(SEQ_ANSWER_ANO.NEXTVAL, 3, 1, 'QNA 답글 테스트 3번입니다.', SYSDATE, SYSDATE, DEFAULT);
 INSERT INTO ANSWER VALUES(SEQ_ANSWER_ANO.NEXTVAL, 4, 1, 'QNA 답글 테스트 4번입니다.', SYSDATE, SYSDATE, 'Y');
 INSERT INTO ANSWER VALUES(SEQ_ANSWER_ANO.NEXTVAL, 5, 1, 'QNA 답글 테스트 5번입니다.', SYSDATE, SYSDATE, DEFAULT);
 
 INSERT INTO QNA_SATISFACTION VALUES(4, 2, 4, 'QNA 만족도 테스트 1번입니다.', SYSDATE);
 
 INSERT INTO BOARD_TYPE (bt_code, bt_name, description) VALUES ('free', '자유', '자유 게시판');
 INSERT INTO BOARD_TYPE (bt_code, bt_name, description) VALUES ('humor', '유머', '유머 게시판');
 INSERT INTO BOARD_TYPE (bt_code, bt_name, description) VALUES ('review', '거래후기', '거래후기 게시판');
 INSERT INTO BOARD_TYPE (bt_code, bt_name, description) VALUES ('question', '질문', '취미 게시판');
 INSERT INTO BOARD_TYPE (bt_code, bt_name, description) VALUES ('hobby', '취미', '취미 게시판');
 
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '테스트 제목1', '테스트 내용1', 'free', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목2', '자유 게시판 테스트 내용2', 'free', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목3', '자유 게시판 테스트 내용3', 'free', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목4', '자유 게시판 테스트 내용4', 'free', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목5', '자유 게시판 테스트 내용5', 'free', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목6', '자유 게시판 테스트 내용6', 'free', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목7', '자유 게시판 테스트 내용7', 'free', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목8', '자유 게시판 테스트 내용8', 'free', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목9', '자유 게시판 테스트 내용9', 'free', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목10', '자유 게시판 테스트 내용10', 'free', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목11', '자유 게시판 테스트 내용11', 'free', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목12', '자유 게시판 테스트 내용12', 'free', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '거래후기 게시판 테스트 제목1', '거래후기 게시판 테스트 내용1', 'review', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '거래후기 게시판 테스트 제목2', '거래후기 게시판 테스트 내용2', 'review', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '거래후기 게시판 테스트 제목3', '자유 게시판 테스트 내용3', 'review', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '거래후기 게시판 테스트 제목4', '거래후기 게시판 테스트 내용4', 'review', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '거래후기 게시판 테스트 제목5', '거래후기 게시판 테스트 내용5', 'review', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '거래후기 게시판 테스트 제목6', '거래후기 게시판 테스트 내용6', 'review', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '거래후기 게시판 테스트 제목7', '거래후기 게시판 테스트 내용7', 'review', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '거래후기 게시판 테스트 제목8', '거래후기 게시판 테스트 내용8', 'review', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '거래후기 게시판 테스트 제목9', '거래후기 게시판 테스트 내용9', 'review', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '거래후기 게시판 테스트 제목10', '거래후기 게시판 테스트 내용10', 'review', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '거래후기 게시판 테스트 제목11', '거래후기 게시판 테스트 내용11', 'review', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '거래후기 게시판 테스트 제목12', '거래후기 게시판 테스트 내용12', 'review', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '유머 게시판 테스트 제목1', '유머 게시판 테스트 제목1', 'humor', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '유머 게시판 테스트 제목2', '유머 게시판 테스트 제목2', 'humor', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '유머 게시판 테스트 제목3', '유머 게시판 테스트 제목3', 'humor', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '유머 게시판 테스트 제목4', '유머 게시판 테스트 제목4', 'humor', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '유머 게시판 테스트 제목5', '유머 게시판 테스트 제목5', 'humor', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '질문 게시판 테스트 제목1', '질문 게시판 테스트 제목1', 'question', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '질문 게시판 테스트 제목2', '질문 게시판 테스트 제목2', 'question', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '질문 게시판 테스트 제목3', '질문 게시판 테스트 제목3', 'question', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '질문 게시판 테스트 제목4', '질문 게시판 테스트 제목4', 'question', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '질문 게시판 테스트 제목5', '질문 게시판 테스트 제목5', 'question', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '취미 게시판 테스트 제목1', '취미 게시판 테스트 제목1', 'hobby', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '취미 게시판 테스트 제목2', '취미 게시판 테스트 제목2', 'hobby', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '취미 게시판 테스트 제목3', '취미 게시판 테스트 제목3', 'hobby', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '취미 게시판 테스트 제목4', '취미 게시판 테스트 제목4', 'hobby', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '취미 게시판 테스트 제목5', '취미 게시판 테스트 제목5', 'hobby', '1', '관리자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 
  INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목40000', '자유 게시판 테스트 내용40000', 'free', '2', '닉넴사용자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
  INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목256', '자유 게시판 테스트 내용256', 'hobby', '2', '닉넴사용자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
  INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목512', '자유 게시판 테스트 내용512', 'hobby', '2', '닉넴사용자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
  INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목8080', '자유 게시판 테스트 내용8080', 'free', '2', '닉넴사용자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
  INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목808', '자유 게시판 테스트 내용808', 'hobby', '2', '닉넴사용자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
  INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목700', '자유 게시판 테스트 내용700', 'free', '2', '닉넴사용자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
  INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목17', '자유 게시판 테스트 내용17', 'humor', '2', '닉넴사용자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
  INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목71', '자유 게시판 테스트 내용71', 'hobby', '2', '닉넴사용자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
  INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목7', '자유 게시판 테스트 내용7', 'free', '2', '닉넴사용자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
  INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목77', '자유 게시판 테스트 내용77', 'free', '2', '닉넴사용자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
  INSERT INTO BOARD (bno, title, content, bt_code, writer_no, writer_nickname, regdate, moddate, hit, is_deleted)
 VALUES (SEQ_BOARD_BNO.NEXTVAL, '자유 게시판 테스트 제목23', '자유 게시판 테스트 내용23', 'question', '2', '닉넴사용자', SYSDATE, SYSDATE, DEFAULT, DEFAULT);
 
 INSERT INTO BOARD_REPORT(bno, mem_no, regdate)
 VALUES (1, 1, SYSDATE);
 
 INSERT INTO BOARD_EVALUATE(bno, mem_no, regdate, e_type)
 VALUES (1, 1, SYSDATE, 'LIKE');
 
 INSERT INTO BOARD_COMMENT (cno, bno, content, writer_no, writer_nickname, parent_writer_no, parent_writer_nickname, regdate, moddate, parent_no, is_deleted)
 VALUES(SEQ_BOARD_COMMNET_CNO.NEXTVAL, 1, '테스트 댓글1', '1', '관리자', NULL, NULL, SYSDATE, SYSDATE, NULL, DEFAULT);
 INSERT INTO BOARD_COMMENT (cno, bno, content, writer_no, writer_nickname, parent_writer_no, parent_writer_nickname, regdate, moddate, parent_no, is_deleted)
 VALUES(SEQ_BOARD_COMMNET_CNO.NEXTVAL, 1, '테스트 댓글2', '1', '관리자', NULL, NULL, SYSDATE, SYSDATE, NULL, DEFAULT);
 INSERT INTO BOARD_COMMENT (cno, bno, content, writer_no, writer_nickname, parent_writer_no, parent_writer_nickname, regdate, moddate, parent_no, is_deleted)
 VALUES(SEQ_BOARD_COMMNET_CNO.NEXTVAL, 3, '테스트 댓글3', '1', '관리자', NULL, NULL, SYSDATE, SYSDATE, NULL, DEFAULT);
 INSERT INTO BOARD_COMMENT (cno, bno, content, writer_no, writer_nickname, parent_writer_no, parent_writer_nickname, regdate, moddate, parent_no, is_deleted)
 VALUES(SEQ_BOARD_COMMNET_CNO.NEXTVAL, 4, '테스트 댓글', '1', '관리자', NULL, NULL, SYSDATE, SYSDATE, NULL, DEFAULT);
 INSERT INTO BOARD_COMMENT (cno, bno, content, writer_no, writer_nickname, parent_writer_no, parent_writer_nickname, regdate, moddate, parent_no, is_deleted)
 VALUES(SEQ_BOARD_COMMNET_CNO.NEXTVAL, 5, '테스트 댓글', '1', '관리자', NULL, NULL, SYSDATE, SYSDATE, NULL, DEFAULT);
 INSERT INTO BOARD_COMMENT (cno, bno, content, writer_no, writer_nickname, parent_writer_no, parent_writer_nickname, regdate, moddate, parent_no, is_deleted)
 VALUES(SEQ_BOARD_COMMNET_CNO.NEXTVAL, 5, '테스트 댓글', '1', '관리자', NULL, NULL, SYSDATE, SYSDATE, NULL, DEFAULT);
 
 INSERT INTO MESSAGE
 VALUES(SEQ_MESSAGE_MNO.NEXTVAL, 1,'고아름',2, DEFAULT, DEFAULT, DEFAULT, '메세지 제목', '메세지 내용', NULL);
 INSERT INTO MESSAGE
 VALUES(SEQ_MESSAGE_MNO.NEXTVAL, 1,'김아름',2, DEFAULT, DEFAULT, DEFAULT, '메세지 제목2', '메세지 내용2', NULL);
 INSERT INTO MESSAGE
 VALUES(SEQ_MESSAGE_MNO.NEXTVAL, 1,'박아름',2, DEFAULT, DEFAULT, DEFAULT, '메세지 제목3', '메세지 내용3', NULL);
 INSERT INTO MESSAGE
 VALUES(SEQ_MESSAGE_MNO.NEXTVAL, 1,'이아름',2, DEFAULT, DEFAULT, DEFAULT, '메세지 제목4', '메세지 내용4', NULL);
 INSERT INTO MESSAGE
 VALUES(SEQ_MESSAGE_MNO.NEXTVAL, 1,'유아름',2, DEFAULT, DEFAULT, DEFAULT, '메세지 제목5', '메세지 내용5', NULL);
 
 INSERT INTO FAQ_TYPE VALUES('account', '계정');
 INSERT INTO FAQ_TYPE VALUES('report', '신고');
 INSERT INTO FAQ_TYPE VALUES('use', '이용');
 INSERT INTO FAQ_TYPE VALUES('etc', '기타');
 
 INSERT INTO FAQ VALUES(SEQ_FNO.NEXTVAL,'account', '회원 탈퇴방법', '아직 불가능합니다.', sysdate, sysdate);
 INSERT INTO FAQ VALUES(SEQ_FNO.NEXTVAL,'account', '회원 가입방법', '아직 할 수없습니다.', sysdate, sysdate);
 INSERT INTO FAQ VALUES(SEQ_FNO.NEXTVAL,'account', '회원 정보관리', '이미 우리겁니다.', sysdate, sysdate);
 INSERT INTO FAQ VALUES(SEQ_FNO.NEXTVAL,'report', '신고 방법', '신고는 못 합니다.', sysdate, sysdate);
 INSERT INTO FAQ VALUES(SEQ_FNO.NEXTVAL,'report', '불법, 사기', '그냥 경찰에 신고 하십시오.', sysdate, sysdate);
 
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목1', '내용1', DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목2', '내용2', DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목3', '내용3', '이벤트', DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목4', '내용4', DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목5', '내용5', '이벤트', DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목6', '내용6', DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목7', '내용7', '이벤트', DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목8', '내용8', DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목9', '내용9', '이벤트', DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목10', '내용10', DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목11', '내용11', '이벤트', DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목12', '내용12', DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목13', '내용13', DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목14', '내용14', '이벤트', DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목15', '내용15', DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목16', '내용16', '이벤트', DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목17', '내용17', DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목18', '내용18', DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목19', '내용19', '이벤트', DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '제목20', '내용20', DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '거래시 유의 사항', '안녕하세요. 거래시...', DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '물물 서비스 오픈 이벤트', '안녕하세요. 물물 서비스 오픈 이벤트 안내입니다. 신규 가입자 분들에게는 물물 포인트...', '이벤트', DEFAULT, DEFAULT, DEFAULT, 'N');
 INSERT INTO NOTICE VALUES(SEQ_NOTICE_NNO.NEXTVAL, '물물 서비스 오픈', '안녕하세요. 많은 이용 바랍니다.', DEFAULT, DEFAULT, DEFAULT, DEFAULT, 'N');
 
 INSERT INTO FAQ VALUES(SEQ_FNO.NEXTVAL,'use', '검색 활용', '검색이 뭐야.', sysdate, sysdate);
 INSERT INTO FAQ VALUES(SEQ_FNO.NEXTVAL,'use', '사이트의의', '물물교환 시뮬레이션.', sysdate, sysdate);
 INSERT INTO FAQ VALUES(SEQ_FNO.NEXTVAL,'etc', '제일 맛있는 음식은?', '집밥.', sysdate, sysdate);
 INSERT INTO FAQ VALUES(SEQ_FNO.NEXTVAL,'etc', '하고 싶은 말이라도?', '딱히.', sysdate, sysdate);
   
 INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
 VALUES (SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '컴퓨터', null);
 INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
 VALUES (SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '모니터', '1');
 INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
 VALUES (SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '메인보드', '1');
 INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
 VALUES (SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, 'CPU', '1');
 INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
 VALUES (SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, 'RAM', '1');
 INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
VALUES(SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '화장품', NULL);
INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
VALUES(SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '로션', 
(SELECT TDC_NO FROM TRADE_CATEGORY WHERE NAME = '화장품'));
INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
VALUES(SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '립스틱', 
(SELECT TDC_NO FROM TRADE_CATEGORY WHERE NAME = '화장품'));
INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
VALUES(SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '리무버', 
(SELECT TDC_NO FROM TRADE_CATEGORY WHERE NAME = '화장품'));
INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
VALUES(SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '토너', 
(SELECT TDC_NO FROM TRADE_CATEGORY WHERE NAME = '화장품'));
INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
VALUES(SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '에멀전', 
(SELECT TDC_NO FROM TRADE_CATEGORY WHERE NAME = '화장품'));
INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
VALUES(SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '향수', 
(SELECT TDC_NO FROM TRADE_CATEGORY WHERE NAME = '화장품'));
INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
VALUES(SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '시계', NULL);
INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
VALUES(SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '페블', 
(SELECT TDC_NO FROM TRADE_CATEGORY WHERE NAME = '시계'));
INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
VALUES(SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '롤렉스', 
(SELECT TDC_NO FROM TRADE_CATEGORY WHERE NAME = '시계'));
INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
VALUES(SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '카시오', 
(SELECT TDC_NO FROM TRADE_CATEGORY WHERE NAME = '시계'));
INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
VALUES(SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '알마니', 
(SELECT TDC_NO FROM TRADE_CATEGORY WHERE NAME = '시계'));
INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
VALUES(SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '주방기구', NULL);
INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
VALUES(SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '뒤집개', 
(SELECT TDC_NO FROM TRADE_CATEGORY WHERE NAME = '주방기구'));
INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
VALUES(SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '냄비', 
(SELECT TDC_NO FROM TRADE_CATEGORY WHERE NAME = '주방기구'));
INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
VALUES(SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '도마', 
(SELECT TDC_NO FROM TRADE_CATEGORY WHERE NAME = '주방기구'));
INSERT INTO TRADE_CATEGORY(tdc_no, name, parent_no)
VALUES(SEQ_TRADE_CATEGORY_TDC_NO.NEXTVAL, '식칼', 
(SELECT TDC_NO FROM TRADE_CATEGORY WHERE NAME = '주방기구'));

 
 INSERT INTO TRADE (tno, target_tno,	tdc_no, title, content, price, road_addr_part, sido, sigugun, dongmyun, addr_detail,	lat, lng, trade_code, regdate, moddate, writer_uno, writer_nickname, enddate,trade_type)
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 교환 제목1', '테스트 교환 내용1', 10000, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '상세주소', 37.588801, 126.913827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'S', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 교환 제목2', '테스트 교환 내용2', 14000, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.945827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'S', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 교환 제목3', '테스트 교환 내용3', 10000, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.962127, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'S', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 교환 제목4', '테스트 교환 내용4', 12000, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964817, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'S', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 교환 제목5', '테스트 교환 내용5', 1000, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964927, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'S', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 교환 제목6', '테스트 교환 내용6', 13000, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'S', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 교환 제목7', '테스트 교환 내용7', 16000, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.962827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'S', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 교환 제목8', '테스트 교환 내용8', 14400, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.962827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'S', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 교환 제목9', '테스트 교환 내용9', 5000, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'S', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 교환 제목10', '테스트 교환 내용10', 32000, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964527, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'S', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 교환 제목11', '테스트 교환 내용11', 70000, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.954827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'S', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 교환 제목12', '테스트 교환 내용12', 50000, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.955827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'S', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 나눔 제목1', '테스트 나눔 내용1', null, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964127, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'F', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 나눔 제목2', '테스트 나눔 내용2', null, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964127, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'F', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 나눔 제목3', '테스트 나눔 내용3', null, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'F', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 나눔 제목4', '청개구리 나눕니다.', null, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'F', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 나눔 제목5', '카멜레온 나눕니다.', null, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'F', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 나눔 제목6', '테스트 나눔 내용6', null, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'F', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 나눔 제목7', '테스트 나눔 내용7', null, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'F', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 나눔 제목8', '테스트 나눔 내용8', null, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'F', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 나눔 제목9', '테스트 나눔 내용9', null, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'F', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 나눔 제목10', '테스트 나눔 내용10', null, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'F', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 구함 제목1', '테스트 구함 내용1', null, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'W', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 구함 제목2', '관리자 구함 내용', null, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'W', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 구함 제목3', '웹개발자 구함', null, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'W', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 구함 제목4', '웹개발자 구함', null, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'W', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 구함 제목5', '웹개발자 구함', null, '서울특별시 강남구 논현로6길', '서울특별시', '강남구', '개포4동', '2층', 37.588801, 126.964827, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'W', null, null, null);
 INSERT INTO TRADE (tno, target_tno,	tdc_no, title, content, price, road_addr_part, sido, sigugun, dongmyun, addr_detail,	lat, lng, trade_code, regdate, moddate, writer_uno, writer_nickname, enddate,trade_type)
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 교환 제목1', '테스트 교환 내용1', 10000, '서울특별시 중구 소공동', '서울특별시', '중구', '소공동', '2층', 37.563785, 126.981528, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'S', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 교환 제목2', '테스트 교환 내용2', 14000, '서울특별시 중구 정동 8-3', '서울특별시', '중구', '정동 8-3', '2층', 37.565805, 126.974063, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'S', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 교환 제목3', '테스트 교환 내용3', 10000, '서울특별시 중구 을지로1길 34', '서울특별시', '중구', '을지로1길', '34 2층', 37.567585, 126.979707, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'S', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 교환 제목4', '테스트 교환 내용4', 12000, '서울특별시 중구 세종대로 99 덕수궁', '서울특별시', '중구', '세종대로', '99 덕수궁 2층', 37.565516, 126.975398, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'S', null, null, null);
 INSERT INTO TRADE 
 VALUES (SEQ_TRADE_TNO.NEXTVAL, null, 1, '테스트 교환 제목5', '테스트 교환 내용5', 1000, '서울특별시 중구 을지로1가 38-1', '서울특별시', '중구', '을지로1가', '38-1 2층', 37.566766, 126.979953, 'S', SYSDATE, SYSDATE, 1, '관리자', SYSDATE, 'S', null, null, null);
 
 INSERT INTO TRADE_COMMENT
 VALUES (SEQ_TRADE_COMMENT_TC_NO.NEXTVAL, 1, '저랑 거래 하시죠', 'http://localhost:8998/moolmool/trade/swap/1', SYSDATE, 1, '테스트유저01');
 INSERT INTO TRADE_COMMENT
 VALUES (SEQ_TRADE_COMMENT_TC_NO.NEXTVAL, 1, '저랑 거래 하시죠', 'http://localhost:8998/moolmool/trade/swap/2', SYSDATE, 1, '테스트유저02');
 INSERT INTO TRADE_COMMENT
 VALUES (SEQ_TRADE_COMMENT_TC_NO.NEXTVAL, 1, '저랑 거래 하시죠', 'http://localhost:8998/moolmool/trade/swap/3', SYSDATE, 1, '테스트유저03');
 INSERT INTO TRADE_COMMENT
 VALUES (SEQ_TRADE_COMMENT_TC_NO.NEXTVAL, 1, '저랑 거래 하시죠', 'http://localhost:8998/moolmool/trade/swap/4', SYSDATE, 1, '테스트유저04');
 INSERT INTO TRADE_COMMENT
 VALUES (SEQ_TRADE_COMMENT_TC_NO.NEXTVAL, 2, '저랑 거래 하시죠', 'http://localhost:8998/moolmool/trade/swap/5', SYSDATE, 1, '테스트유저05');
 
 INSERT INTO MEMO (WRITER_NO, TARGET_NO, CONTENT, REGDATE, MODDATE)
 VALUES (2, 1, '이 사람은 관리자', SYSDATE, SYSDATE);
 
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:coral">face</i>', 'font', 0, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:red">face</i>', 'font', 10, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:cornflowerblue">face</i>', 'font', 10, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:green">face</i>', 'font', 10, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:blue">face</i>', 'font', 10, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:gold">face</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:gold">face</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:gold">face</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:gold">face</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:gold">face</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:blue">face</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:coral">face</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:gold">android</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:coral">android</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:gold">android</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:gold">android</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:blue">android</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:gold">android</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:gold">android</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:gold">android</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:gold">android</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:gold">android</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:blue">android</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:red">android</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:gold">face</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:gold">face</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:gold">face</i>', 'font', 50, SYSDATE);
 INSERT INTO PERSONACON (psc_no, name, description, html_tag, psc_type, price, regdate)
 VALUES (SEQ_PSC_NO.NEXTVAL, '아이콘테스트', '구글 아이콘', '<i class="material-icons" style="color:gold">face</i>', 'font', 50, SYSDATE);
 
 INSERT INTO PERSONACON_ORDER_HISTORY (psc_no, mem_no, orderdate)
 VALUES (1, 1, SYSDATE);
 
 INSERT INTO SHOP_ITEM (item_no, name, description, html_tag, item_type, price, regdate)
 VALUES (1, '닉네임 변경권', '닉네임을 변경할 수 있습니다.', '<span class="glyphicon glyphicon-gift" style="font-size:24px;color:gold;" aria-hidden="true"></span>', 'font', 100, SYSDATE);

 
 INSERT INTO POINT (MEM_NO, LOG_COMMENT, POINT_CHANGE, ADD_ELI, POINT_DATE)
 VALUES (1, '회원가입 기념 100점 추가', 100, 'a', default);
 INSERT INTO POINT (MEM_NO, LOG_COMMENT, POINT_CHANGE, ADD_ELI, POINT_DATE)
 VALUES (1, '상점 이용 10점 차감', 10, 'e', default);
 INSERT INTO POINT (MEM_NO, LOG_COMMENT, POINT_CHANGE, ADD_ELI, POINT_DATE)
 VALUES (1, '덧글 작성 5점 추가', 5, 'a', default);
 
 INSERT INTO POINT (MEM_NO, LOG_COMMENT, POINT_CHANGE, ADD_ELI, POINT_DATE)
 VALUES (2, '회원가입 기념 100점 추가', 100, 'a', default);
  INSERT INTO POINT (MEM_NO, LOG_COMMENT, POINT_CHANGE, ADD_ELI, POINT_DATE)
 VALUES (1, '상점 이용 10점 차감', 10, 'e', default);
  INSERT INTO POINT (MEM_NO, LOG_COMMENT, POINT_CHANGE, ADD_ELI, POINT_DATE)
 VALUES (1, '상점 이용 10점 차감', 10, 'e', default);
 
 INSERT INTO SLIDE_CONTENT (sno, content, regdate, writer_no)
 VALUES (1, '솔낭구<br>copyrightⓒ wappl', SYSDATE, 1);
    
 COMMIT;
 
 COMMENT ON COLUMN QUESTION.QNO IS '식별자';
 COMMENT ON COLUMN QUESTION.WRITER_NO IS 'MEMBER 테이블 식별자';
 COMMENT ON COLUMN QUESTION.WRITER_NICKNAME IS 'MEMBER 테이블 닉네임';
 COMMENT ON COLUMN QUESTION.TITLE IS '제목';
 COMMENT ON COLUMN QUESTION.CONTENT IS '내용';
 COMMENT ON COLUMN QUESTION.REGDATE IS '작성일';
 COMMENT ON COLUMN QUESTION.MODDATE IS '수정일';
 COMMENT ON COLUMN QUESTION.IS_PRIVATE IS '공개/비공개 여부';
 COMMENT ON COLUMN QUESTION.IS_DELETED IS '삭제여부';
 COMMENT ON COLUMN QUESTION.REPLY IS '답글등록 여부';
 
 COMMENT ON COLUMN ANSWER.ANO IS '식별자';
 COMMENT ON COLUMN ANSWER.QNO IS 'QUESTION 테이블 식별자';
 COMMENT ON COLUMN ANSWER.CONTENT IS '내용';
 COMMENT ON COLUMN ANSWER.REGDATE IS '작성일';
 COMMENT ON COLUMN ANSWER.MODDATE IS '수정일';
 COMMENT ON COLUMN ANSWER.IS_EVALUATED IS '평가등록 여부';
 
 COMMENT ON COLUMN QNA_SATISFACTION.ANO IS 'ANSWER 테이블 ANO 참조 / 식별자';
 COMMENT ON COLUMN QNA_SATISFACTION.WRITER_NO IS 'MEMBER 테이블 식별자';
 COMMENT ON COLUMN QNA_SATISFACTION.RATE IS '평점';
 COMMENT ON COLUMN QNA_SATISFACTION.OPINION IS '의견';
 COMMENT ON COLUMN QNA_SATISFACTION.REGDATE IS '작성일';
 
 COMMENT ON COLUMN FAQ_TYPE.DESCRIPTION IS '설명';
 COMMENT ON COLUMN FAQ_TYPE.FNAME IS '이름';
 
 COMMENT ON COLUMN FAQ.FNAME IS 'FAQ_TYPE 테이블 식별자';
 COMMENT ON COLUMN FAQ.FNO IS '식별자';
 COMMENT ON COLUMN FAQ.TITLE IS '제목';
 COMMENT ON COLUMN FAQ.CONTENT IS '내용';
 COMMENT ON COLUMN FAQ.REGDATE IS '등록시간';
 COMMENT ON COLUMN FAQ.MODDATE IS '수정시간';
 
 COMMENT ON COLUMN POINT.ADD_ELI IS '포인트 추가/삭제여부';
 COMMENT ON COLUMN POINT.LOG_COMMENT IS '포인트 변동 내역';
 COMMENT ON COLUMN POINT.POINT_CHANGE IS '변동된 포인트';
 COMMENT ON COLUMN POINT.POINT_DATE IS '포인트 변동 날짜'