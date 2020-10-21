DROP TABLE member;
DROP TABLE board;
DROP TABLE reply;
DROP TABLE scrap_post;
DROP SEQUENCE board_seq;
DROP SEQUENCE reply_seq;

CREATE TABLE member(
   id varchar2(100) PRIMARY KEY,
   nickname varchar2(100) NOT NULL UNIQUE,
   password varchar2(100) NOT NULL,
   ageName varchar2(100) NOT NULL,
   point number default 0
)

create table follow(
	id varchar2(100),
	nickname varchar2(100),
	constraint fk_follow primary key(id,nickname)
)
CREATE SEQUENCE follow_seq nocache;

select *from follow;
drop table follow;
CREATE SEQUENCE board_seq nocache;

CREATE TABLE board(
   post_no number primary key,
   id varchar2(100) not null,
   title varchar2(100) not null,
   view_count number default 0,
   content clob not null,
   like_count number default 0,
   regdate date not null,
   constraint fk_boardid foreign key(id) references member(id) on delete cascade
)

-- board 테이블 명 hit_count -> view_count로 변경
ALTER TABLE board
RENAME COLUMN hit_count TO view_count;

CREATE SEQUENCE reply_seq nocache;

CREATE TABLE reply (
   rep_no number primary key,
   post_no number not null,
   rep_content varchar2(500) not null,
   constraint fk_boardno foreign key(post_no) references board(post_no) on delete cascade
);


CREATE TABLE scrap_post (
    post_no number,
    id varchar2(100),
    CONSTRAINT pk_scrap PRIMARY KEY (POST_NO,ID)
);

select * from scrap_post
select * from reply
select * from board;
select * from member;

INSERT INTO member(id, nickname, password, ageName) VALUES('donguk', '욱과짱', 'donguk', '조선시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('lastcow', '쏭쏭이', 'lastcow', '고조선시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('milk', '훌륭한정주임', 'milk', '고려시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('dance_machine', '노래도잘해', 'dance_machine', '삼국시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('rider', '세히찡', 'rider', '조선시대');




insert into board(post_no,id,title,content,regdate) values(board_seq.nextval,'donguk','하이','안녕하세요',sysdate);
insert into board(post_no,id,title,content,regdate) values(board_seq.nextval,'lastcow','안녕','ㅈㄱㄴ',sysdate);
insert into board(post_no,id,title,content,regdate) values(board_seq.nextval,'milk','봉주르','프랑스',sysdate);
insert into board(post_no,id,title,content,regdate) values(board_seq.nextval,'dance_machine','구텐탁','독일',sysdate);
insert into board(post_no,id,title,content,regdate) values(board_seq.nextval,'rider','부아앙~','오토바이',sysdate);

INSERT INTO member(id, nickname, password, ageName) VALUES('ggok', '꾹이', 'donguk', '조선시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('yoeongsub', '잘생긴송영섭', 'lastcow', '고조선시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('yewool', '스텔라', 'milk', '고려시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('socold', '추워', 'dance_machine', '삼국시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('yomi', '요미세히', 'yomi', '조선시대');

INSERT INTO reply(rep_no, post_no, rep_content) VALUES(reply_seq.nextval, '1', 'yomi1');
INSERT INTO reply(rep_no, post_no, rep_content) VALUES(reply_seq.nextval, '2', 'yomi2');
INSERT INTO reply(rep_no, post_no, rep_content) VALUES(reply_seq.nextval, '3', 'yomi3');

INSERT INTO scrap_post VALUES('1', 'donguk');
INSERT INTO scrap_post VALUES('1', 'yewool');
INSERT INTO scrap_post VALUES('3', 'socold');
INSERT INTO scrap_post VALUES('3', 'yomi');
select * from member m, board b, reply r, scrap_post sp where m.id = b.id and b.id=sp.id and r.post_no=b.post_no;

-- 게시글 상세보기
select * from member m, board b where m.id = b.id;

-- 시대 별 전체 글 개수 
SELECT COUNT(*)
FROM   BOARD b, MEMBER m
WHERE  b.id = m.id AND m.ageName='조선시대';

SELECT B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE, m.ageName, b.post_no, b.id, b.content
FROM BOARD B, MEMBER M 
WHERE B.ID=M.ID AND M.AGENAME='조선시대';


SELECT COUNT(*) FROM member WHERE nickName='노래도잘해';





update member set nickName='파프리카파프이다', password='11111'
WHERE id='java'

-- 게시글 받아오기
SELECT b.title, m.nickName, m.ageName 
FROM board b, member m 
WHERE b.id=m.id 
ORDER BY like_count, view_count DESC


SELECT b.*, m.name
FROM   ( SELECT row_number() over(ORDER BY no DESC) AS rnum, no, title, hits, 
			TO_CHAR(time_posted, 'YYYY-MM-DD') AS time_posted, id 
			FROM   board) b, BOARD_MEMBER m 
WHERE  b.id = m.id AND rnum BETWEEN ? AND ?	 

   post_no number primary key,
   id varchar2(100) not null,
   title varchar2(100) not null,
   view_count number default 0,
   content clob not null,
   like_count number default 0,
   regdate date not null,

SELECT b.*, m.name
FROM   ( SELECT row_number() over(ORDER BY no DESC) AS rnum, no, title, hits, 
			TO_CHAR(time_posted, 'YYYY-MM-DD') AS time_posted, id 
			FROM   board) b, BOARD_MEMBER m 
WHERE  b.id = m.id AND rnum BETWEEN ? AND ?	 

SELECT  b.*, m.*
FROM  ( SELECT row_number() over(ORDER BY post_no DESC) AS rnum, post_no, id, title, view_count, content, like_count, 
		TO_CHAR(regdate, 'YYYY-MM-DD') AS regdate
		FROM   board) b, member m
WHERE  b.id = m.id AND m.agename='조선시대' AND rnum BETWEEN 1 AND 5
		

SELECT  B.RNUM ,B.POST_NO, B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,AGEDATE
FROM ( SELECT ROW_NUMBER() OVER(ORDER BY POST_NO desc) AS RNUM ,b.post_no,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE ");
		FROM BOARD B, MEMBER M ");
WHERE B.ID=M.ID AND M.AGENAME=? ");
) B , MEMBER M ");
WHERE B.NICKNAME=M.NICKNAME and rnum between ? and ? order by rnum asc");


update member set point=20 where id='lastcow';
update member set point=450 where id='milk';
update member set point=60 where id='dance_machine';
update member set point=1550 where id='rider';

update member set point=2550 where id='java';
update member set point=812 where id='socold';
update member set point=412 where id='yewool';

select * from member order by point desc;


alter table scrap_post add(regdate date default sysdate);
alter table scrap_post RENAME COLUMN regdate to scraped_regdate;
insert into scrap_post values('1','donguk',sysdate);
insert into scrap_post values('2','donguk',sysdate);
insert into scrap_post values('3','donguk',sysdate);
insert into scrap_post values('4','donguk',sysdate);
insert into scrap_post values('15','donguk',sysdate);
insert into scrap_post values('17','donguk',sysdate);
insert into scrap_post values('16','donguk',sysdate);
insert into scrap_post values('18','donguk',sysdate);
insert into scrap_post values('21','donguk',sysdate);
insert into scrap_post values('31','donguk',sysdate);
insert into scrap_post values('22','donguk',sysdate);
insert into scrap_post values('23','donguk',sysdate);
insert into scrap_post values('24','donguk',sysdate);
insert into scrap_post values('25','donguk',sysdate);
insert into scrap_post values('26','donguk',sysdate);
insert into scrap_post values('31','donguk',sysdate);
insert into scrap_post values('32','donguk',sysdate);
insert into scrap_post values('33','donguk',sysdate);
insert into scrap_post values('34','donguk',sysdate);
insert into scrap_post values('35','donguk',sysdate);
insert into scrap_post values('36','donguk',sysdate);
insert into scrap_post values('37','donguk',sysdate);
insert into scrap_post values('38','donguk',sysdate);
insert into scrap_post values('39','donguk',sysdate);
insert into scrap_post values('40','donguk',sysdate);
insert into scrap_post values('41','donguk',sysdate);
insert into scrap_post values('42','donguk',sysdate);
insert into scrap_post values('43','donguk',sysdate);

insert into scrap_post values('51','donguk',sysdate);
insert into scrap_post values('52','donguk',sysdate);
insert into scrap_post values('53','donguk',sysdate);
insert into scrap_post values('54','donguk',sysdate);
insert into scrap_post values('55','donguk',sysdate);
insert into scrap_post values('56','donguk',sysdate);
insert into scrap_post values('57','donguk',sysdate);
insert into scrap_post values('58','donguk',sysdate);
insert into scrap_post values('59','donguk',sysdate);
insert into scrap_post values('60','donguk',sysdate);
insert into scrap_post values('61','donguk',sysdate);
insert into scrap_post values('62','donguk',sysdate);
insert into scrap_post values('63','donguk',sysdate);
insert into scrap_post values('64','donguk',sysdate);
insert into scrap_post values('65','donguk',sysdate);
insert into scrap_post values('66','donguk',sysdate);
insert into scrap_post values('67','donguk',sysdate);
insert into scrap_post values('68','donguk',sysdate);
insert into scrap_post values('69','donguk',sysdate);
insert into scrap_post values('70','donguk',sysdate);
insert into scrap_post values('71','donguk',sysdate);
insert into scrap_post values('72','donguk',sysdate);
insert into scrap_post values('74','donguk',sysdate);
insert into scrap_post values('75','donguk',sysdate);
insert into scrap_post values('76','donguk',sysdate);
insert into scrap_post values('77','donguk',sysdate);
insert into scrap_post values('78','donguk',sysdate);
insert into scrap_post values('79','donguk',sysdate);
insert into scrap_post values('80','donguk',sysdate);
insert into scrap_post values('81','donguk',sysdate);
insert into scrap_post values('82','donguk',sysdate);
insert into scrap_post values('83','donguk',sysdate);
insert into scrap_post values('84','donguk',sysdate);
insert into scrap_post values('85','donguk',sysdate);
insert into scrap_post values('86','donguk',sysdate);
insert into scrap_post values('87','donguk',sysdate);
insert into scrap_post values('88','donguk',sysdate);
insert into scrap_post values('89','donguk',sysdate);
insert into scrap_post values('90','donguk',sysdate);
insert into scrap_post values('91','donguk',sysdate);
insert into scrap_post values('92','donguk',sysdate);
insert into scrap_post values('93','donguk',sysdate);
insert into scrap_post values('94','donguk',sysdate);
insert into scrap_post values('95','donguk',sysdate);
insert into scrap_post values('96','donguk',sysdate);
insert into scrap_post values('97','donguk',sysdate);

insert into scrap_post values('98','donguk',sysdate);
insert into scrap_post values('99','donguk',sysdate);
insert into scrap_post values('100','donguk',sysdate);
insert into scrap_post values('101','donguk',sysdate);
insert into scrap_post values('102','donguk',sysdate);
insert into scrap_post values('103','donguk',sysdate);
insert into scrap_post values('104','donguk',sysdate);
insert into scrap_post values('105','donguk',sysdate);
insert into scrap_post values('106','donguk',sysdate);


select *from SCRAP_POST
select b.rnum, b.id, b.nickname,b.title,b.regDate,b.content,b.view_count, b.like_count, b.ageName,b.post_no 
from(select ROW_NUMBER() OVER(ORDER BY POST_NO desc) AS RNUM, m.id, m.nickname, b.title,b.regDate,b.content,  
b.view_count, b.like_count, m.ageName,b.post_no from member m, board b where m.id = b.id and m.nickname 
in (select f.nickname from member m, follow f where m.id=f.id and m.id='donguk') 
order by b.post_no desc) b where b.rnum between 1 and 8;

SELECT  B.RNUM ,B.POST_NO, B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,AGEDATE, B.rep_count 
FROM ( 
		SELECT ROW_NUMBER() OVER(ORDER BY POST_NO desc) AS RNUM ,b.post_no,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') ,
			FROM BOARD B, MEMBER M 
			WHERE B.ID=M.ID AND M.AGENAME=?
			) B , MEMBER M
			WHERE B.NICKNAME=M.NICKNAME and rnum between 1 and 8 
			
SELECT COUNT(*) from member m, board b where m.id = b.id and m.nickname in 
	    (select f.nickname from member m, follow f 
	         where m.id=f.id and m.id='donguk')
	    order by b.post_no desc;
	    
SELECT COUNT(*) from member m, scrap b where m.id = b.id and m.nickname in 
	    (select f.nickname from member m, follow f 
	         where m.id=f.id and m.id='donguk')
	    order by b.post_no desc;
SELECT count(*) FROM scrap_post WHERE id='donguk'
ORDER BY scraped_regdate desc


SELECT post_no, scraped_regdate, ROW_NUMBER() OVER(ORDER BY scraped_regdate desc) AS RNUM
FROM scrap_post 
WHERE id='donguk'
ORDER BY scraped_regdate desc;

SELECT b.rnum
FROM (SELECT b.post_no, sp.scraped_regdate, ROW_NUMBER() OVER(ORDER BY sp.scraped_regdate desc) AS RNUM, m.agename, b.title,b.LIKE_COUNT,b.VIEW_COUNT
FROM scrap_post sp, member m, board b  WHERE m.id='donguk' and m.id=sp.id and sp.post_no = b.post_no) b 
where b.rnum between 1 and 8;

select b.rnum, b.post_no, b.scraped_regdate,b.agename, b.title,b.LIKE_COUNT,b.VIEW_COUNT, b.agename,b.nickname
from ( select ROW_NUMBER() OVER(ORDER BY sp.scraped_regdate desc) AS RNUM,
b.post_no, sp.scraped_regdate,m.agename, b.title,b.LIKE_COUNT,b.VIEW_COUNT,m.nickname
from  scrap_post sp, member m, board b WHERE m.id='donguk' and m.id=sp.id and sp.post_no = b.post_no) b
where b.rnum between 1 and 8;

select b.rnum, b.post_no, b.scraped_regdate,b.agename, b.title,b.LIKE_COUNT,b.VIEW_COUNT,b.nickname,b.id,b.content
from (select ROW_NUMBER() OVER(ORDER BY sp.scraped_regdate desc) AS RNUM, m.id,
			b.post_no, sp.scraped_regdate,m.agename, b.title,b.LIKE_COUNT,b.VIEW_COUNT,m.nickname,b.content
					from  scrap_post sp, member m, board b WHERE m.id='donguk' and m.id=sp.id and sp.post_no = b.post_no) b 
			where b.rnum between 1 and 8
