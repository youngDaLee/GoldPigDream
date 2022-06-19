CREATE DATABASE lotto_db;

CREATE TABLE lotto_tb (
    round       INT             NOT NULL,
    lotto_no    VARCHAR(80)     NOT NULL,
    bonus_no    VARCHAR(10)     NOT NULL,
    1st_prize   INT             NOT NULL DEFAULT 0,
    2nd_prize   INT             NOT NULL DEFAULT 0,
    3rd_prize   INT             NOT NULL DEFAULT 0,
    4th_prize   INT             NOT NULL DEFAULT 0,
    5th_prize   INT             NOT NULL DEFAULT 0,
    PRIMARY KEY (round)
) ENGINE=INNODB;

CREATE TABLE total_game_tb (
    game_id     BINARY(16)      NOT NULL,
    user_id     BINARY(16)      NOT NULL,
    lotto_no    VARCHAR(80)     NOT NULL,
    total_prize BIGINT          NOT NULL,
    total_round INT             NOT NULL,
    reg_dtime   DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (game_id),
    INDEX ix_price (total_prize, reg_dtime),
    INDEX ix_cnt (total_round, reg_dtime)
) ENGINE=INNODB;

CREATE TABLE user_game_tb (
    game_id     BINARY(16)      NOT NULL,
    user_id     BINARY(16)      NOT NULL,
    round       INT             NOT NULL,
    lotto_rank  INT             NOT NULL,
    lotto_no    VARCHAR(80)     NOT NULL,
    prize       BIGINT          NOT NULL,
    reg_dtime   DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (game_id, round),
    INDEX ix_rank(lotto_rank, reg_dtime)
) ENGINE=INNODB;
