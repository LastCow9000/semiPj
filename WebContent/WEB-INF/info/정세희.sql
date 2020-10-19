SELECT B.POST_NO ,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE
FROM BOARD B, MEMBER M
WHERE B.ID=M.ID and m.agename='조선시대' and m.nickname like '%이%'  

--post no 번호 짤리지 않게 하는 ..다시 rnum 부여하는것
SELECT  B.RNUM , B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,AGEDATE
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY POST_NO asc) AS RNUM ,B.POST_NO,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE
	FROM BOARD B, MEMBER M
	WHERE B.ID=M.ID and agename='조선시대' and m.nickname like '%과%'
) B , MEMBER M
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






