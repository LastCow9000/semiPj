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