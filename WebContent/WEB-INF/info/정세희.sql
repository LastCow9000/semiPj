SELECT B.POST_NO ,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE
FROM BOARD B, MEMBER M
WHERE B.ID=M.ID and m.agename='조선시대' and m.nickname like '%이%'  

--post no 번호 짤리지 않게 하는 ..다시 rnum 부여하는것
SELECT  B.RNUM , B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,AGEDATE
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY POST_NO ASC) AS RNUM ,B.POST_NO,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE
	SELECT ROW_NUMBER() OVER(ORDER BY POST_NO asc) AS RNUM ,B.POST_NO,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE
	FROM BOARD B, MEMBER M
	WHERE B.ID=M.ID  AND M.AGENAME='조선시대'
	WHERE B.ID=M.ID and agename='조선시대' and m.nickname like '%과%'
) B , MEMBER M
WHERE B.NICKNAME=M.NICKNAME order by rnum desc ;
  SELECT * from board
   
WHERE B.NICKNAME=M.NICKNAME order by rnum desc

SELECT COUNT(*)FROM BOARD B,MEMBER M WHERE M.ID=B.ID AND M.AGENAME='고조선시대'



select m.id, m.nickname, b.title,b.regDate,b.content,b.view_count, b.like_count
from member m, board b where m.id = b.id and b.post_no=3 

update board set view_count=view_count+1 where post_no=3






insert into board values(board_seq.nextval,'donguk','페이징페이징','64','내용11','40',sysdate);
insert into board values(board_seq.nextval,'donguk','페이징페이징','64','내용11','40',sysdate);
insert into board values(board_seq.nextval,'donguk','페이징페이징','64','내용11','40',sysdate);
insert into board values(board_seq.nextval,'donguk','페이징페이징','64','내용11','40',sysdate);
insert into board values(board_seq.nextval,'donguk','페이징페이징','64','내용11','40',sysdate);
insert into board values(board_seq.nextval,'donguk','페이징페이징','64','내용11','40',sysdate);
insert into board values(board_seq.nextval,'donguk','페이징페이징','64','내용11','40',sysdate);
insert into board values(board_seq.nextval,'donguk','페이징페이징','64','내용11','40',sysdate);

select *
from   board;

select *
from   member;


SELECT B.RNUM ,B.POST_NO, B.TITLE,M.NICKNAME,
B.LIKE_COUNT,B.VIEW_COUNT,AGEDATE 
FROM (
SELECT ROW_NUMBER() OVER(ORDER BY POST_NO asc)
AS RNUM ,b.post_no,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,
TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE 
FROM BOARD B, MEMBER M 
WHERE B.ID=M.ID AND M.AGENAME='조선시대' 
) B , MEMBER M 
WHERE B.NICKNAME=M.NICKNAME 
and m.nickname like '%과%' and rnum between 16 and 23  order by rnum desc

-- 추가 sql
create table follow(
   id varchar2(100),
   nickname varchar2(100),
   constraint fk_follow primary key(id,nickname)
)
alter table scrap_post add(regdate date default sysdate);
alter table scrap_post RENAME COLUMN regdate to scraped_regdate

