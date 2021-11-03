create table users (
    userid varchar(10) primary key NOT NULL,
    password varchar(20) NOT NULL,
    username varchar(15) NOT nULL,
    profile_img_link varchar(100) NOT NULL,
    profile_message varchar(100) NOT NULL,
    withdrawal tinyint(1) NOT NULL DEFAULT 0,
    join_date date NOT NULL,
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

create table channels (
    name varchar(20) NOT NULL,
    userid varchar(10) primary key NOT NULL,
    link varchar(100) NOT NULL,
    capacity int NOT NULL,
    withdrawal tinyint(1) NOT NULL DEFAULT 0,
    join_date date NOT NULL,
    FOREIGN KEY(userid) REFERENCES users(userid) ON DELETE CASCADE
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

create table chats (
    contents varchar(200) NOT NULL,
    writer varchar(10) primary key NOT NULL,
    channel varchar(100) NOT NULL,
    chat_date date NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(writer) REFERENCES users(userid) on DELETE CASCADE,
    FOREIGN KEY(channel) REFERENCES channels(link) ON DELETE CASCADE
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

create table follows (
    follower varchar(10) primary key NOT NULL,
    followee varchar(10) NOT NULL,
    follow_date date NOT NULL,
    FOREIGN KEY(follower) REFERENCES users(userid) ON DELETE CASCADE,
    FOREIGN KEY(followee) REFERENCES users(userid) ON DELETE CASCADE,
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

create table blocks (
    blocks varchar(10) primary key NOT NULL,
    blocked varchar(10) NOT NULL,
    block_date date NOT NULL,
    FOREIGN KEY(blocks) REFERENCES users(userid) ON DELETE CASCADE,
    FOREIGN KEY(blocked) REFERENCES users(userid) ON DELETE CASCADE
)ENGINE = InnoDB DEFAULT CHARSET = utf8;
