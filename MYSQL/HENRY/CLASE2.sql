-- Visualizar tablas contenidas en la base de datos
show tables;

-- Visualizar estructura de la tabla
describe personas;

-- resultado 
Setting environment for using XAMPP for Windows.
Profesor@DESKTOP-ORPPTTD c:\xampp
# mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
MariaDB [(none)]> use bd_henry_20250714
Database changed
MariaDB [bd_henry_20250714]> show tables;
+-----------------------------+
| Tables_in_bd_henry_20250714 |
+-----------------------------+
| personas                    |
+-----------------------------+
1 row in set (0.001 sec)

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
10 rows in set (0.007 sec)

MariaDB [bd_henry_20250714]>


----------------------------------------------------

-- Ver el contenido de la tabla
select * from personas;

-- Borrar columnas en una tabla
alter table personas drop column sexo;

-- Resultado del comando
MariaDB [bd_henry_20250714]> alter table personas drop column sexo;
Query OK, 0 rows affected (0.005 sec)
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
+--------------------+-------------+------+-----+---------+-------+
9 rows in set (0.003 sec)

MariaDB [bd_henry_20250714]>
-----------------------------------------------------------------------

-- Consultar un registro específico
select * from personas where nro = 1234;
-- Resultado del comando 
MariaDB [bd_henry_20250714]> select * from personas where nro = 1234;
+------+------+------+--------+----------+--------------+-----------+--------------------+------------------+
| id   | doc  | nro  | nombre | apellido | telefono_hab | direccion | correo_electronico | fecha_nacimiento |
+------+------+------+--------+----------+--------------+-----------+--------------------+------------------+
|    1 | V    | 1234 | ANA    | VASQUEZ  | 0212-1234567 | SANTA FE  | av@gmail.com       | 1960-08-15       |
+------+------+------+--------+----------+--------------+-----------+--------------------+------------------+
1 row in set (0.000 sec)

MariaDB [bd_henry_20250714]>

------------------------------------------------------------

-- Borrar el registro de una tabla
delete from personas where nro = 1234;

-- Resultado del comando
MariaDB [bd_henry_20250714]> delete from personas where nro = 1234;
Query OK, 1 row affected (0.002 sec)

MariaDB [bd_henry_20250714]>
------------------------------------------------------------
-- Borrar todos los registros de una tabla
-- 1ra. Forma: (Esta opción reinicia el contador auto_increment)
truncate personas;

-- 2da. Forma:
delete from personas;

-- Resultado:
MariaDB [bd_henry_20250714]> truncate personas;
Query OK, 0 rows affected (0.015 sec)

MariaDB [bd_henry_20250714]> delete from personas;
Query OK, 0 rows affected (0.000 sec)

MariaDB [bd_henry_20250714]> select * from personas;
Empty set (0.000 sec)

MariaDB [bd_henry_20250714]>
------------------------------------------------------------
-- Operaciones básicas sobre una tabla son, también
-- conocido como CRUD
insert (CREATE O CREAR)
select (READ O CONSULTAR)
update (UPDATE O ACTUALIZAR)
delete (DELETE O BORRAR)

-- Creación de tablas indexadas con campo auto_increment.
-- Se va a adaptar la definición de la tabla personas.
-- El tipo de dato auto_increment es valor del tipo entero enumerado,
-- se va a ir incrementado automáticamente, cada vez que se ingrese un
-- nuevo registro.
-- Se añade el campo id, como clave primaria.
create table personas1(
    id integer auto_increment,
    doc char(1), 
    nro integer,
    nombre varchar(80),
    apellido varchar(80),
    direccion text,
    correo_electronico varchar(80),
    fecha_nacimiento date,
    primary key(id));

-- Resultado
MariaDB [bd_henry_20250714]> create table personas1(
    ->     id integer auto_increment,
    ->     doc char(1),
    ->     nro integer,
    ->     nombre varchar(80),
    ->     apellido varchar(80),
    ->     direccion text,
    ->     correo_electronico varchar(80),
    ->     fecha_nacimiento date,
    ->     primary key(id));
Query OK, 0 rows affected (0.008 sec)



MariaDB [bd_henry_20250714]> show tables;
+-----------------------------+
| Tables_in_bd_henry_20250714 |
+-----------------------------+
| personas                    |
| personas1                   |
+-----------------------------+
2 rows in set (0.001 sec)

MariaDB [bd_henry_20250714]> describe personas1;
+--------------------+-------------+------+-----+---------+----------------+
| Field              | Type        | Null | Key | Default | Extra          |
+--------------------+-------------+------+-----+---------+----------------+
| id                 | int(11)     | NO   | PRI | NULL    | auto_increment |
| doc                | char(1)     | YES  |     | NULL    |                |
| nro                | int(11)     | YES  |     | NULL    |                |
| nombre             | varchar(80) | YES  |     | NULL    |                |
| apellido           | varchar(80) | YES  |     | NULL    |                |
| direccion          | text        | YES  |     | NULL    |                |
| correo_electronico | varchar(80) | YES  |     | NULL    |                |
| fecha_nacimiento   | date        | YES  |     | NULL    |                |
+--------------------+-------------+------+-----+---------+----------------+
8 rows in set (0.004 sec)

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
+--------------------+-------------+------+-----+---------+-------+
9 rows in set (0.004 sec)

MariaDB [bd_henry_20250714]>

--------------------------------------------------------------
-- Como borrar una tabla de la base de datos
drop table personas1;

insert into personas1(doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento) 
values 
('V',1234,'ANA','VASQUEZ','SANTA FE','av@gmail.com','1960-08-15'),
('E',8100,'PEDRO','ALMODOVAR','CARICUAO','pa@gmail.com','1950-09-01'),
('P',9100,'SARA','SUAREZ','CHACAITO','ss@hotmail.com','1990-06-20'),
('V',5678,'YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','1978-10-15');

-- Resultado
MariaDB [bd_henry_20250714]>

-- Borrar todos los registros cuyo id, sea mayor a 4.
delete from personas1 where id > 4;

-- Dado que el campo id, es clave primaria, no admite duplicidad de registros
-- Prueba
insert into personas1(id,doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento) 
values 
(1,'V',9012,'NELLY','CONTRERAS','LA VEGA','nc@gmail.com','1968-07-16');

-- Resultado
MariaDB [bd_henry_20250714]> insert into personas1(id,doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento)
    -> values
    -> (1,'V',9012,'NELLY','CONTRERAS','LA VEGA','nc@gmail.com','1968-07-16');
ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'
MariaDB [bd_henry_20250714]>
--------------------------------------------------------------------------------------

insert into personas1(doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento) 
values 
('V',9012,'NELLY','CONTRERAS','LA VEGA','nc@gmail.com','1968-07-16');

-- Resultado

MariaDB [bd_alejandro_20250714]> insert into personas1(doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento)
    -> values
    -> ('V',9012,'NELLY','CONTRERAS','LA VEGA','nc@gmail.com','1968-07-16');
Query OK, 1 row affected (0.002 sec)

MariaDB [bd_alejandro_20250714]>

-----------------------------------------------------------------------
-- definición de claves únicas
-- Se define como clave única, la combinación de (doc,nro) que
-- conforman la identificación de la persona.
-- El correo_electronico, también será clave única.
create table personas2(
    id integer auto_increment,
    doc char(1), 
    nro integer,
    nombre varchar(80),
    apellido varchar(80),
    direccion text,
    correo_electronico varchar(80),
    fecha_nacimiento date,
    primary key(id),
    unique(doc,nro),
    unique(correo_electronico));

-- Resultado
MariaDB [bd_henry_20250714]> create table personas2(
    ->     id integer auto_increment,
    ->     doc char(1),
    ->     nro integer,
    ->     nombre varchar(80),
    ->     apellido varchar(80),
    ->     direccion text,
    ->     correo_electronico varchar(80),
    ->     fecha_nacimiento date,
    ->     primary key(id),
    ->     unique(doc,nro),
    ->     unique(correo_electronico));
Query OK, 0 rows affected (0.015 sec)

MariaDB [bd_henry_20250714]> describe personas2;
+--------------------+-------------+------+-----+---------+----------------+
| Field              | Type        | Null | Key | Default | Extra          |
+--------------------+-------------+------+-----+---------+----------------+
| id                 | int(11)     | NO   | PRI | NULL    | auto_increment |
| doc                | char(1)     | YES  | MUL | NULL    |                |
| nro                | int(11)     | YES  |     | NULL    |                |
| nombre             | varchar(80) | YES  |     | NULL    |                |
| apellido           | varchar(80) | YES  |     | NULL    |                |
| direccion          | text        | YES  |     | NULL    |                |
| correo_electronico | varchar(80) | YES  | UNI | NULL    |                |
| fecha_nacimiento   | date        | YES  |     | NULL    |                |
+--------------------+-------------+------+-----+---------+----------------+
8 rows in set (0.004 sec)

MariaDB [bd_henry_20250714]>

insert into personas2(doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento) 
values 
('V',1234,'ANA','VASQUEZ','SANTA FE','av@gmail.com','1960-08-15'),
('E',8100,'PEDRO','ALMODOVAR','CARICUAO','pa@gmail.com','1950-09-01'),
('P',9100,'SARA','SUAREZ','CHACAITO','ss@hotmail.com','1990-06-20'),
('V',5678,'YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','1978-10-15');

-- Pruebas de integridad de datos
-- 1) Cédula repetida (debe fallar el ingreso)
insert into personas2(doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento) 
values 
('V',1234,'NELLY','CONTRERAS','LA VEGA','nc@gmail.com','1968-07-16');

-- 2) Correo electrónico repetido (debe fallar el ingreso)
insert into personas2(doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento) 
values 
('V',9012,'NELLY','CONTRERAS','LA VEGA','av@gmail.com','1968-07-16');

-- Caso en que funciona
-- 3) No hay colisión con los campos de clave primaria y clave única
insert into personas2(doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento) 
values 
('V',9012,'NELLY','CONTRERAS','LA VEGA','nc@gmail.com','1968-07-16');

--------------------------------------------------------------------------
-- Resultado:
MariaDB [bd_henry_20250714]> select * from personas2;
+----+------+------+---------+-----------+--------------+--------------------+------------------+
| id | doc  | nro  | nombre  | apellido  | direccion    | correo_electronico | fecha_nacimiento |
+----+------+------+---------+-----------+--------------+--------------------+------------------+
|  1 | V    | 1234 | ANA     | VASQUEZ   | SANTA FE     | av@gmail.com       | 1960-08-15       |
|  2 | E    | 8100 | PEDRO   | ALMODOVAR | CARICUAO     | pa@gmail.com       | 1950-09-01       |
|  3 | P    | 9100 | SARA    | SUAREZ    | CHACAITO     | ss@hotmail.com     | 1990-06-20       |
|  4 | V    | 5678 | YOLANDA | TORTOZA   | CATIA LA MAR | yt@gmail.com       | 1978-10-15       |
+----+------+------+---------+-----------+--------------+--------------------+------------------+
4 rows in set (0.000 sec)

MariaDB [bd_henry_20250714]>    insert into personas2(doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento)
    -> values
    -> ('V',1234,'NELLY','CONTRERAS','LA VEGA','nc@gmail.com','1968-07-16');
ERROR 1062 (23000): Duplicate entry 'V-1234' for key 'doc'
MariaDB [bd_henry_20250714]> insert into personas2(doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento)
    -> values
    -> ('V',9012,'NELLY','CONTRERAS','LA VEGA','av@gmail.com','1968-07-16');
ERROR 1062 (23000): Duplicate entry 'av@gmail.com' for key 'correo_electronico'
MariaDB [bd_henry_20250714]> insert into personas2(doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento)
    -> values
    -> ('V',9012,'NELLY','CONTRERAS','LA VEGA','nc@gmail.com','1968-07-16');
Query OK, 1 row affected (0.001 sec)

MariaDB [bd_henry_20250714]> select * from personas2;
+----+------+------+---------+-----------+--------------+--------------------+------------------+
| id | doc  | nro  | nombre  | apellido  | direccion    | correo_electronico | fecha_nacimiento |
+----+------+------+---------+-----------+--------------+--------------------+------------------+
|  1 | V    | 1234 | ANA     | VASQUEZ   | SANTA FE     | av@gmail.com       | 1960-08-15       |
|  2 | E    | 8100 | PEDRO   | ALMODOVAR | CARICUAO     | pa@gmail.com       | 1950-09-01       |
|  3 | P    | 9100 | SARA    | SUAREZ    | CHACAITO     | ss@hotmail.com     | 1990-06-20       |
|  4 | V    | 5678 | YOLANDA | TORTOZA   | CATIA LA MAR | yt@gmail.com       | 1978-10-15       |
|  7 | V    | 9012 | NELLY   | CONTRERAS | LA VEGA      | nc@gmail.com       | 1968-07-16       |
+----+------+------+---------+-----------+--------------+--------------------+------------------+
5 rows in set (0.000 sec)

MariaDB [bd_henry_20250714]>

--------------------------------------------------------------------------
-- Consultar los detalles de creación de la tabla

show create table personas2;

--------------------------------------------------------------------------
-- Resultado

MariaDB [bd_henry_20250714]> show create table personas2;
+-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table     | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
+-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| personas2 | CREATE TABLE `personas2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc` char(1) DEFAULT NULL,
  `nro` int(11) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `apellido` varchar(80) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `doc` (`doc`,`nro`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci |
+-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.000 sec)

MariaDB [bd_henry_20250714]>
MariaDB [bd_henry_20250714]>
MariaDB [bd_henry_20250714]>

--------------------------------------------------------------------------
-- Cambiar el motor de la base de datos
--------------------------------------------------------------------------
alter table personas2 engine MyISAM;
show create table personas2;
alter table personas2 engine InnoDB;
show create table personas2;


-- Asociación entre tablas
-- de tipo 1 a muchos
create table proveedores(
    id integer auto_increment,
    nombre varchar(80),
    direccion text,
    correo_electronico varchar(80),
    telefono varchar(80),
    persona_contacto varchar(80),
    primary key(id),
    unique(correo_electronico)
);

create table productos(
    id integer auto_increment,
    proveedor_id integer,
    nombre varchar(80),
    precio numeric(13,2),
    existencia integer,
    primary key(id),
    foreign key(proveedor_id) references proveedores(id)
);

-- Resultado
MariaDB [bd_henry_20250714]> show tables;
+-----------------------------+
| Tables_in_bd_henry_20250714 |
+-----------------------------+
| personas                    |
| personas1                   |
| personas2                   |
| productos                   |
| proveedores                 |
+-----------------------------+
5 rows in set (0.001 sec)

MariaDB [bd_henry_20250714]>

------------------------------------------------

MariaDB [bd_henry_20250714]> show create table productos;
+-----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table     | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                            |
+-----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| productos | CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(11) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `precio` decimal(13,2) DEFAULT NULL,
  `existencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci |
+-----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.001 sec)

MariaDB [bd_henry_20250714]>

