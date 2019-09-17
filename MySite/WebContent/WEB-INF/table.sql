--	회원 목록

CREATE TABLE SITE_MEMBER_TABLE(	
 	"USERCODE" NUMBER(5,0), 
	"ID" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(12 BYTE) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"PASSWORD" VARCHAR2(25 BYTE) NOT NULL ENABLE, 
	"REGDATE" DATE NOT NULL ENABLE, 
);

--	글 목록

CREATE TABLE SITE_POST_LIST(
    postnum number(38) primary key,
    id varchar2(20) not null,
    name varchar2(10) not null,
    description clob,
    imgsrc varchar2(50) not null,
    regdate date not null,
    likecount number(38) default 0
);

--	시퀀스

create SEQUENCE seq_site_member_num
  INCREMENT BY 1 ;

create SEQUENCE seq_site_post_num
  INCREMENT BY 1 ;