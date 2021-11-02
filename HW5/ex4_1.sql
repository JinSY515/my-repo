create table student (
    name varchar(20) NOT NULL,
    id char(20) NOT NULL,
    year numeric(4,0) NOT NULL,
    major varchar(20) NOT NULL,
    phone char(11) NOT NULL,
    address varchar(50) NOT NULL,
    tot_cred int NOT NULL DEFAULT 0,
    gpa numeric(2,1) NOT NULL,
    attending tinyint(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;