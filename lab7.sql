CREATE DATABASE lab6; --1
CREATE TABLE locations(
location_id SERIAL PRIMARY KEY,
street_address VARCHAR(25),
postal_code VARCHAR(12),
city VARCHAR(30),
state_province VARCHAR(12)
);
CREATE TABLE departments(
department_id SERIAL PRIMARY KEY,
department_name VARCHAR(50) UNIQUE,
budget INTEGER,
location_id INTEGER REFERENCES locations
);
CREATE TABLE employees(
employee_id SERIAL PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(50),
phone_number VARCHAR(20),
salary INTEGER,
department_id INTEGER REFERENCES departments
) --2
SELECT first_name, last_name, d.department_id, department_name from departments as d inner join employees as e on d.department_id= e.department_id; --3
SELECT first_name, last_name, d.department_id, d.department_name, from departments as d INNER JOIN employees as e on d.department_id= e.department_id in (80,40); --4
SELECT first_name, last_name, d.location_id, state_province from departments as d inner join employees e on d.department_id=e.department_id inner join locations l on d.location_id = l.location_id; --5
SELECT first_name, last_name, d.department_id, d.department_name from employees as e right join departments as d on e.department_id= d.department_id; --6
SELECT first_name, last_name, d.department_id, d.department_name from employees as e left join departments as d on e.department_id= d.department_id; --7