drop table NOTICE_BOARD cascade constraints;

CREATE TABLE NOTICE_BOARD
(
    NOTICE_BOARD_NUM       NUMBER,               -- 글 번호
    NOTICE_BOARD_FORM      NUMBER(3),            -- 전체, 공지사항, 이벤트, 정기점검
    -- NOTICE_BOARD_STATE		NUMBER(2),		-- 상단에 고정될 게시글 체크(보류)
    NOTICE_BOARD_NAME      VARCHAR2(30),         -- 작성자
    NOTICE_BOARD_SUBJECT   VARCHAR2(300),        -- 제목
    NOTICE_BOARD_CONTENT   VARCHAR2(4000),       -- 내용
    NOTICE_BOARD_ORIGINAL  VARCHAR2(50),         -- 첨부될 파일 명
    NOTICE_BOARD_FILE      VARCHAR2(50),         -- 첨부될 파일 명(가공)
    NOTICE_BOARD_READCOUNT NUMBER,               -- 글의 조회수
    NOTICE_BOARD_DATE      DATE default sysdate, -- 글의 작성 날짜

    PRIMARY KEY (NOTICE_BOARD_NUM)
);

INSERT INTO NOTICE_BOARD
(NOTICE_BOARD_NUM, NOTICE_BOARD_FORM, NOTICE_BOARD_NAME, NOTICE_BOARD_SUBJECT, NOTICE_BOARD_CONTENT)
VALUES (1, 1, 'admin', '공지사항', '공지사항 테스트');

SELECT *
FROM NOTICE_BOARD;