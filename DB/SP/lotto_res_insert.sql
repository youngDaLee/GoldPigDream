CREATE PROCEDURE `lotto_res_insert` (
     IN i_round         INT             -- 로또 회차 정보(1회)
    ,IN i_lotto_no      VARCHAR(80)     -- 로또 당첨 번호(1,2,3,4,5,6)
    ,IN i_bonus_no      VARCHAR(10)     -- 로또 보너스 번호
    ,IN i_1st_prize     INT             -- 1등 상금
    ,IN i_2nd_prize     INT             -- 2등 상금
    ,IN i_3rd_prize     INT             -- 3등 상금
    ,IN i_4th_prize     INT             -- 4등 상금
    ,IN i_5th_prize     INT             -- 5등 상금
    ,OUT `o_out_code`   SMALLINT
)

BEGIN
/* ----------------------------------------------------------------------------
lotto_res_insert : 로또 결과(당첨 번호 및 상금) 인서트 용
author : dylee
RELEASE : 1.1.1
LAST UPDATE : 2022-06-19
---------------------------------------------------------------------------- */ 

    DECLARE EXIT HANDLER FOR SQLEXCEPTION, NOT FOUND, SQLWARNING
    BEGIN
        GET DIAGNOSTICS CONDITION 1 @v_sql_state = RETURNED_SQLSTATE
                , @v_error_no = MYSQL_ERRNO
                , @v_error_msg = MESSAGE_TEXT;
                SELECT @v_error_msg ; 
        ROLLBACK;
        SET o_out_code = -99;
    END;

    INSERT INTO lotto_db.lotto_tb(`round`, lotto_no, bonus_no, 1st_prize, 2nd_prize, 3rd_prize, 4th_prize, 5th_prize) 
    VALUES(i_round, i_lotto_no, i_bonus_no, i_1st_prize, i_2nd_prize, i_3rd_prize, i_4th_prize, i_5th_prize);

END