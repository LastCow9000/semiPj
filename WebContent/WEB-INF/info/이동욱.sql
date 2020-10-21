SELECT B.RNUM ,B.POST_NO, B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,AGEDATE 
FROM (
SELECT ROW_NUMBER() OVER(ORDER BY POST_NO asc) AS RNUM ,b.post_no,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE 
FROM BOARD B, MEMBER M M.AGENAME='조선시대' 
WHERE B.ID=M.ID and m.nickname like '%이%' 
) B , MEMBER M 
WHERE B.NICKNAME=M.NICKNAME order by rnum desc

SELECT count(*)
FROM (
SELECT ROW_NUMBER() OVER(ORDER BY POST_NO asc) AS RNUM ,b.post_no,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE 
FROM BOARD B, MEMBER M 
WHERE B.ID=M.ID  AND M.AGENAME='조선시대'
) B , MEMBER M 
WHERE B.NICKNAME=M.NICKNAME and m.nickname like '%이%' 

-- 시대별 검색 컬럼별로 나오는거
SELECT  B.RNUM ,B.POST_NO, B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,AGEDATE
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY POST_NO asc) AS RNUM ,B.POST_NO,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE
	FROM BOARD B, MEMBER M
	WHERE B.ID=M.ID and agename='조선시대' and m.nickname like '%과%'
) B , MEMBER M
WHERE B.NICKNAME=M.NICKNAME order by rnum desc


CREATE TABLE like_post (
    post_no number,
    id varchar2(100),
    CONSTRAINT pk_like PRIMARY KEY (POST_NO,ID)
);
select * from LIKE_POST;
delete from LIKE_POST  where id='donguk' and post_no='66'
INSERT INTO like_post VALUES('67', 'donguk');
INSERT INTO like_post VALUES(66, 'donguk');
select count(*) from like_post where id='donguk' and post_no='67'

select * from BOARD where post_no=67
select * from LIKE_POST where post_no=66
select * from member where id='donguk'
update board set like_count = like_count-1  where post_no=67;
update member set point = point+10  where id='donguk';

-- 추가 sql
create table follow(
   id varchar2(100),
   nickname varchar2(100),
   constraint fk_follow primary key(id,nickname)
)
alter table scrap_post add(regdate date default sysdate);
alter table scrap_post RENAME COLUMN regdate to scraped_regdate

INSERT INTO member(id, nickname, password, ageName) VALUES('adminmts', '관리자', 'donguking', '모든시대');

-- 닉네임으로 시대를 불러오는 sql
select ageName from MEMBER where nickname ='욱과짱'

-- 공지사항 테이블
CREATE SEQUENCE notice_board_seq nocache;

CREATE TABLE notice_board(
   post_no number primary key,
   id varchar2(100) not null,
   title varchar2(100) not null,
   view_count number default 0,
   content clob not null,
   regdate date not null,
   constraint fk_notice_boardid foreign key(id) references member(id) on delete cascade
)
alter table notice_board add(like_count number default 0);

<<<<<<< HEAD
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'adminmts','1','안녕하세요',sysdate);
=======
insert into notice_board(post_no,id,title,content,regdate) values(notice_board_seq.nextval,'donguk','1','안녕하세요',sysdate);
>>>>>>> branch 'master' of https://github.com/LastCow9000/semiPj.git

select b.post_no,B.TITLE,M.NICKNAME,b.like_count,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE 
from notice_board b , member m
where b.id=m.id order by post_no desc 

select * from notice_board
DROP SEQUENCE notice_board_seq;

SELECT  B.RNUM ,B.POST_NO, B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,AGEDATE
FROM (
SELECT ROW_NUMBER() OVER(ORDER BY POST_NO desc) AS RNUM ,b.post_no,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE 
FROM notice_board B, MEMBER M 
WHERE B.ID=M.ID
) B , MEMBER M 
WHERE B.NICKNAME=M.NICKNAME  

select count(*) from notice_board


SELECT  B.RNUM ,B.POST_NO, B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,AGEDATE
				FROM (
						SELECT ROW_NUMBER() OVER(ORDER BY POST_NO desc) AS RNUM ,b.post_no,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE
				FROM notice_board B, MEMBER M 
				WHERE B.ID=M.ID 
				) B , MEMBER M 
				WHERE B.NICKNAME=M.NICKNAME and rnum between 17 and 32




