CREATE DATABASE IF NOT EXISTS hw17p2;
USE hw17p2;
CREATE TABLE IF NOT EXISTS courses
    (
        c_id INT NOT NULL AUTO_INCREMENT,
        c_name VARCHAR(255) NOT NULL,
        c_duration TINYINT SIGNED,
        CONSTRAINT c_id_pk PRIMARY KEY (c_id)
    );

CREATE TABLE IF NOT EXISTS students
    (
        s_id INT NOT NULL AUTO_INCREMENT,
        s_fio  VARCHAR(255) NOT NULL,
        s_group INT UNSIGNED NOT NULL,
        s_course INT REFERENCES courses(c_id),
        CONSTRAINT s_id_pk PRIMARY KEY (s_id)
    );
START TRANSACTION;
INSERT INTO courses (c_name, c_duration) VALUES 
('Прикладая магия',53),
('Занимательный экзарцизм',53),
('Велосепедостроение',53),
('Жонглирование костылями',53);

INSERT INTO students (s_fio, s_group, s_course) VALUES
('Иванов Иван Иваныч', 5532, 1),
('Иванов Алексей Палыч', 5542, 2),
('Петров Иван Иваныч', 5532, 3),
('Сидоров Дмитрий Иваныч', 5552, NULL),
('Школоло Иван Трололоевич', 5532, 4),
('Школоло Павел Трололоевич', 5532, 1);
COMMIT;

SELECT s.s_fio, c.c_name FROM students s LEFT JOIN courses c ON s.s_course = c.c_id;