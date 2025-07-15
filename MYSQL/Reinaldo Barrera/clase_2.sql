--VISUALIZAR LAS TABLAS CONTENIDAS EN LA BASE DE DATOS
show tables;

--RESULTADO DEL COMANDO

--MariaDB [bd_reinaldo_20250714]> show tables;
--+--------------------------------+
--| Tables_in_bd_reinaldo_20250714 |
--+--------------------------------+
--| personas                       |
--+--------------------------------+
--1- row in set (0.001 sec)

--VISUALIZAR ESTRUCTURA DE LA TABLA

describe personas;

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
--10 rows in set (0.101 sec)

--MariaDB [bd_reinaldo_20250714]>--

--VER EL CONTENIDO DE LA TABLA

select * from personas;

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

--COMO BORRAR COLUMNAS EN UNA TABLA

alter table personas drop column sexo;

--MariaDB [bd_reinaldo_20250714]> alter table personas drop column sexo;
--Query OK, 0 rows affected (0.006 sec)
--Records: 0  Duplicates: 0  Warnings: 0

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
--+--------------------+-------------+------+-----+---------+-------+
--9 rows in set (0.003 sec)

--CONSULTAR UN REGISTRO EN ESPECIFICO 
select * from personas where nro = 1234;

--RESULTADO DEL COMANDO

MariaDB [bd_reinaldo_20250714]> select * from personas where nro = 1234;
+------+------+------+--------+----------+--------------+-----------+--------------------+------------------+
| id   | doc  | nro  | nombre | apellido | telefono_hab | direccion | correo_electronico | fecha_nacimiento |
+------+------+------+--------+----------+--------------+-----------+--------------------+------------------+
|    1 | V    | 1234 | Ana    | Vasquez  | 04123875792  | Santa Fe  | av@gmail.com       | 1960-08-01       |
--+------+------+------+--------+----------+--------------+-----------+--------------------+------------------+
--1 row in set (0.000 sec)

--MariaDB [bd_reinaldo_20250714]>

--BORRAR EL REGISTRO DE UNA TABLA
delete from personas where nro = 1234;

--RESULTADO DEL COMANDO

MariaDB [bd_reinaldo_20250714]> delete from personas where nro = 1234;
Query OK, 1 row affected (0.002 sec)

MariaDB [bd_reinaldo_20250714]>

-- RESULTADO EN LA TABLA

MariaDB [bd_reinaldo_20250714]> select * from personas;
+------+------+------+---------+-----------+--------------+--------------+--------------------+------------------+
| id   | doc  | nro  | nombre  | apellido  | telefono_hab | direccion    | correo_electronico | fecha_nacimiento |
+------+------+------+---------+-----------+--------------+--------------+--------------------+------------------+
--|    2 | E    | 8100 | Pedro   | Almodovar | 0426789315   | Caricuao     | --pa@gmail.com       | 1950-09-15       |
--|    3 | P    | 9100 | Sara    | Suarez    | 0416538920   | Chacaito     | --ss@hotmail.com     | 1990-06-20       |
--|    4 | V    | 5678 | Yolanda | Tortoza   | 04129081325  | catia la mar | --yt@hotmail.com     | 1978-10-15       |
--+------+------+------+---------+-----------+--------------+--------------+--------------------+------------------+
--3 rows in set (0.000 sec)

--MariaDB [bd_reinaldo_20250714]>

--BORRAR TODOS LOS REGISTRO DE UNA TABLA
-- 1ra. forma: (ESTA OPCION REINICIA EL CONTADOR AUTO_INCREMENT)
truncate personas;

--RESULTADO DEL COMANDO
--MariaDB [bd_reinaldo_20250714]> truncate personas;
--Query OK, 0 rows affected (0.024 sec)

--MariaDB [bd_reinaldo_20250714]>

-- 2da. forma:
delete from personas;

--RESULTADO DEL COMANDO
--MariaDB [bd_reinaldo_20250714]> delete from personas;
--Query OK, 0 rows affected (0.000 sec)

--MariaDB [bd_reinaldo_20250714]>

-- OPERACIONES BASICAS SOBRE UNA TABLA son, tambien
--CONOCIDO COMO CRUD
insert(create o crear)
select(read o consultar)
update(update o actualizar)
delete(delete o borrar)

--CREACION DE TABLAS INEXADAS CON CAMPO AUTO-INCREMENT
-- SE VA A ADAPTAR LA DEFINICION DE LA TABLA PERSONAS
-- EL TIPO DE DATO AUTO_INCREMENT ES EL VALOR DEL TIPO 
--ENTERO ENUMERADO SE VA A IR INCREMENTANDO AUTOMATICAMENTE,
--CADA VEZ QUE SE INGRESE UN NUEVO REGISTRO
--SE AÑADE EL CAMPO ID, COMO CLAVE PRIMARIA

  --RESULTADO DEL COMANDO

--  MariaDB [bd_reinaldo_20250714]> create table personas1(
--    ->   id integer auto_increment,
--    ->   doc char(1),
--    ->   cedula integer,
--    ->   nombre varchar(80),
--    ->   apellido varchar(80),
--    ->   direccion text,
--    ->   correo_electronico varchar(80),
--    ->   fecha_nacimiento date,
--    ->   primary key(id));
--Query OK, 0 rows affected (0.010 sec)

--MariaDB [bd_reinaldo_20250714]>

MariaDB [bd_reinaldo_20250714]> show tables personas1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'personas1' at line 1

MariaDB [bd_reinaldo_20250714]> show tables like '%personas1%';
+----------------------------------------------+
| Tables_in_bd_reinaldo_20250714 (%personas1%) |
+----------------------------------------------+
| personas1                                    |
+----------------------------------------------+
1 row in set (0.000 sec)

MariaDB [bd_reinaldo_20250714]>

--COMO BORRAR UNA TABLA DE LA BASE DE DATO
drop table personas1;

--resultado 

--MariaDB [bd_reinaldo_20250714]> drop table personas1;
--Query OK, 0 rows affected (0.006 sec)

--MariaDB [bd_reinaldo_20250714]>

--------------------------------------------------------------------------

--RESULTADO

insert into personas1(doc,nro,nombre,apellido,direccion,correo_electronico,
fecha_nacimiento)
values
('V',1234,'Ana','Vasquez','Santa Fe','av@gmail.com','1960-08-01'),
('E',8100,'Pedro','Almodovar','Caricuao','pa@gmail.com','1950-09-15'),
('P',9100,'Sara','Suarez','Chacaito','ss@hotmail.com','1990-06-20'),
('V',5678,'Yolanda','Tortoza','catia la mar','yt@hotmail.com','1978-10-15');

--RESULTADO DEL COMANDO 

MariaDB [bd_reinaldo_20250714]> select * from personas1;
+----+------+------+---------+-----------+--------------+--------------------+------------------+
| id | doc  | nro  | nombre  | apellido  | direccion    | correo_electronico | fecha_nacimiento |
+----+------+------+---------+-----------+--------------+--------------------+------------------+
|  1 | V    | 1234 | Ana     | Vasquez   | Santa Fe     | av@gmail.com       | 1960-08-01       |
|  2 | E    | 8100 | Pedro   | Almodovar | Caricuao     | pa@gmail.com       | 1950-09-15       |
|  3 | P    | 9100 | Sara    | Suarez    | Chacaito     | ss@hotmail.com     | 1990-06-20       |
|  4 | V    | 5678 | Yolanda | Tortoza   | catia la mar | yt@hotmail.com     | 1978-10-15       |
|  5 | V    | 1234 | Ana     | Vasquez   | Santa Fe     | av@gmail.com       | 1960-08-01       |
|  6 | E    | 8100 | Pedro   | Almodovar | Caricuao     | pa@gmail.com       | 1950-09-15       |
|  7 | P    | 9100 | Sara    | Suarez    | Chacaito     | ss@hotmail.com     | 1990-06-20       |
|  8 | V    | 5678 | Yolanda | Tortoza   | catia la mar | yt@hotmail.com     | 1978-10-15       |
+----+------+------+---------+-----------+--------------+--------------------+------------------+
8 rows in set (0.000 sec)

-------------------------------------------------------------------------------

--BORRAR TODOS LOS REGISTROS CUYO ID, SEA MAYOR A 4
delete from personas1 where id > 4;

--MariaDB [bd_reinaldo_20250714]> delete from personas1 where id > 4;
--Query OK, 4 rows affected (0.002 sec)

--RESULTADO DEL COMANDO

--MariaDB [bd_reinaldo_20250714]> select * from personas1;
+----+------+------+---------+-----------+--------------+------------+------------------+
| id | doc  | nro  | nombre  | apellido  | direccion    | correo_electronico | fecha_nacimiento |
+----+------+------+---------+-----------+--------------+--------------------+------------------+
|  1 | V    | 1234 | Ana     | Vasquez   | Santa Fe     | av@gmail.com       | 1960-08-01       |
|  2 | E    | 8100 | Pedro   | Almodovar | Caricuao     | pa@gmail.com       | 1950-09-15       |
|  3 | P    | 9100 | Sara    | Suarez    | Chacaito     | ss@hotmail.com     | 1990-06-20       |
|  4 | V    | 5678 | Yolanda | Tortoza   | catia la mar | yt@hotmail.com     | 1978-10-15       |
+----+------+------+---------+-----------+--------------+--------------------+------------------+
4 rows in set (0.000 sec)

-- DADO QUE EL CAMPO ID, ES CLAVE PRIMARIA, NO ADMITE DUPLICIDAD 
-- DE REGISTROS

-- PRUEBA
insert into personas1(,doc,nro,nombre,apellido,direccion,correo_electronico,
fecha_nacimiento)
values
('V',9012,'Nelly','Contreras','La vega','nc@gmail.com','1968-07-16'); 

--RESULTADO
MariaDB [bd_reinaldo_20250714]> insert into personas1(id,doc,nro,nombre,apellido,direccion,correo_electronico,
    -> fecha_nacimiento)
    -> values
    -> (1,'V',9012,'Nelly','Contreras','La vega','nc@gmail.com','1968-07-16');
ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'
MariaDB [bd_reinaldo_20250714]>

--BORRAR PERSONAS MEDIANTE EL ID
delete from personas1 where id = 9;

-------------------------------------------------------------------------------

insert into personas1(doc,nro,nombre,apellido,direccion,correo_electronico,
fecha_nacimiento)
values
('V',9012,'Nelly','Contreras','La vega','nc@gmail.com','1968-07-16'); 

----RESULTADO

--MariaDB [bd_reinaldo_20250714]> insert into personas1(doc,nro,nombre,apellido,--direccion,correo_electronico,
--    -> fecha_nacimiento)
--    -> values
--    -> ('V',9012,'Nelly','Contreras','La vega','nc@gmail.com','1968-07-16');
-- OK, 1 row affected (0.001 sec)

-----------------------------------------------------------------------------
MariaDB [bd_reinaldo_20250714]> select * from personas1;
+----+------+------+---------+-----------+--------------+--------------------+------------------+
| id | doc  | nro  | nombre  | apellido  | direccion    | correo_electronico | fecha_nacimiento |
+----+------+------+---------+-----------+--------------+--------------------+------------------+
|  1 | V    | 1234 | Ana     | Vasquez   | Santa Fe     | av@gmail.com       | 1960-08-01       |
|  2 | E    | 8100 | Pedro   | Almodovar | Caricuao     | pa@gmail.com       | 1950-09-15       |
|  3 | P    | 9100 | Sara    | Suarez    | Chacaito     | ss@hotmail.com     | 1990-06-20       |
|  4 | V    | 5678 | Yolanda | Tortoza   | catia la mar | yt@hotmail.com     | 1978-10-15       |
| 10 | V    | 9012 | Nelly   | Contreras | La vega      | nc@gmail.com       | 1968-07-16       |
+----+------+------+---------+-----------+--------------+--------------------+------------------+
5 rows in set (0.000 sec)
-----------------------------------------------------------------------------

--DEFINICION DE CLAVES UNICAS
--SE DEFINE COMO CLAVE UNICA, LA COMBINACION DE (DOC,NRO) QUE
--CONFORMAN LA IDENTIFICACION DE LA PERSONA.
--EL CORREO ELECTRONICO TAMBIEN SERA CLAVE UNICA
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

  --RESULTADO
  MariaDB [bd_reinaldo_20250714]> describe personas2;
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
8 rows in set (0.003 sec)

---------------------------------------------------------------------------

  insert into personas2(doc,nro,nombre,apellido,direccion,correo_electronico,
fecha_nacimiento)
values
('V',1234,'Ana','Vasquez','Santa Fe','av@gmail.com','1960-08-01'),
('E',8100,'Pedro','Almodovar','Caricuao','pa@gmail.com','1950-09-15'),
('P',9100,'Sara','Suarez','Chacaito','ss@hotmail.com','1990-06-20'),
('V',5678,'Yolanda','Tortoza','catia la mar','yt@hotmail.com','1978-10-15'),
('V',9012,'Nelly','Contreras','La vega','nc@gmail.com','1968-07-16');

--PRUEBAS DE INTEGRIDAD DE DATOS
--1) CEDULA REPETIDA (DEBE FALLAR EL INGRESO)
insert into personas2(doc,nro,nombre,apellido,direccion,correo_electronico,
fecha_nacimiento)
values
('V',1234,'Nelly','Contreras','La vega','nc@gmail.com','1968-07-16');

---RESULTADO DEL COMANDO
MariaDB [bd_reinaldo_20250714]> insert into personas2(doc,nro,nombre,apellido,direccion,correo_electronico,
    -> fecha_nacimiento)
    -> values
    -> ('V',1234,'Nelly','Contreras','La vega','nc@gmail.com','1968-07-16');
ERROR 1062 (23000): Duplicate entry 'V-1234' for key 'doc'


--2) CORREO ELECTRONICO REPETIDO (DEBE FALLAR)
insert into personas2(doc,nro,nombre,apellido,direccion,correo_electronico,
fecha_nacimiento)
values
('V',9012,'Nelly','Contreras','La vega','av@gmail.com','1968-07-16');

--RESULTADO DEL COMANDO
MariaDB [bd_reinaldo_20250714]> insert into personas2(doc,nro,nombre,apellido,direccion,correo_electronico,
    -> fecha_nacimiento)
    -> values
    -> ('V',9012,'Nelly','Contreras','La vega','av@gmail.com','1968-07-16');
ERROR 1062 (23000): Duplicate entry 'av@gmail.com' for key 'correo_electronico'
MariaDB [bd_reinaldo_20250714]>

--CASO QUE FUNCIONA
--3) NO HAY COLISION CON LOS CAMPOS DE CLAVE PRIMARIA Y CLAVE UNICA
insert into personas2(doc,nro,nombre,apellido,direccion,correo_electronico,
fecha_nacimiento)
values
('V',9012,'Nelly','Contreras','La vega','nc@gmail.com','1968-07-16');

--CONSULTAR LOS DETALLES DE CREACION DE LA TABLA

show create table personas2;

--RESULTADO DEL COMANDO

--MariaDB [bd_reinaldo_20250714]> show create table personas2;
+-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
--| Table     | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
+-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
--| personas2 | CREATE TABLE `personas2` (
--  `id` int(11) NOT NULL AUTO_INCREMENT,
--  `doc` char(1) DEFAULT NULL,
--  `nro` int(11) DEFAULT NULL,
--  `nombre` varchar(80) DEFAULT NULL,
--  `apellido` varchar(80) DEFAULT NULL,
--  `direccion` text DEFAULT NULL,
--  `correo_electronico` varchar(80) DEFAULT NULL,
--  `fecha_nacimiento` date DEFAULT NULL,
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `doc` (`doc`,`nro`),
--  UNIQUE KEY `correo_electronico` (`correo_electronico`)
--) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 --COLLATE=utf8mb4_general_ci |
+-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
--1 row in set (0.000 sec)

--CAMBIAR EL MOTOR DE LA BASE DE DATOS
alter table personas2 engine MyISAM;
show create table personas2;
alter table personas2 engine InnoDB;
show create table personas2;

--ASOSIACION ENTRE TABLAS
-- DE TIPO 1 A MUCHOS

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