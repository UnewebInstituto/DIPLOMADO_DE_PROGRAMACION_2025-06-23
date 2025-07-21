-- Hay dos modalidades de comandos en postgresql
-- 1ra. Modalidad: Comandos psql 

-- 2da. Modalidad: Comandos SQL

create database bd_henry_20250721;

-- Resultado del comando
postgres=# create database bd_henry_20250721;
CREATE DATABASE
postgres=#
--

-- Listado de todas las bases de datos
\l

-- Listado de las bases de datos que terminan en 20250721
\l *20250721;

-- Equivalente al comando anterior en sql para postgresql 
SELECT datname 
FROM pg_database 
WHERE datname LIKE '%20250721';

-- Listado de las bases de datos que terminan en 20250721 y que son del usuario postgres
postgres=# SELECT datname 
postgres-# FROM pg_database
postgres-# WHERE datname LIKE '%20250721';
        datname
-----------------------
 bd_henry_20250721
 bd_reinaldo_20250721
 bd_alejandro_20250721
(3 rows)


postgres=# 
-------------------------------------------

-- Conexión a la base de datos 

\c bd_henry_20250721;

-- Cómo consultar las tablas contenidad en la base de datos
\dt  -- display table

-- Cómo consultar las tablas contenidad en la base de datos con SQL
SELECT table_name

-- Creación de una tabla con clave primaria y claves únicas
create table contactos (
    id serial,
    nombre varchar(80),
    apellido varchar(80),
    fecha_nacimiento date,
    direccion text,
    telefono varchar(30),
    correo_electronico varchar(80),
    primary key (id),
    unique (correo_electronico)
);

-- Otra forma
create table contactos (
    id serial primary key,
    nombre varchar(80),
    apellido varchar(80),
    fecha_nacimiento date,
    direccion text,
    telefono varchar(30),
    correo_electronico varchar(80) unique
);

-- Ver todas las tablas contenidas en la base de datos
\dt

-- Consultar Estructura de la tabla
\d contactos

-- Resultados ---
bd_henry_20250721=# \d contactos 
                                         Table "public.contactos"
       Column       |         Type          | Collation | Nullable |                Default
--------------------+-----------------------+-----------+----------+---------------------------------------
 id                 | integer               |           | not null | nextval('contactos_id_seq'::regclass)
 nombre             | character varying(80) |           |          |
 apellido           | character varying(80) |           |          |
 fecha_nacimiento   | date                  |           |          |
 direccion          | text                  |           |          |
 telefono           | character varying(30) |           |          |
 correo_electronico | character varying(80) |           |          |
Indexes:
    "contactos_pkey" PRIMARY KEY, btree (id)
    "contactos_correo_electronico_key" UNIQUE CONSTRAINT, btree (correo_electronico)


bd_henry_20250721=# \d
                List of relations
 Schema |       Name       |   Type   |  Owner
--------+------------------+----------+----------
 public | contactos        | table    | postgres
 public | contactos_id_seq | sequence | postgres
(2 rows)


bd_henry_20250721=# \d contactos_id_seq;
                  Sequence "public.contactos_id_seq"
  Type   | Start | Minimum |  Maximum   | Increment | Cycles? | Cache
---------+-------+---------+------------+-----------+---------+-------
 integer |     1 |       1 | 2147483647 |         1 | no      |     1
Owned by: public.contactos.id


bd_henry_20250721=# \d contactos_id_seq 
                  Sequence "public.contactos_id_seq"
  Type   | Start | Minimum |  Maximum   | Increment | Cycles? | Cache
---------+-------+---------+------------+-----------+---------+-------
 integer |     1 |       1 | 2147483647 |         1 | no      |     1
Owned by: public.contactos.id


bd_henry_20250721=# s

--            ---
-- Otra forma de crear la tabla contactos1 con clave primaria y autoincremento

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

-- Consultar las tablas contenidas en la base de datos
-- equivalente a \dt
SELECT table_name
FROM information_schema.tables 
WHERE table_schema = 'public';

-- Resultados ---
bd_henry_20250721=# SELECT table_name
bd_henry_20250721-# FROM information_schema.tables 
bd_henry_20250721-# WHERE table_schema = 'public'; 
 table_name
------------
 contactos
 contactos1
(2 rows)
-------------

-- Carga de datos a través de la sentencia insert

insert into contactos(nombre, apellido, fecha_nacimiento, direccion, telefono, correo_electronico) values 
('ANA'    ,'VASQUEZ'  ,'1960-08-15','SANTA FE'    ,'0414-1234567','av@gmail.com'),
('PEDRO'  ,'ALMODOVAR','1950-09-01','CARICUAO'    ,'0424-9876543','pa@gmail.com'),
('SARA'   ,'SUAREZ'   ,'1990-06-20','CHACAITO'    ,'0212-6782345','ss@hotmail.com'),
('YOLANDA','TORTOZA'  ,'1978-10-15','CATIA LA MAR','0412-9996543','yt@gmail.com');
-- Resultados ---
bd_henry_20250721=# insert into contactos(nombre, apellido, fecha_nacimiento, direccion, telefono, correo_electronico) values
bd_henry_20250721-# ('ANA'    ,'VASQUEZ'  ,'1960-08-15','SANTA FE'    ,'0414-1234567','av@gmail.com'),
bd_henry_20250721-# ('PEDRO'  ,'ALMODOVAR','1950-09-01','CARICUAO'    ,'0424-9876543','pa@gmail.com'),
bd_henry_20250721-# ('SARA'   ,'SUAREZ'   ,'1990-06-20','CHACAITO'    ,'0212-6782345','ss@hotmail.com'),
bd_henry_20250721-# ('YOLANDA','TORTOZA'  ,'1978-10-15','CATIA LA MAR','0412-9996543','yt@gmail.com');
INSERT 0 4
bd_henry_20250721=#
--- 

bd_henry_20250721=# select * from contactos;
 id | nombre  | apellido  | fecha_nacimiento |  direccion   |   telefono   | correo_electronico
----+---------+-----------+------------------+--------------+--------------+--------------------
  1 | ANA     | VASQUEZ   | 1960-08-15       | SANTA FE     | 0414-1234567 | av@gmail.com
  2 | PEDRO   | ALMODOVAR | 1950-09-01       | CARICUAO     | 0424-9876543 | pa@gmail.com
  3 | SARA    | SUAREZ    | 1990-06-20       | CHACAITO     | 0212-6782345 | ss@hotmail.com
  4 | YOLANDA | TORTOZA   | 1978-10-15       | CATIA LA MAR | 0412-9996543 | yt@gmail.com
(4 rows)