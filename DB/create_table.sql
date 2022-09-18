CREATE DATABASE lotto_db;

CREATE TABLE user_tb (
    user_id         VARCHAR(50)     NOT NULL    COMMENT '유저ID',
    email           VARCHAR(255)    NOT NULL    COMMENT '이메일',
    passwd          VARCHAR(255)    NOT NULL    COMMENT '비밀번호',
    nickname        VARCHAR(255)    NOT NULL DEFAULT '' COMMENT '닉네임',
    modify_dtime    DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수정일시',
    reg_dtime       DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일시',
    PRIMARY KEY (user_id)
) ENGINE=INNODB;

CREATE TABLE lotto_tb (
    round       INT             NOT NULL    COMMENT '회차',
    lotto_no    VARCHAR(80)     NOT NULL    COMMENT '로또번호',
    bonus_no    VARCHAR(10)     NOT NULL    COMMENT '보너스번호',
    1st_prize   INT             NOT NULL DEFAULT 0  COMMENT '1등상금',
    2nd_prize   INT             NOT NULL DEFAULT 0  COMMENT '2등상금',
    3rd_prize   INT             NOT NULL DEFAULT 0  COMMENT '3등상금',
    4th_prize   INT             NOT NULL DEFAULT 0  COMMENT '4등상금',
    5th_prize   INT             NOT NULL DEFAULT 0  COMMENT '5등상금',
    PRIMARY KEY (round)
) ENGINE=INNODB;

CREATE TABLE game_tb (
    game_id         INT             NOT NULL AUTO_INCREMENT COMMENT '게임ID',
    user_id         VARCHAR(50)     NOT NULL    COMMENT '유저ID',
    lotto_no        VARCHAR(80)     NOT NULL    COMMENT '로또번호',
    total_prize     BIGINT          NOT NULL    COMMENT '총상금',
    total_round     INT             NOT NULL    COMMENT '총우승회차',
    modify_dtime    DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수정일시',
    reg_dtime       DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일시',
    PRIMARY KEY (game_id),
    INDEX ix_price (total_prize, reg_dtime),
    INDEX ix_cnt (total_round, reg_dtime)
) ENGINE=INNODB;

CREATE TABLE game_detail_tb (
    game_id     INT             NOT NULL AUTO_INCREMENT COMMENT '게임ID',
    round       INT             NOT NULL    COMMENT '회차',
    user_id     VARCHAR(50)     NOT NULL    COMMENT '유저ID',
    lotto_rank  INT             NOT NULL    COMMENT '로또순위',
    lotto_no    VARCHAR(80)     NOT NULL    COMMENT '로또번호',
    prize       BIGINT          NOT NULL    COMMENT '상금',
    reg_dtime   DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일시',
    PRIMARY KEY (game_id, round),
    INDEX ix_rank(lotto_rank, reg_dtime)
) ENGINE=INNODB;
