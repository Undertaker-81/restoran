DROP TABLE restorans_dish IF EXISTS;
DROP TABLE restorans_users IF EXISTS;
DROP TABLE VOTE IF EXISTS;
DROP TABLE MENU IF EXISTS;
DROP TABLE dish IF EXISTS;
DROP TABLE restorans IF EXISTS;
DROP TABLE users IF EXISTS;


DROP SEQUENCE global_seq IF EXISTS;

CREATE SEQUENCE GLOBAL_SEQ AS INTEGER START WITH 100000;

CREATE TABLE users
(
    id               INTEGER GENERATED BY DEFAULT AS SEQUENCE GLOBAL_SEQ PRIMARY KEY,
    name             VARCHAR(255)            NOT NULL,
    email            VARCHAR(255)            NOT NULL,
    password         VARCHAR(255)            NOT NULL,
    role              VARCHAR(255)            NOT NULL,
    registered       TIMESTAMP DEFAULT now() NOT NULL
);
CREATE UNIQUE INDEX users_unique_email_idx
    ON USERS (email);



CREATE TABLE dish
(
    id          INTEGER GENERATED BY DEFAULT AS SEQUENCE GLOBAL_SEQ PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    price       INTEGER NOT NULL

);

CREATE TABLE restorans
(
    id          INTEGER GENERATED BY DEFAULT AS SEQUENCE GLOBAL_SEQ PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    user_id     INTEGER      NOT NULL,
    FOREIGN KEY (user_id) REFERENCES USERS (id) ON DELETE CASCADE
);

CREATE TABLE restorans_dish
(
    dish_id         integer not null,
    restoran_id     integer not null,
    date            TIMESTAMP DEFAULT now() NOT NULL,
    CONSTRAINT FK_DISH_ID FOREIGN KEY (dish_id)
        REFERENCES dish (id),
    CONSTRAINT FK_RESTORAN_ID FOREIGN KEY (restoran_id)
        REFERENCES restorans (id)

);

CREATE TABLE restorans_users
(
    user_id         integer not null,
    restoran_id     integer not null,
    date            TIMESTAMP DEFAULT now() NOT NULL,
    CONSTRAINT FK_USER_ID FOREIGN KEY (user_id)
        REFERENCES users (id),
    CONSTRAINT FK_RESTORAN_ID_USER FOREIGN KEY (restoran_id)
        REFERENCES restorans (id)

);

CREATE TABLE VOTE
(
    id               INTEGER GENERATED BY DEFAULT AS SEQUENCE GLOBAL_SEQ PRIMARY KEY,
    user_id         integer not null,
    restoran_id     integer not null,
    date            TIMESTAMP DEFAULT now() NOT NULL
);

CREATE TABLE MENU
(
    id               INTEGER GENERATED BY DEFAULT AS SEQUENCE GLOBAL_SEQ PRIMARY KEY,
    dish_id         integer not null,
    restoran_id     integer not null,
    date            TIMESTAMP DEFAULT now() NOT NULL
);