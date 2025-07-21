-- hay dos modalidades de comandos en postgresql

--1ra. modalidad: comandos PSQL

-- 2da. modalidad: comandos SQL

create database bd_reinaldo_20250721;

--RESULTADO DEL COMANDO:

--postgres=# create database bd_reinaldo_20250721;
--CREATE DATABASE

-- LISTADO DE TODAS LAS BASES DE DATOS

\l

-- LISTADO DE LAS BASES DE DATOS QUE TERMINAN EN 20250721
\l *20250721;

-- EQUIVALENTE AL COMANDO ANTERIOR EN SQL PARA POSTGRESQL

select datname from pg_database where datname like '%20250721';

--- CONEXION A LA BASE DE DATO

\c bd_reinaldo_20250721;

-- COMO CONSULTAR LAS TABLAS CONTENIDAD EN LA BASE DE DATOS

\dt -- DISPLAT TABLE

-- COMO CONSULTAR LAS TABLAS CONTENIDAS EN LA BASE DE DATO CON SQL

select table_name

-- CREACION DE UNA TABLA CON CLAVE PRIMARIA Y CLAVES UNICAS 

create table contactos(
    id serial,
    nombre varchar(80),
    apellido varchar(80),
    fecha_nacimiento date,
    direccion text,
    telefono varchar(80),
    correo_electronico varchar(80),
    primary key(id),
    unique(correo_electronico)
);

-- OTRA FORMA

create table contactos(
    id serial primary key,
    nombre varchar(80),
    apellido varchar(80),
    fecha_nacimiento date,
    direccion text,
    telefono varchar(80),
    correo_electronico varchar(80) unique
);

-- VER TODAS LAS TABLAS CONTENIDAS EN LABASE DE DATOS
\dt 

-- CONSULTAR ESTRUCTURA DE LA TABLA

\d contactos 

-- OTRA FORMA DE CREAR LA TABLA CONTACTOS1 CON CLAVE PRIMARIA Y AUTO_INCREMENT

create sequence contactos1_id_seq;

create table contactos1(
    id integer default nextval('contactos1_id_seq'::regclass) primary key,
    nombre varchar(80),
    apellido varchar(80),
    fecha_nacimiento date,
    direccion text,
    telefono varchar(80),
    correo_electronico varchar(80) unique
);

-- CONSULTA LAS TABLAS CONTENIDAS EN LA BASE DE DATOS
-- EQUIVALENTE A \dt
select table_name
from information_schema.tables
where table_schema = 'public';

-- CARGAR DE DATOS ATRAVES DE LA SETENCIA INSERT

insert into contactos(nombre,apellido,fecha_nacimiento,direccion,telefono,correo_electronico)
values
('ANA','VASQUEZ','1960-08-15','SANTA FE','04123465134','av@gmail.com'),
('PEDRO','ALMODOVAR','1950-09-01','CARICUAO','0412346758739','pa@gmail.com'),
('SARA','SUAREZ','1990-06-20','CHACAITO','04267866559','ss@hotmail.com'),
('YOLANDA','TORTOZA','1978-10-15','CATIA LA MAR','041454773639','yt@gmail.com');

--PARA SALIR DE LA CONSOLA EL SIGUIENTE COMANDO ES:

\Q