DROP TABLE IF EXISTS account CASCADE;
DROP TABLE IF EXISTS send_invite CASCADE;
DROP TABLE IF EXISTS post CASCADE;
DROP TABLE IF EXISTS messages CASCADE;
DROP TABLE IF EXISTS react_post CASCADE;

CREATE TABLE account (
    firstName varchar(80),
    last_name varchar(80),
    nickname varchar(50) DEFAULT NULL,
    birthday date,
    gender char,
    email varchar(100),
    profile_pic varchar(250) DEFAULT NULL,
    id_account integer PRIMARY KEY
);

CREATE TABLE send_invite (
    id_account_sender integer REFERENCES account(id_account),
    id_account_receiver integer REFERENCES account(id_account),
    is_accepted boolean,
    friendship_birthday date,
    PRIMARY KEY (id_account_sender, id_account_receiver)
    
);

CREATE TABLE messages (
    id_account_receiver integer REFERENCES account(id_account),
    id_account_sender integer REFERENCES account(id_account),
    message_datetime timestamp,
    message_content text,
    seen_datetime timestamp,
    PRIMARY KEY (id_account_sender, id_account_receiver)
);

CREATE TABLE post (
    posting_date date,
    posting_time time,
    post_content text,
    id_post integer REFERENCES post(id_post),
    id_account integer REFERENCES account(id_account),
    PRIMARY KEY (id_post)

);

CREATE TABLE react_post (
    id_account integer REFERENCES account(id_account),
    id_post integer REFERENCES post(id_post),
    reaction_type varchar(20),
    reaction_time timestamp,
    PRIMARY KEY (id_account, id_post)

);
/* les comptes*/
INSERT INTO account(firstName last_name, birthday, gender, email, id_account) 
VALUES('Iandry', 'Rakoto', '2020-10-20', 'F', 'lovasoa@gmail.com', 1);
INSERT INTO account(firstName, last_name, birthday, gender, email, id_account)
VALUES('Manja', 'Rakoto', '2020-11-20', 'F', 'mnjx@gmail.com', 2);
INSERT INTO account(firstName, last_name, birthday, gender, email, id_account)
VALUES('Bra', 'Randria', '2020-11-20', 'M', 'brx@gmail.com', 3);
INSERT INTO account(firstName, last_name, birthday, gender, email, id_account)
VALUES('Mista', 'Lova', '2020-11-20', 'M', 'lova@gmail.com', 4);
INSERT INTO account(firstName, last_name, birthday, gender, email, id_account)
VALUES('Afi', 'Ndra', '2020-11-20', 'F', 'afi@gmail.com', 5);

/*amis*/
INSERT INTO send_invite VALUES(1, 2, 'true', '2020-12-01');
INSERT INTO send_invite VALUES(1, 3, 'false', '2020-12-01');
INSERT INTO send_invite VALUES(1, 4, 'true', '2020-12-01');
INSERT INTO send_invite VALUES(1, 5, 'true', '2020-12-01');

/*messages*/
INSERT INTO messages(id_account_sender, id_account_receiver, message_datetime, message_content) 
VALUES(1, 2, '2022-02-10 08:10:00', 'Salut');
INSERT INTO messages(id_account_sender, id_account_receiver, message_datetime, message_content) 
VALUES(2, 1, '2022-02-10 08:10:01', 'Salut');
INSERT INTO messages(id_account_sender, id_account_receiver, message_datetime, message_content) 
VALUES(1, 3, '2022-02-10 08:10:02', 'Yo');
INSERT INTO messages(id_account_sender, id_account_receiver, message_datetime, message_content) 
VALUES(3, 1, '2022-02-10 08:10:03', 'Bien ou quoi?');

INSERT  INTO post VALUES('2021-12-01', '19:00:00', 'juibg', 1, 1);
INSERT INTO react_post VALUES (2, 1, 'positive', '2021-12-01 19:05:00')
