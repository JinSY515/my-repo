create table users (
    id int auto_increment,
    userid varchar(10) NOT NULL,
    password varchar(20) NOT NULL,
    username varchar(15) NOT nULL,
    profile_img_link varchar(100) NOT NULL,
    profile_message varchar(100) NOT NULL,
    withdrawal tinyint(1) NOT NULL DEFAULT 0,
    join_date date NOT NULL,
    primary key(id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

create table channels (
    id int auto_increment,
    name varchar(20) NOT NULL,
    userid varchar(10) NOT NULL,
    link varchar(100) NOT NULL,
    capacity int NOT NULL,
    withdrawal tinyint(1) NOT NULL DEFAULT 0,
    join_date date NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(userid) REFERENCES users(id) ON DELETE CASCADE
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

create table chats (
    id int auto_increment,
    contents varchar(200) NOT NULL,
    writer int NOT NULL,
    channel int NOT NULL,
    chat_date date NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(writer) REFERENCES users(id) on DELETE CASCADE,
    FOREIGN KEY(channel) REFERENCES channels(id) ON DELETE CASCADE
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

create table follows (
    id int auto_increment,
    follower int NOT NULL,
    followee int NOT NULL,
    follow_date date NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(follower) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY(followee) REFERENCES users(id) ON DELETE CASCADE,
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

create table blocks (
    id int auto_increment,
    blocks int NOT NULL,
    blocked int NOT NULL,
    block_date date NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(blocks) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY(blocked) REFERENCES users(id) ON DELETE CASCADE
)ENGINE = InnoDB DEFAULT CHARSET = utf8;
