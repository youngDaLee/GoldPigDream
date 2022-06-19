CREATE PROCEDURE `lotto_res_insert` (
    i_round     INT,
    i_lotto_no    VARCHAR(80),
    i_bonus_no    VARCHAR(10),
    i_1st_prize   INT,
    i_2nd_prize   INT,
    i_3rd_prize   INT,
    i_4th_prize   INT,
    i_5th_prize   INT,
)

BEGIN
    USE lotto_db;

    INSERT INTO lotto_db.lotto_tb(`round`, lotto_no, bonus_no, 1st_prize, 2nd_prize, 3rd_prize, 4th_prize, 5th_prize) 
    VALUES(i_round, i_lotto_no, i_bonus_no, i_1st_prize, i_2nd_prize, i_3rd_prize, i_4th_prize, i_5th_prize);

END