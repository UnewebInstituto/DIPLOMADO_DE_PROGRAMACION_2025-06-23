-- CREACIÓN DE BASES DE DATOS

create database bd_henry_20250714;

--MariaDB [(none)]> create database --bd_henry_20250714;
--Query OK, 1 row affected (0.001 sec)

--MariaDB [(none)]>

-- CONSULTA DE BASES DE DATOS 
-- EMPLEANDO PARTE DEL NOMBRE

show databases like '%20250714%';

--MariaDB [(none)]> show databases like '%20250714%';
--+-----------------------+
--| Database (%20250714%) |
--+-----------------------+
--| bd_alejandro_20250714 |
--| bd_henry_20250714     |
--| bd_reinaldo_20250714  |
--+-----------------------+
--3 rows in set (0.003 sec)

--MariaDB [(none)]>


-- CONEXIÓN A BASE DE DATOS
use bd_henry_20250714;

-- MariaDB [(none)]> use bd_henry_20250714;
-- Database changed
-- MariaDB [bd_henry_20250714]>

-- CREACIÓN DE UNA TABLAS
-- SE ACONSEJA QUE EL NOMBRE SEA EN PLURAL
create table personas(
    doc char(1), 
    cedula integer,
    nombre varchar(80),
    apellido varchar(80),
    direccion text,
    correo_electronico varchar(80),
    fecha_nacimiento date);

--MariaDB [(none)]> use bd_henry_20250714;
--Database changed
--MariaDB [bd_henry_20250714]> create table personas(
--    ->     doc char(1),
--    ->     cedula integer,
--    ->     nombre varchar(80),
--    ->     apellido varchar(80),
--    ->     direccion text,
--    ->     correo_electronico varchar(80),
--    ->     fecha_nacimiento date);
--Query OK, 0 rows affected (0.013 sec)

--MariaDB [bd_henry_20250714]>

-- VISUALIZAR LA ESTRUCTURA DE UNA TABLA
describe personas;

--MariaDB [bd_henry_20250714]> describe personas;
--+--------------------+-------------+------+-----+-----------+-------+
--| Field              | Type        | Null | Key | Default | Extra |
--+--------------------+-------------+------+-----+---------+-------+
--| doc                | char(1)     | YES  |     | NULL    |       |
--| cedula             | int(11)     | YES  |     | NULL    |       |
--| nombre             | varchar(80) | YES  |     | NULL    |       |
--| apellido           | varchar(80) | YES  |     | NULL    |       |
--| direccion          | text        | YES  |     | NULL    |       |
--| correo_electronico | varchar(80) | YES  |     | NULL    |       |
--| fecha_nacimiento   | date        | YES  |     | NULL    |       |
--+--------------------+-------------+------+-----+---------+-------+
--7 rows in set (0.004 sec)

-- INGRESO DE DATOS EN LA TABLA
insert into personas(doc,cedula,nombre,apellido,direccion,correo_electronico,fecha_nacimiento) 
values 
('V',1234,'ANA','VASQUEZ','SANTA FE','av@gmail.com','1960-08-15'),
('E',8100,'PEDRO','ALMODOVAR','CARICUAO','pa@gmail.com','1950-09-01'),
('P',9100,'SARA','SUAREZ','CHACAITO','ss@hotmail.com','1990-06-20'),
('V',5678,'YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','1978-10-15');

--MariaDB [bd_henry_20250714]> insert into personas(doc,cedula,nombre,apellido,direccion,correo_electronico,fecha_nacimiento)
--    -> values
--    -> ('V',1234,'ANA','VASQUEZ','SANTA FE','av@gmail.com','1960-08-15'),
--    -> ('E',8100,'PEDRO','ALMODOVAR','CARICUAO','pa@gmail.com','1950-09-01'),
--    -> ('P',9100,'SARA','SUAREZ','CHACAITO','ss@hotmail.com','1990-06-20'),
--    -> ('V',5678,'YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','1978-10-15');
--Query OK, 4 rows affected (0.008 sec)
--Records: 4  Duplicates: 0  Warnings: 0

--MariaDB [bd_henry_20250714]>

-- VER EL CONTENIDO DE UNA TABLA
select * from personas;

--MariaDB [bd_henry_20250714]> select * from personas;
--+------+--------+---------+-----------+--------------+--------------------+------------------+
--| doc  | cedula | nombre  | apellido  | direccion    | correo_electronico | fecha_nacimiento |--
--+------+--------+---------+-----------+--------------+--------------------+------------------+
--| V    |   1234 | ANA     | VASQUEZ   | SANTA FE     | av@gmail.com       | 1960-08-15       |
--| E    |   8100 | PEDRO   | ALMODOVAR | CARICUAO     | pa@gmail.com       | 1950-09-01       |
--| P    |   9100 | SARA    | SUAREZ    | CHACAITO     | ss@hotmail.com     | 1990-06-20       |
--| V    |   5678 | YOLANDA | TORTOZA   | CATIA LA MAR | yt@gmail.com       | 1978-10-15       |
--+------+--------+---------+-----------+--------------+--------------------+------------------+
--4 rows in set (0.001 sec)

-- COMO MODIFICAR LA ESTRUCTURA DE UNA TABLA
-- Altera la estructura de la tabla personas, modificando
-- el campo 'cedula' por el nombre 'nro' y manteniendo 
-- el mismo tipo de dato

alter table personas change column cedula nro integer;

-- MariaDB [bd_henry_20250714]> alter table personas change column cedula nro integer;
-- Query OK, 0 rows affected (0.007 sec)
-- Records: 0  Duplicates: 0  Warnings: 0

-- MariaDB [bd_henry_20250714]>

-- COMPROBAR LA ESTRUCTURA DE LA TABLA DESPUÉS DEL CAMBIO
decribe personas;

--MariaDB [bd_henry_20250714]> describe personas;
--+--------------------+-------------+------+-----+---------+-------+
--| Field              | Type        | Null | Key | Default | Extra |
--+--------------------+-------------+------+-----+---------+-------+
--| doc                | char(1)     | YES  |     | NULL    |       |
--| nro                | int(11)     | YES  |     | NULL    |       |
--| nombre             | varchar(80) | YES  |     | NULL    |       |
--| apellido           | varchar(80) | YES  |     | NULL    |       |
--| direccion          | text        | YES  |     | NULL    |       |
--| correo_electronico | varchar(80) | YES  |     | NULL    |       |
--| fecha_nacimiento   | date        | YES  |     | NULL    |       |
--+--------------------+-------------+------+-----+---------+-------+
--7 rows in set (0.003 sec)

-- MariaDB [bd_henry_20250714]>

-- CAMBIO DEL TIPO DE DATO DE UN CAMPO
alter table personas change column nro nro varchar(8);

--MariaDB [bd_henry_20250714]> alter table personas change column nro nro varchar(8);
--Query OK, 4 rows affected (0.035 sec)
--Records: 4  Duplicates: 0  Warnings: 0

--MariaDB [bd_henry_20250714]> alter table personas change column nro nro varchar(8);
--Query OK, 4 rows affected (0.035 sec)
--Records: 4  Duplicates: 0  Warnings: 0

--MariaDB [bd_henry_20250714]> describe personas;
--+--------------------+-------------+------+-----+---------+-------+
--| Field              | Type        | Null | Key | Default | Extra |
--+--------------------+-------------+------+-----+---------+-------+
--| doc                | char(1)     | YES  |     | NULL    |       |
--| nro                | varchar(8)  | YES  |     | NULL    |       |
--| nombre             | varchar(80) | YES  |     | NULL    |       |
--| apellido           | varchar(80) | YES  |     | NULL    |       |
--| direccion          | text        | YES  |     | NULL    |       |
--| correo_electronico | varchar(80) | YES  |     | NULL    |       |
--| fecha_nacimiento   | date        | YES  |     | NULL    |       |
--+--------------------+-------------+------+-----+---------+-------+
--7 rows in set (0.004 sec)

--MariaDB [bd_henry_20250714]>

-- COMO AÑADIR UN CAMPO A UNA TABLA PRE EXISTENTE
-- POR OMISIÓN TODOS LOS CAMPOS SE AÑADEN AL FINAL
alter table personas add column sexo char(1);

--Query OK, 0 rows affected (0.005 sec)
--MariaDB [bd_henry_20250714]> alter table personas add column sexo char(1);
--Records: 0  Duplicates: 0  Warnings: 0

--MariaDB [bd_henry_20250714]> describe personas;
--+--------------------+-------------+------+-----+---------+-------+
--| Field              | Type        | Null | Key | Default | Extra |
--+--------------------+-------------+------+-----+---------+-------+
--| doc                | char(1)     | YES  |     | NULL    |       |
--| nro                | varchar(8)  | YES  |     | NULL    |       |
--| nombre             | varchar(80) | YES  |     | NULL    |       |
--| apellido           | varchar(80) | YES  |     | NULL    |       |
--| direccion          | text        | YES  |     | NULL    |       |
--| correo_electronico | varchar(80) | YES  |     | NULL    |       |
--| fecha_nacimiento   | date        | YES  |     | NULL    |       |
--| sexo               | char(1)     | YES  |     | NULL    |       |
--+--------------------+-------------+------+-----+---------+-------+
--8 rows in set (0.004 sec)

--MariaDB [bd_henry_20250714]>

-- AÑADIR UN CAMPO AL PRINCIPIO DE LA TABLA
-- Añadir el campo "id" de tipo entero,
-- al principio de la tabla.
alter table personas add column id integer first;

-- resultado del comando
--------------------------------------------------------
MariaDB [bd_henry_20250714]> alter table personas add column id integer first;
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [bd_henry_20250714]> describe personas;
+--------------------+-------------+------+-----+---------+-------+
| Field              | Type        | Null | Key | Default | Extra |
+--------------------+-------------+------+-----+---------+-------+
| id                 | int(11)     | YES  |     | NULL    |       |
| doc                | char(1)     | YES  |     | NULL    |       |
| nro                | varchar(8)  | YES  |     | NULL    |       |
| nombre             | varchar(80) | YES  |     | NULL    |       |
| apellido           | varchar(80) | YES  |     | NULL    |       |
| direccion          | text        | YES  |     | NULL    |       |
| correo_electronico | varchar(80) | YES  |     | NULL    |       |
| fecha_nacimiento   | date        | YES  |     | NULL    |       |
| sexo               | char(1)     | YES  |     | NULL    |       |
+--------------------+-------------+------+-----+---------+-------+
9 rows in set (0.004 sec)

MariaDB [bd_henry_20250714]>

----------------------------------------------------------------

-- AÑADIR UN CAMPO DESPUÉS DE UN CAMPO PRE EXISTENTE
alter table personas add column telefono_hab varchar(20) after apellido;

-- Resultados del comando:
----------------------------------------------------------------------
MariaDB [bd_henry_20250714]> alter table personas add column telefono_hab varchar(20) after apellido;
Query OK, 0 rows affected (0.007 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [bd_henry_20250714]> describe personas;
+--------------------+-------------+------+-----+---------+-------+
| Field              | Type        | Null | Key | Default | Extra |
+--------------------+-------------+------+-----+---------+-------+
| id                 | int(11)     | YES  |     | NULL    |       |
| doc                | char(1)     | YES  |     | NULL    |       |
| nro                | varchar(8)  | YES  |     | NULL    |       |
| nombre             | varchar(80) | YES  |     | NULL    |       |
| apellido           | varchar(80) | YES  |     | NULL    |       |
| telefono_hab       | varchar(20) | YES  |     | NULL    |       |
| direccion          | text        | YES  |     | NULL    |       |
| correo_electronico | varchar(80) | YES  |     | NULL    |       |
| fecha_nacimiento   | date        | YES  |     | NULL    |       |
| sexo               | char(1)     | YES  |     | NULL    |       |
+--------------------+-------------+------+-----+---------+-------+
10 rows in set (0.003 sec)

MariaDB [bd_henry_20250714]>
----------------------------------------------------------------------

-- Ver contenido de la tabla resultado:
select * from personas;

-- resultado 
-- Los nuevos campos quedaron en NULL al incorporarse en la tabla 
------------------------------------------------------------------------
MariaDB [bd_henry_20250714]> select * from personas;
+------+------+------+---------+-----------+--------------+--------------+--------------------+------------------+------+
| id   | doc  | nro  | nombre  | apellido  | telefono_hab | direccion    | correo_electronico | fecha_nacimiento | sexo |
+------+------+------+---------+-----------+--------------+--------------+--------------------+------------------+------+
| NULL | V    | 1234 | ANA     | VASQUEZ   | NULL         | SANTA FE     | av@gmail.com       | 1960-08-15       | NULL |
| NULL | E    | 8100 | PEDRO   | ALMODOVAR | NULL         | CARICUAO     | pa@gmail.com       | 1950-09-01       | NULL |
| NULL | P    | 9100 | SARA    | SUAREZ    | NULL         | CHACAITO     | ss@hotmail.com     | 1990-06-20       | NULL |
| NULL | V    | 5678 | YOLANDA | TORTOZA   | NULL         | CATIA LA MAR | yt@gmail.com       | 1978-10-15       | NULL |
+------+------+------+---------+-----------+--------------+--------------+--------------------+------------------+------+
4 rows in set (0.000 sec)

MariaDB [bd_henry_20250714]>
------------------------------------------------------------------------
-- CÓMO ACTUALIZAR VALORES EN LOS CAMPO DE UN REGISTRO PRE EXISTENTE
-------------------------------------------------------------------------
-- Actualiza la tabla personas y asigna al id el valor 1, al sexo 'F' y 
-- al teléfono '0212-1234567', donde el campo nro sea igual '1234';
--
update personas set id = 1,
                    sexo = 'F',
                    telefono_hab = '0212-1234567'
                    where nro = '1234';

update personas set id = 2,
                    sexo = 'M',
                    telefono_hab = '0212-9871234'
                    where nro = '8100';

update personas set id = 3,
                    sexo = 'F',
                    telefono_hab = '0212-5651234'
                    where nro = '9100';

update personas set id = 4,
                    sexo = 'F',
                    telefono_hab = '0212-9791234'
                    where nro = '5678';

-- RESULTADOS DEL COMANDO EFECTUADO
----------------------------------------------------------------------
MariaDB [bd_henry_20250714]> update personas set id = 1,
    ->                     sexo = 'F',
    ->                     telefono_hab = '0212-1234567'
    ->                     where nro = '1234';
Query OK, 1 row affected (0.003 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [bd_henry_20250714]> select * from personas;
+------+------+------+---------+-----------+--------------+--------------+--------------------+------------------+------+
| id   | doc  | nro  | nombre  | apellido  | telefono_hab | direccion    | correo_electronico | fecha_nacimiento | sexo |
+------+------+------+---------+-----------+--------------+--------------+--------------------+------------------+------+
|    1 | V    | 1234 | ANA     | VASQUEZ   | 0212-1234567 | SANTA FE     | av@gmail.com       | 1960-08-15       | F    |
| NULL | E    | 8100 | PEDRO   | ALMODOVAR | NULL         | CARICUAO     | pa@gmail.com       | 1950-09-01       | NULL |
| NULL | P    | 9100 | SARA    | SUAREZ    | NULL         | CHACAITO     | ss@hotmail.com     | 1990-06-20       | NULL |
| NULL | V    | 5678 | YOLANDA | TORTOZA   | NULL         | CATIA LA MAR | yt@gmail.com       | 1978-10-15       | NULL |
+------+------+------+---------+-----------+--------------+--------------+--------------------+------------------+------+
4 rows in set (0.000 sec)

MariaDB [bd_henry_20250714]>
MariaDB [bd_henry_20250714]>
MariaDB [bd_henry_20250714]> update personas set id = 2,
    ->                     sexo = 'M',
    ->                     telefono_hab = '0212-9871234'
    ->                     where nro = '8100';
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [bd_henry_20250714]> update personas set id = 3,
    ->                     sexo = 'F',
    ->                     telefono_hab = '0212-5651234'
    ->                     where nro = '9100';
Query OK, 1 row affected (0.002 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [bd_henry_20250714]> update personas set id = 4,
    ->                     sexo = 'F',
    ->                     telefono_hab = '0212-9791234'
    ->                     where nro = '5678';
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [bd_henry_20250714]> select * from personas;
+------+------+------+---------+-----------+--------------+--------------+--------------------+------------------+------+
| id   | doc  | nro  | nombre  | apellido  | telefono_hab | direccion    | correo_electronico | fecha_nacimiento | sexo |
+------+------+------+---------+-----------+--------------+--------------+--------------------+------------------+------+
|    1 | V    | 1234 | ANA     | VASQUEZ   | 0212-1234567 | SANTA FE     | av@gmail.com       | 1960-08-15       | F    |
|    2 | E    | 8100 | PEDRO   | ALMODOVAR | 0212-9871234 | CARICUAO     | pa@gmail.com       | 1950-09-01       | M    |
|    3 | P    | 9100 | SARA    | SUAREZ    | 0212-5651234 | CHACAITO     | ss@hotmail.com     | 1990-06-20       | F    |
|    4 | V    | 5678 | YOLANDA | TORTOZA   | 0212-9791234 | CATIA LA MAR | yt@gmail.com       | 1978-10-15       | F    |
+------+------+------+---------+-----------+--------------+--------------+--------------------+------------------+------+
4 rows in set (0.000 sec)

MariaDB [bd_henry_20250714]>
----------------------------------------------------------------------