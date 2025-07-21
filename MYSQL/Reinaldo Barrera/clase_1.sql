-- creacion de base de dato

create database bd_reinaldo_20250714

-- MariaDB [(none)]> create database
-- bd_reinaldo_20250714
-- Query ok, 1 row affected 

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
--3 rows in set (0.001 sec)

--MariaDB [(none)]>


-- CONEXIÓN A BASE DE DATOS
use bd_reinaldo_20250714;

-- MariaDB [(none)]> use bd_reinaldo_20250714;
-- Database changed
-- MariaDB [bd_reinaldo_20250714]>

-- creacion de tablas
-- se aconseja que el nombre sea en plural
create table personas(
  doc char(1), 
  cedula integer,
  nombre varchar(80),
  apellido varchar(80),
  direccion text,
  correo_electronico varchar(80),
  fecha_nacimiento date)

  -- Resultado del comando
  --MariaDB [bd_reinaldo_20250714]> create table personas(
    -->   doc char(1),
    -->   cedula integer,
    -->   nombre varchar(80),
    -->   apellido varchar(80),
    -->   direccion text,
    -->   correo_electronico varchar(80),
    -->   fecha_nacimiento date);
--Query OK, 0 rows affected (0.008 sec)

-- 

-- como visualizar la estructura de una tabla
describe personas;

mariaDB [bd_reinaldo_20250714]> describe personas;
--+--------------------+-------------+------+-----+---------+-------+
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
--7 rows in set (0.005 sec)

--MariaDB [bd_reinaldo_20250714]>

--ingreso de datos en la tabla

insert into personas(doc,cedula,nombre,apellido,direccion,correo_electronico,
fecha_nacimiento)
values
('V',1234,'Ana','Vasquez','Santa Fe','av@gmail.com','1960-08-01'),
('E',8100,'Pedro','Almodovar','Caricuao','pa@gmail.com','1950-09-15'),
('P',9100,'Sara','Suarez','Chacaito','ss@hotmail.com','1990-06-20'),
('V',5678,'Yolanda','Tortoza','catia la mar','yt@hotmail.com','1978-10-15');

--ERROR 1054 (42S22): Unknown column 'dirreccion' in 'field list'}

--Ver el contenido de una tabla
select * from personas;

--MariaDB [bd_reinaldo_20250714]> select * from personas;
--+------+--------+---------+-----------+--------------+----------------------+------------------+
--| doc  | cedula | nombre  | apellido  | direccion    | correo_electronico | --fecha_nacimiento |
--+------+--------+---------+-----------+--------------+----------------------+------------------+
--| V    |   1234 | Ana     | Vasquez   | Santa Fe     | av@gmail.com       | --1960-08-01       |
--| E    |   8100 | Pedro   | Almodovar | Caricuao     | pa@gmail.com       | --1950-09-15       |
--| P    |   9100 | Sara    | Suarez    | Chacaito     | ss@hotmail.com     | --1990-06-20       |
--| V    |   5678 | Yolanda | Tortoza   | catia la mar | yt@hotmail.com     | --1978-10-15       |
--+------+--------+---------+-----------+--------------+----------------------+------------------+
--4 rows in set (0.000 sec)

--COMO MODIFICAR LA ESTRUCTURA DE UNA TABLA
--ALTERA LA ESTRUCTURA DE LA TABLA PERSONAS, MODIFICANDO EL
--CAMPO 'CEDULA' POR EL 'NRO' Y MANTENIENDO EL MISMO
--TIPO DE DATO
alter table personas change column cedula nro integer;

--MariaDB [bd_reinaldo_20250714]> alter table personas change column cedula nro integer;
--Query OK, 0 rows affected (0.005 sec)
--Records: 0  Duplicates: 0  Warnings: 0

--MariaDB [bd_reinaldo_20250714]>

--COMPROBAR LA ESTRUCTURA DE LA TABLA DESPUES DEL CAMBIO
describe personas;
--MariaDB [bd_reinaldo_20250714]> describe personas;
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

--MariaDB [bd_reinaldo_20250714]>

--CAMBIO EN EL TIPO DE DATO DE UN CAMPO
alter table personas change column nro nro varchar(8);
--MariaDB [bd_reinaldo_20250714]> alter table personas change column nro nro varchar(8);
--Query OK, 4 rows affected (0.029 sec)
--Records: 4  Duplicates: 0  Warnings: 0

--MariaDB [bd_reinaldo_20250714]>

--RESULTADO DESPUES DE CAMBIAR EL TIPO DE DATO
--MariaDB [bd_reinaldo_20250714]> describe personas;
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

--MariaDB [bd_reinaldo_20250714]>

--COMO AÑADIR UN CAMPO A UNA TABLA PRE-EXISTENTE 
--POR OMISION TODOS LOS CAMPOS SE AÑADEN AL FINAL
alter table personas add column sexo char(1);

--MariaDB [bd_reinaldo_20250714]> alter table personas add column sexo char(1);
--Query OK, 0 rows affected (0.005 sec)
--Records: 0  Duplicates: 0  Warnings: 0

--MariaDB [bd_reinaldo_20250714]>

--RESULTADO
--MariaDB [bd_reinaldo_20250714]> describe personas;
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
--8 rows in set (0.003 sec)

--MariaDB [bd_reinaldo_20250714]>

--AÑADIR UN CAMPO AL PRINCIPIO DE LA TABLA
--AÑADIR EL CAMPO ID DE TIPO ERNTERO AL PRINCIPIO DE LA TABLA
alter table personas add column id integer first;

--MariaDB [bd_reinaldo_20250714]> alter table personas add column id integer first;
--Query OK, 0 rows affected (0.013 sec)
--Records: 0  Duplicates: 0  Warnings: 0

--MariaDB [bd_reinaldo_20250714]>

--RESULTADO DEL COMANDO
--MariaDB [bd_reinaldo_20250714]> describe personas;
--+--------------------+-------------+------+-----+---------+-------+
--| Field              | Type        | Null | Key | Default | Extra |
--+--------------------+-------------+------+-----+---------+-------+
--| id                 | int(11)     | YES  |     | NULL    |       |
--| doc                | char(1)     | YES  |     | NULL    |       |
--| nro                | varchar(8)  | YES  |     | NULL    |       |
--| nombre             | varchar(80) | YES  |     | NULL    |       |
--| apellido           | varchar(80) | YES  |     | NULL    |       |
--| direccion          | text        | YES  |     | NULL    |       |
--| correo_electronico | varchar(80) | YES  |     | NULL    |       |
--| fecha_nacimiento   | date        | YES  |     | NULL    |       |
--| sexo               | char(1)     | YES  |     | NULL    |       |
--+--------------------+-------------+------+-----+---------+-------+
--9 rows in set (0.003 sec)

--MariaDB [bd_reinaldo_20250714]>

--AÑADIR UN CAMPO DESPUES DE UN CAMPO PRE-EXISTENTE
alter table personas add column telefono_hab varchar(20) after
apellido;

--Query OK, 0 rows affected (0.005 sec)
--Records: 0  Duplicates: 0  Warnings: 0

--MariaDB [bd_reinaldo_20250714]>

--RESULTADO DEL COMANDO
--MariaDB [bd_reinaldo_20250714]> describe personas;
--+--------------------+-------------+------+-----+---------+-------+
--| Field              | Type        | Null | Key | Default | Extra |
--+--------------------+-------------+------+-----+---------+-------+
--| id                 | int(11)     | YES  |     | NULL    |       |
--| doc                | char(1)     | YES  |     | NULL    |       |
--| nro                | varchar(8)  | YES  |     | NULL    |       |
--| nombre             | varchar(80) | YES  |     | NULL    |       |
--| apellido           | varchar(80) | YES  |     | NULL    |       |
--| telefono_hab       | varchar(20) | YES  |     | NULL    |       |
--| direccion          | text        | YES  |     | NULL    |       |
--| correo_electronico | varchar(80) | YES  |     | NULL    |       |
--| fecha_nacimiento   | date        | YES  |     | NULL    |       |
--| sexo               | char(1)     | YES  |     | NULL    |       |
--+--------------------+-------------+------+-----+---------+-------+
--10 rows in set (0.003 sec)

--MariaDB [bd_reinaldo_20250714]>

-- VER CONTENIDO DE LA TABLA
select * from personas;

--RESULTADOS DE LA TABLA
--
--MariaDB [bd_reinaldo_20250714]> select * from personas;
--+------+------+------+---------+-----------+--------------+----------------+--------------------+------------------+------+
--| id   | doc  | nro  | nombre  | apellido  | telefono_hab | direccion    | --correo_electronico | fecha_nacimiento | sexo |
--+------+------+------+---------+-----------+--------------+----------------+--------------------+------------------+------+
--| NULL | V    | 1234 | Ana     | Vasquez   | NULL         | Santa Fe     | --av@gmail.com       | 1960-08-01       | NULL |
--| NULL | E    | 8100 | Pedro   | Almodovar | NULL         | Caricuao     | --pa@gmail.com       | 1950-09-15       | NULL |
--| NULL | P    | 9100 | Sara    | Suarez    | NULL         | Chacaito     | --ss@hotmail.com     | 1990-06-20       | NULL |
--| NULL | V    | 5678 | Yolanda | Tortoza   | NULL         | catia la mar | --yt@hotmail.com     | 1978-10-15       | NULL |
--+------+------+------+---------+-----------+--------------+----------------+--------------------+------------------+------+
--4 rows in set (0.000 sec)

--MariaDB [bd_reinaldo_20250714]>

--COMO ACTUALIZAR VALORES EN LOS CAMPOS DE UN REGISTRO PRE-EXISTENTE
--ACTUALIZA LA TABLA PERSONAS Y ASIGNA AL ID EL VALOR 1, AL SEXO 'F' Y
--AL TELEFONO '04123875792', DONDE EL CAMPO NRO SEA IGUAL '1234'

update personas set id= 1, 
sexo = 'F',
telefono_hab= '04123875792' 
where nro = '1234';

update personas set id= 2, 
sexo = 'M',
telefono_hab= '0426789315' 
where nro = '8100';

update personas set id= 3, 
sexo = 'F',
telefono_hab= '0416538920' 
where nro = '9100';

update personas set id= 4, 
sexo = 'F',
telefono_hab= '04129081325' 
where nro = '5678';

--RESULTADO DEL COMANDO
--MariaDB [bd_reinaldo_20250714]> select * from personas;
--+------+------+------+---------+-----------+--------------+----------------+--------------------+------------------+------+
--| id   | doc  | nro  | nombre  | apellido  | telefono_hab | direccion    | --correo_electronico | fecha_nacimiento | sexo |
--+------+------+------+---------+-----------+--------------+----------------+--------------------+------------------+------+
--|    1 | V    | 1234 | Ana     | Vasquez   | 04123875792  | Santa Fe     | --av@gmail.com       | 1960-08-01       | F    |
--|    2 | E    | 8100 | Pedro   | Almodovar | 0426789315   | Caricuao     | --pa@gmail.com       | 1950-09-15       | M    |
--|    3 | P    | 9100 | Sara    | Suarez    | 0416538920   | Chacaito     | --ss@hotmail.com     | 1990-06-20       | F    |
--|    4 | V    | 5678 | Yolanda | Tortoza   | 04129081325  | catia la mar | --yt@hotmail.com     | 1978-10-15       | F    |
--+------+------+------+---------+-----------+--------------+----------------+--------------------+------------------+------+
--4 rows in set (0.000 sec)

--MariaDB [bd_reinaldo_20250714]>

--PARA SALIR DE LA BASE DE DATO 
quit
# exit
