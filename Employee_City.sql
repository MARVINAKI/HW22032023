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

-- Создайте таблицу city с колонками city_id и city_name.
CREATE TABLE city
(
    city_id BIGSERIAL NOT NULL PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL
);

-- Добавьте в таблицу employee колонку city_id.
-- Назначьте ее внешним ключом и свяжите с таблицей city.
ALTER TABLE employee ADD city_id INT REFERENCES city(city_id);

-- 2. Заполните таблицу city и назначьте работникам соответствующие города.
INSERT INTO city(city_name) VALUES ('UFA');
INSERT INTO city(city_name) VALUES ('Magnitogorsk');
INSERT INTO city(city_name) VALUES ('Novosibirsk');
INSERT INTO city(city_name) VALUES ('Yakutsk');
INSERT INTO city(city_name) VALUES ('Omsk');
INSERT INTO city(city_name) VALUES ('Kazan');

UPDATE employee SET city_id=1 WHERE id=1;
UPDATE employee SET city_id=1 WHERE id=2;
UPDATE employee SET city_id=1 WHERE id=3;
UPDATE employee SET city_id=1 WHERE id=4;
UPDATE employee SET city_id=1 WHERE id=5;
UPDATE employee SET city_id=3 WHERE id=6;
UPDATE employee SET city_id=4 WHERE id=7;
UPDATE employee SET city_id=5 WHERE id=8;
UPDATE employee SET city_id=3 WHERE id=9;
UPDATE employee SET city_id=5 WHERE id=10;

-- Тестовые операции
-- ......................................................
SELECT id FROM employee LEFT JOIN city ON city.city_id=employee.city_id WHERE employee.city_id IS NULL;
SELECT city.city_id, city.city_name FROM city LEFT JOIN employee ON city.city_id=employee.city_id WHERE city.city_id NOT IN (SELECT employee.city_id FROM employee);
SELECT * FROM city;
SELECT * FROM employee;
-- ......................................................

-- Получите имена и фамилии сотрудников, а также города, в которых они проживают.
SELECT name, last_name, city_name FROM employee INNER JOIN city ON employee.city_id=city.city_id;

-- Получите города, а также имена и фамилии сотрудников, которые в них проживают.
-- Если в городе никто из сотрудников не живет, то вместо имени должен стоять null.
SELECT city_name, name, last_name FROM city LEFT OUTER JOIN employee ON employee.city_id=city.city_id;

-- Получите имена всех сотрудников и названия всех городов.
-- Если в городе не живет никто из сотрудников, то вместо имени должен стоять null.
-- Аналогично, если города для какого-то из сотрудников нет в списке, так же должен быть получен null.
UPDATE employee SET city_id=null WHERE id=1;
SELECT name, last_name, city_name FROM employee FULL OUTER JOIN city ON employee.city_id=city.city_id;

-- Получите таблицу, в которой каждому имени должен соответствовать каждый город.
SELECT name, city_name FROM employee CROSS JOIN city;