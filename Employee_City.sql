CREATE TABLE employee(
                         id BIGSERIAL NOT NULL PRIMARY KEY,
                         name VARCHAR NOT NULL,
                         last_name VARCHAR NOT NULL,
                         age INTEGER NOT NULL
);

INSERT INTO employee(name, last_name, age) VALUES ('Konstantin', 'Ivanov', 34);
INSERT INTO employee(name, last_name, age) VALUES ('Yuri', 'Ivanov', 38);
INSERT INTO employee(name, last_name, age) VALUES ('Dasha', 'Ivanova', 26);
INSERT INTO employee(name, last_name, age) VALUES ('Alex', 'Ivanov', 64);
INSERT INTO employee(name, last_name, age) VALUES ('Nadejda', 'Ivanova', 60);
INSERT INTO employee(name, last_name, age) VALUES ('Ivan', 'Petrov', 25);
INSERT INTO employee(name, last_name, age) VALUES ('Anna', 'Petrova', 22);
INSERT INTO employee(name, last_name, age) VALUES ('Nikolay', 'Petrov', 50);
INSERT INTO employee(name, last_name, age) VALUES ('Olga', 'Petrova', 49);
INSERT INTO employee(name, last_name, age) VALUES ('Semen', 'Petrov', 35);

CREATE TABLE city
(
    city_id BIGSERIAL NOT NULL PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL
);

ALTER TABLE employee ADD city_id INT REFERENCES city(city_id);

INSERT INTO city(city_name) VALUES ('UFA');
INSERT INTO city(city_name) VALUES ('Magnitogorsk');
INSERT INTO city(city_name) VALUES ('Novosibirsk');
INSERT INTO city(city_name) VALUES ('Yakutsk');
INSERT INTO city(city_name) VALUES ('Omsk');
INSERT INTO city(city_name) VALUES ('Kazan');

SELECT * FROM city;
SELECT * FROM employee;

UPDATE employee SET city_id=1 WHERE id=1;

SELECT name, city_name FROM employee LEFT JOIN city ON employee.city_id=city.city_id;