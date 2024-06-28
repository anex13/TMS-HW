CREATE DATABASE IF NOT EXISTS hw17p1;
USE hw17p1;
CREATE TABLE IF NOT EXISTS groups
    (
        gr_id INT NOT NULL AUTO_INCREMENT,
        gr_name VARCHAR(255) NOT NULL,
        gr_temp TINYINT SIGNED,
        CONSTRAINT gr_id_pk PRIMARY KEY (gr_id)
    );

CREATE TABLE IF NOT EXISTS analisys
    (
        an_id INT NOT NULL AUTO_INCREMENT,
        an_name  VARCHAR(255) NOT NULL,
        an_cost DECIMAL(10,2) UNSIGNED NOT NULL,
        an_price DECIMAL(10,2) UNSIGNED NOT NULL,
        an_group INT REFERENCES groups(gr_id),
        CONSTRAINT an_id_pk PRIMARY KEY (an_id)
    );
CREATE TABLE IF NOT EXISTS orders
    (
        ord_id INT NOT NULL AUTO_INCREMENT,
        ord_datetime  DATETIME,
        ord_an INT REFERENCES analisys(an_id),
        CONSTRAINT ord_id_pk PRIMARY KEY (ord_id)
    );

START TRANSACTION;
INSERT INTO groups (gr_name, gr_temp) VALUES ('Анализы на алергены', 10);
INSERT INTO groups (gr_name, gr_temp) VALUES ('Анализы крови', -2);
INSERT INTO groups (gr_name, gr_temp) VALUES ('Анализы на вирусные инфекции', 6);
INSERT INTO analisys (an_name, an_cost, an_price, an_group) VALUES ('Общий анализ крови', 35.40, 38.00, 2);
INSERT INTO analisys (an_name, an_cost, an_price, an_group) VALUES ('Анализ крови на сахар', 11.24, 12.00, 2);
INSERT INTO analisys (an_name, an_cost, an_price, an_group) VALUES ('Анализ крови на антитела SARS COV2', 55.22, 60.00, 3);
INSERT INTO analisys (an_name, an_cost, an_price, an_group) VALUES ('Анализ аллергии на пыль', 55.22, 60.00, 1);
INSERT INTO analisys (an_name, an_cost, an_price, an_group) VALUES ('Анализ аллергии на тупость', 55.22, 60.00, 1);
INSERT INTO analisys (an_name, an_cost, an_price, an_group) VALUES ('Анализ аллергии на пингвинов', 55.22, 60.00, 1);
INSERT INTO orders (ord_datetime, ord_an) VALUES ('2020-02-05 18:50:00', 5);
INSERT INTO orders (ord_datetime, ord_an) VALUES ('2020-02-21 18:50:00', 6);
INSERT INTO orders (ord_datetime, ord_an) VALUES ('2020-03-11 18:50:00', 2);
INSERT INTO orders (ord_datetime, ord_an) VALUES ('2020-02-05 18:50:00', 3);
INSERT INTO orders (ord_datetime, ord_an) VALUES ('2020-02-05 18:50:00', 4);
INSERT INTO orders (ord_datetime, ord_an) VALUES ('2020-02-05 18:50:00', 1);
COMMIT;

SELECT an_name, an_price FROM analisys a INNER JOIN orders o ON a.an_id = o.ord_an WHERE o.ord_datetime >= '2020-02-05' AND o.ord_datetime <= '2020-02-12'