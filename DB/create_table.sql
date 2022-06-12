CREATE DATABASE lotto_db;

CREATE TABLE total_game_tb (
    game_id     BINARY(16)  NOT NULL,
    user_id     BINARY(16)  NOT NULL,
    lotto_no    VARCHAR()   NOT NULL,
    total_price BIGINT      NOT NULL,
    total_cnt   INT         NOT NULL,
    reg_dtime   DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (game_id),
    INDEX ix_price (total_price, reg_dtime),
    INDEX ix_cnt (total_cnt, reg_dtime),
) ENGINE=INNNODB;


CREATE TABLE user_game_tb (
    game_id     BINARY(16)  NOT NULL,
    user_id     BINARY(16)  NOT NULL,
    round       INT         NOT NULL,
    lotto_rank  INT         NOT NULL,
    lotto_no    VARCHAR()   NOT NULL,
    price       BIGINT      NOT NULL,
    reg_dtime   DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (game_id, round),
    INDEX ix_rank(lotto_rank, reg_dtime),
) ENGINE=INNNODB;

