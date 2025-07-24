-- Hay dos modalidades de comandos en postgresql
-- 1ra. Modalidad: Comandos psql 

-- 2da. Modalidad: Comandos SQL

create database bd_alejandro_20250721;

-- Resultado del comando
postgres=# create database bd_alejandro_20250721;
CREATE DATABASE
postgres=#
--

-- Listado de todas las bases de datos
\l

-- Listado de las bases de datos que terminan en 20250721
\l *20250721;


SELECT datname 
FROM pg_database 
WHERE datname LIKE '%20250721';


--conexion a la base datos--

\c bd_alejandro_20250721;


--como ver tablas contenidas en la base datos
\dt--display table

SELECT table_name

--creacion de una tabla con clave primaria y id

create table contactos (
id serial,
nombre varchar(80),
apellido varchar(80),
fecha_nacimiento date,
direccion text,
correo_electronico varchar(80),
primary key(id),
unique (correo_electronico)
);

--otra forma

--ver todas las tablas contenidas en la bd
\dt

-- consultar estructura de la tabla 
\d contactos



-- otra forma de crear la tbla contactos 1 y autoincremento --
 create sequence contactos1_id_seq;
 
create table contactos1(
    id integer default nextval('contactos1_id_seq'::regclass) primary key,
    nombre varchar(80),
    apellido varchar(80),
    fecha_nacimiento date,
    direccion text,
    telefono varchar(30),
    correo_electronico varchar(80) unique

);
--consulta las tablas contenidas en la base de datos
-- equivalente a \dt

SELECT table_name
FROM information_schema.tables 
WHERE table_schema = 'public';


--carga de datos atraves de la sentencia insert


insert into contactos(nombre, apellido, fecha_nacimiento, direccion, telefono, correo_electronico) values 
('ANA'    ,'VASQUEZ'  ,'1960-08-15','SANTA FE'    ,'0414-1234567','av@gmail.com'),
('PEDRO'  ,'ALMODOVAR','1950-09-01','CARICUAO'    ,'0424-9876543','pa@gmail.com'),
('SARA'   ,'SUAREZ'   ,'1990-06-20','CHACAITO'    ,'0212-6782345','ss@hotmail.com'),
('YOLANDA','TORTOZA'  ,'1978-10-15','CATIA LA MAR','0412-9996543','yt@gmail.com');

