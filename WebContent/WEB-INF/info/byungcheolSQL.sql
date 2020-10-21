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



select ROW_NUMBER() OVER(ORDER BY POST_NO desc) AS RNUM, m.id, m.nickname, b.title,b.regDate,b.content,  b.post_no, 
			 b.view_count, b.like_count, m.ageName,b.post_no 
	    from member m, board b where m.id = b.id and m.nickname in 
	    (select f.nickname from member m, follow f 
	         where m.id=f.id and m.id='donguk')
	    order by b.post_no desc;
select *
from member m, board b 
where m.id=b.id and 

select b.post_no

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