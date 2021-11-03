create table student (
    name varchar(20) NOT NULL,
    id int primary key auto_increment,
    year numeric(4,0) NOT NULL,
    major varchar(20) NOT NULL,
    phone char(11) NOT NULL,
    address varchar(50) NOT NULL,
    tot_cred int NOT NULL DEFAULT 0,
    gpa numeric(2,1) NOT NULL,
    attending tinyint(1) NOT NULL DEFAULT 1,
    FOREIGN KEY (id) references student_id(id);
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

create table student_id(
    id int primary key auto_increment,
    year numeric(4,0) NOT NULL,
    major numeric(2,0) NOT NULL,
    individual numeric(4,0) NOT NULL
)ENGINE = InnoDB DEFAULT CHARSET = utf8;