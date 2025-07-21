select proveedores.nombre,
      proveedores.persona_contacto,
      proveedores.telefono,
      productos_sin_fk.nombre,
      productos_sin_fk.precio
      from proveedores
      left join productos_sin_fk
      on productos_sin_fk.proveedor_id = proveedores.id
      union
select proveedores.nombre,
      proveedores.persona_contacto,
      proveedores.telefono,
      productos_sin_fk.nombre,
      productos_sin_fk.precio
      from proveedores
      right join productos_sin_fk
      on productos_sin_fk.proveedor_id = proveedores.id;


insert into proveedores(nombre,direccion,correo_electronico,telefono,persona_contacto)
values
('SONY','AV. FRANCISCO DE MIRANDA','info@sony.com','0212-1234098','Ssana Mir');

insert into proveedores(id,nombre,direccion,correo_electronico,telefono,persona_contacto)
values
(9,'MAVE','BOLEITA NORTE','info@mave.com','0212-56789432','Norma Gainfa');


--CONSULTA CONBINADA ENTRE PROVEEDORES Y PRODUCTOS empleando inner join con area

select A.nombre as proveedor,
      A.persona_contacto as contacto,
      A.telefono,
      B.nombre as producto,
      B.precio
      from proveedores as A
      inner join productos as B
      on B.proveedor_id = A.id;

-- CREACION DE VISTAS 
create view vista_prov_pro_01 as 
select A.nombre as proveedor,
      A.persona_contacto as contacto,
      A.telefono,
      B.nombre as producto,
      B.precio
      from proveedores as A
      inner join productos as B
      on B.proveedor_id = A.id;

-- RESULTADO DEL COMANDO------
MariaDB [bd_reinaldo_20250714]> create view vista_prov_pro_01 as
    -> select A.nombre as proveedor,
    ->       A.persona_contacto as contacto,
    ->       A.telefono,
    ->       B.nombre as producto,
    ->       B.precio
    ->       from proveedores as A
    ->       inner join productos as B
    ->       on B.proveedor_id = A.id;
Query OK, 0 rows affected (0.003 sec)
---------------------------------------------------------------------------

MariaDB [bd_reinaldo_20250714]> show tables;
+--------------------------------+
| Tables_in_bd_reinaldo_20250714 |
+--------------------------------+
| personas                       |
| personas1                      |
| personas2                      |
| productos                      |
| productos_sin_fk               |
| proveedores                    |
| vista_prov_pro_01              |
+--------------------------------+
7 rows in set (0.001 sec)

MariaDB [bd_reinaldo_20250714]> select * from vista_prov_pro_01;
+------------------+-----------------+--------------+------------------+--------+
| proveedor        | contacto        | telefono     | producto         | precio |
+------------------+-----------------+--------------+------------------+--------+
| General Electric | Ana Vasquez     | 0212-5431234 | NEVERA           | 500.25 |
| General Electric | Ana Vasquez     | 0212-5431234 | CONGELADOR       | 250.75 |
| General Electric | Ana Vasquez     | 0212-5431234 | LAVADORA 10KG    | 300.00 |
| General Electric | Ana Vasquez     | 0212-5431234 | COCINA DE GAS    | 120.00 |
| Whirpool         | Yolanda Tortoza | 0212-9871234 | CONGELADOR       | 275.00 |
| Whirpool         | Yolanda Tortoza | 0212-9871234 | HORNO ELECTRICO  | 450.00 |
| Whirpool         | Yolanda Tortoza | 0212-9871234 | LAVADORA 10KG    | 295.00 |
| Whirpool         | Yolanda Tortoza | 0212-9871234 | COCINA ELECTRICA | 350.00 |
| Electrolux       | Nelly Contreras | 0212-2671234 | NEVERA           | 450.00 |
| Electrolux       | Nelly Contreras | 0212-2671234 | LAVADORA         | 380.00 |
| Electrolux       | Nelly Contreras | 0212-2671234 | COCINA DE GAS    | 230.00 |
| Electrolux       | Nelly Contreras | 0212-2671234 | COCINA ELECTRICA | 120.00 |
| LG               | Maiba Romero    | 0212-4431234 | NEVERA           | 590.75 |
| LG               | Maiba Romero    | 0212-4431234 | CONGELADOR       | 249.99 |
| LG               | Maiba Romero    | 0212-4431234 | LAVADORA 10KG    | 310.00 |
| LG               | Maiba Romero    | 0212-4431234 | COCINA DE GAS    | 170.00 |
| DAMASCO          | Roraima Rojas   | 0212-2431234 | NEVERA           | 400.25 |
+------------------+-----------------+--------------+------------------+--------+
17 rows in set (0.001 sec)
-------------------------------------------------------------------------------

create view vista_prov_pro_02 as
select A.nombre as proveedor,
      A.direccion,
      A.correo_electronico,
      A.persona_contacto as contacto,
      A.telefono,
      B.nombre as producto,
      B.precio,
      B.existencia
      from proveedores as A
      inner join productos as B
      on B.proveedor_id = A.id;


--- COLUMNAS CALCULADAS
--SUMATORIA
select sum(existencia) from vista_prov_pro_02;

--RESULTADO
MariaDB [bd_reinaldo_20250714]> select sum(existencia) from vista_prov_pro_02;
+-----------------+
| sum(existencia) |
+-----------------+
|             107 |
+-----------------+
1 row in set (0.001 sec)
-----------------------------------------------------------------------------

--MINIMO
select min(precio) from vista_prov_pro_02;

--RESULTADO
MariaDB [bd_reinaldo_20250714]> select min(precio) from vista_prov_pro_02;
+-------------+
| min(precio) |
+-------------+
|      120.00 |
+-------------+
1 row in set (0.001 sec)

MariaDB [bd_reinaldo_20250714]>
----------------------------------------------------------------------------

--MAXIMO
select max(precio) from vista_prov_pro_02;

---RESULTADO

MariaDB [bd_reinaldo_20250714]> select max(precio) from vista_prov_pro_02;
+-------------+
| max(precio) |
+-------------+
|      590.75 |
+-------------+
1 row in set (0.000 sec)
-------------------------------------------------------------------------


--PROMEDIO
select avg(precio) from vista_prov_pro_02;

--RESULTADO
MariaDB [bd_reinaldo_20250714]> select avg(precio) from vista_prov_pro_02;
+-------------+
| avg(precio) |
+-------------+
|  320.117059 |
+-------------+
1 row in set (0.000 sec)

-------------------------------------------------------------------------

--CONTAR
select count(*) from vista_prov_pro_02;

--RESULTADO
MariaDB [bd_reinaldo_20250714]> select count(*) from vista_prov_pro_02;
+----------+
| count(*) |
+----------+
|       17 |
+----------+
1 row in set (0.001 sec)

-----------------------------------------------------------------------------

-- AYUDA DE FUNCIONES
MariaDB [bd_reinaldo_20250714]> HELP functions;
You asked for help about help category: "Functions"
For more information, type 'help <item>', where <item> is one of the following
categories:
   Bit Functions
   Comparison Operators
   Control Flow Functions
   Date and Time Functions
   Dynamic Column Functions
   Encryption Functions
   Information Functions
   JSON Functions
   Logical Operators
   Miscellaneous Functions
   Numeric Functions
   Spider Functions
   String Functions
   Window Functions

-----------------------------------------------------------------------------

--RESULTADO DE NUMERICO FUNCIONES
MariaDB [bd_reinaldo_20250714]> help numeric functions;
You asked for help about help category: "Numeric Functions"
For more information, type 'help <item>', where <item> is one of the following
topics:
   ABS
   ACOS
   ASIN
   ATAN
   ATAN2
   Addition Operator (+)
   CEIL
   CEILING
   CONV
   COS
   COT
   CRC32
   DEGREES
   DIV
   Division Operator (/)
   EXP
   FLOOR
   LN
   LOG
   LOG10
   LOG2
   MOD
   Modulo Operator (%)
   Multiplication Operator (*)
   OCT
   PI
   POW
   POWER
   RADIANS
   RAND
   ROUND
   SIGN
   SIN
   SQRT
   Subtraction Operator (-)
   TAN
   TRUNCATE
---------------------------------------------------------------------

--RESULTADOS DEL COMANDO
MariaDB [bd_reinaldo_20250714]> select pow(2,10);
+-----------+
| pow(2,10) |
+-----------+
|      1024 |
+-----------+
1 row in set (0.000 sec)

MariaDB [bd_reinaldo_20250714]> select sqrt(9);
+---------+
| sqrt(9) |
+---------+
|       3 |
+---------+
1 row in set (0.000 sec)

MariaDB [bd_reinaldo_20250714]> select md5('unaweb');
+----------------------------------+
| md5('unaweb')                    |
+----------------------------------+
| b2abd794a1982d9c58e43c92c56736c2 |
+----------------------------------+
1 row in set (0.000 sec)

--------------------------------------------------------------------

---FUNCION DE ENCRYPTION FUNCTIONS (FUNCIONES DE CRIPTACIONES)
MariaDB [bd_reinaldo_20250714]> help encryption functions;
You asked for help about help category: "Encryption Functions"
For more information, type 'help <item>', where <item> is one of the following
topics:
   AES_DECRYPT
   AES_ENCRYPT
   COMPRESS
   DECODE
   DES_DECRYPT
   DES_ENCRYPT
   ENCODE
   ENCRYPT
   MD5
   OLD_PASSWORD
   PASSWORD
   SHA1
   SHA2
   UNCOMPRESS
   UNCOMPRESSED_LENGTH

MariaDB [bd_reinaldo_20250714]> help encode;
Name: 'ENCODE'
Description:
Syntax
------
ENCODE(str,pass_str)

Description
-----------
ENCODE is not considered cryptographically secure, and
should not be used for password encryption.

Encrypt str using pass_str as the password. To decrypt the
result, use
DECODE().

The result is a binary string of the same length as str.

The strength of the encryption is based on how good the
random generator is.

It is not recommended to rely on the encryption performed by
the ENCODE function. Using a salt value (changed when a
password is updated) will improve matters somewhat, but for
storing passwords, consider a more cryptographically secure
function, such as SHA2().

Examples
--------
ENCODE('not so secret text',
CONCAT('random_salt','password'))










URL: https://mariadb.com/kb/en/encode/
MariaDB [bd_reinaldo_20250714]> select encode('no es un texto seguro', concat('random_salt', 'password'));
+--------------------------------------------------------------------+
| encode('no es un texto seguro', concat('random_salt', 'password')) |
+--------------------------------------------------------------------+
| }óÐ∟h »æÄ+N▀QÔÞqÉÌÿk±                                                         |
+--------------------------------------------------------------------+
1 row in set (0.000 sec)

MariaDB [bd_reinaldo_20250714]>

-----------------------------------------------------------------------------

--CONDICION DE CONSULTAS
--LISTA
select producto, precio, existencia from vista_prov_pro_02
where producto = 'nevera' or producto = 'lavadora' or producto = 'congelador';

--RESULTADO
MariaDB [bd_reinaldo_20250714]> select producto, precio, existencia from vista_prov_pro_02
    -> where producto = 'nevera' or producto = 'lavadora' or producto = 'congelador';
+------------+--------+------------+
| producto   | precio | existencia |
+------------+--------+------------+
| NEVERA     | 500.25 |          6 |
| CONGELADOR | 250.75 |          3 |
| CONGELADOR | 275.00 |          5 |
| NEVERA     | 450.00 |          3 |
| LAVADORA   | 380.00 |          6 |
| NEVERA     | 590.75 |          3 |
| CONGELADOR | 249.99 |          6 |
| NEVERA     | 400.25 |          9 |
+------------+--------+------------+
8 rows in set (0.000 sec)
--------------------------------------------------------------------------

--EQUIVALENTE

select producto, precio, existencia from vista_prov_pro_02
where producto in ('nevera', 'lavadora', 'congelador');

--RESULTADO
MariaDB [bd_reinaldo_20250714]> select producto, precio, existencia from vista_prov_pro_02
    -> where producto in ('nevera', 'lavadora', 'congelador');
+------------+--------+------------+
| producto   | precio | existencia |
+------------+--------+------------+
| NEVERA     | 500.25 |          6 |
| CONGELADOR | 250.75 |          3 |
| CONGELADOR | 275.00 |          5 |
| NEVERA     | 450.00 |          3 |
| LAVADORA   | 380.00 |          6 |
| NEVERA     | 590.75 |          3 |
| CONGELADOR | 249.99 |          6 |
| NEVERA     | 400.25 |          9 |
+------------+--------+------------+
8 rows in set (0.000 sec)
-----------------------------------------------------------------------------

--OPUESTO DE AMBOS CASOS ANTERIORES
select producto, precio, existencia from vista_prov_pro_02
where not(producto = 'nevera' or producto = 'lavadora' or producto = 'congelador');

---RESULTADO
MariaDB [bd_reinaldo_20250714]> select producto, precio, existencia from vista_prov_pro_02
    -> where not(producto = 'nevera' or producto = 'lavadora' or producto = 'congelador');
+------------------+--------+------------+
| producto         | precio | existencia |
+------------------+--------+------------+
| LAVADORA 10KG    | 300.00 |          8 |
| COCINA DE GAS    | 120.00 |         10 |
| HORNO ELECTRICO  | 450.00 |          3 |
| LAVADORA 10KG    | 295.00 |         12 |
| COCINA ELECTRICA | 350.00 |          2 |
| COCINA DE GAS    | 230.00 |         12 |
| COCINA ELECTRICA | 120.00 |          8 |
| LAVADORA 10KG    | 310.00 |          3 |
| COCINA DE GAS    | 170.00 |          8 |
+------------------+--------+------------+
9 rows in set (0.001 sec)
----------------------------------------------------------------------------

select producto, precio, existencia from vista_prov_pro_02
where producto NOT in ('nevera', 'lavadora', 'congelador');

MariaDB [bd_reinaldo_20250714]> select producto, precio, existencia from vista_prov_pro_02
    -> where producto NOT in ('nevera', 'lavadora', 'congelador');
+------------------+--------+------------+
| producto         | precio | existencia |
+------------------+--------+------------+
| LAVADORA 10KG    | 300.00 |          8 |
| COCINA DE GAS    | 120.00 |         10 |
| HORNO ELECTRICO  | 450.00 |          3 |
| LAVADORA 10KG    | 295.00 |         12 |
| COCINA ELECTRICA | 350.00 |          2 |
| COCINA DE GAS    | 230.00 |         12 |
| COCINA ELECTRICA | 120.00 |          8 |
| LAVADORA 10KG    | 310.00 |          3 |
| COCINA DE GAS    | 170.00 |          8 |
+------------------+--------+------------+
9 rows in set (0.000 sec)

-----------------------------------------------------------

--CONSULTA DE UN INTERVALO O RANGO
select producto, precio, existencia from vista_prov_pro_02
where precio >= 200 and precio <= 500;

--RESULTADO
MariaDB [bd_reinaldo_20250714]> select producto, precio, existencia from vista_prov_pro_02
    -> where precio >= 200 and precio <= 500;
+------------------+--------+------------+
| producto         | precio | existencia |
+------------------+--------+------------+
| CONGELADOR       | 250.75 |          3 |
| LAVADORA 10KG    | 300.00 |          8 |
| CONGELADOR       | 275.00 |          5 |
| HORNO ELECTRICO  | 450.00 |          3 |
| LAVADORA 10KG    | 295.00 |         12 |
| COCINA ELECTRICA | 350.00 |          2 |
| NEVERA           | 450.00 |          3 |
| LAVADORA         | 380.00 |          6 |
| COCINA DE GAS    | 230.00 |         12 |
| CONGELADOR       | 249.99 |          6 |
| LAVADORA 10KG    | 310.00 |          3 |
| NEVERA           | 400.25 |          9 |
+------------------+--------+------------+
12 rows in set (0.000 sec)
----------------------------------------------------------------------------

--EQUIVALENTE

select producto, precio, existencia from vista_prov_pro_02
where precio between 200 and 500;

--RESULTADO
MariaDB [bd_reinaldo_20250714]> select producto, precio, existencia from vista_prov_pro_02
    -> where precio between 200 and 500;
+------------------+--------+------------+
| producto         | precio | existencia |
+------------------+--------+------------+
| CONGELADOR       | 250.75 |          3 |
| LAVADORA 10KG    | 300.00 |          8 |
| CONGELADOR       | 275.00 |          5 |
| HORNO ELECTRICO  | 450.00 |          3 |
| LAVADORA 10KG    | 295.00 |         12 |
| COCINA ELECTRICA | 350.00 |          2 |
| NEVERA           | 450.00 |          3 |
| LAVADORA         | 380.00 |          6 |
| COCINA DE GAS    | 230.00 |         12 |
| CONGELADOR       | 249.99 |          6 |
| LAVADORA 10KG    | 310.00 |          3 |
| NEVERA           | 400.25 |          9 |
+------------------+--------+------------+
12 rows in set (0.000 sec)
---------------------------------------------------------------------------

-- OPUESTO O NEGACION DE LO ANTERIOR
select producto, precio, existencia from vista_prov_pro_02
where NOT (precio >= 200 and precio <= 500);

--RESULTADO
MariaDB [bd_reinaldo_20250714]> select producto, precio, existencia from vista_prov_pro_02
    -> where NOT (precio >= 200 and precio <= 500);
+------------------+--------+------------+
| producto         | precio | existencia |
+------------------+--------+------------+
| NEVERA           | 500.25 |          6 |
| COCINA DE GAS    | 120.00 |         10 |
| COCINA ELECTRICA | 120.00 |          8 |
| NEVERA           | 590.75 |          3 |
| COCINA DE GAS    | 170.00 |          8 |
+------------------+--------+------------+
5 rows in set (0.001 sec)

------------------------------------------------------------------------------

--EQUIVALENTE
select producto, precio, existencia from vista_prov_pro_02
where NOT (precio between 200 and 500);

--- RESULTADO
MariaDB [bd_reinaldo_20250714]> select producto, precio, existencia from vista_prov_pro_02
    -> where NOT (precio between 200 and 500);
+------------------+--------+------------+
| producto         | precio | existencia |
+------------------+--------+------------+
| NEVERA           | 500.25 |          6 |
| COCINA DE GAS    | 120.00 |         10 |
| COCINA ELECTRICA | 120.00 |          8 |
| NEVERA           | 590.75 |          3 |
| COCINA DE GAS    | 170.00 |          8 |
+------------------+--------+------------+
5 rows in set (0.000 sec)
-----------------------------------------------------------------

--CONSULTA BASADA EN PARTE DEL CONTENIDO
select producto, precio, existencia from vista_prov_pro_02
where producto like '%cocina%';

--RESULTADO
MariaDB [bd_reinaldo_20250714]> select producto, precio, existencia from vista_prov_pro_02
    -> where producto like '%cocina%';
+------------------+--------+------------+
| producto         | precio | existencia |
+------------------+--------+------------+
| COCINA DE GAS    | 120.00 |         10 |
| COCINA ELECTRICA | 350.00 |          2 |
| COCINA DE GAS    | 230.00 |         12 |
| COCINA ELECTRICA | 120.00 |          8 |
| COCINA DE GAS    | 170.00 |          8 |
+------------------+--------+------------+
5 rows in set (0.000 sec)
-------------------------------------------------------------------------------

--DIFERENCIAR NULL DE ESPACIO EN BLANCO
create view vista_prov_pro_null as
select proveedores.nombre AS proveedor,
       proveedores.persona_contacto as contacto,
       proveedores.telefono,
       productos_sin_fk.nombre as producto,
       productos_sin_fk.precio
       from proveedores
       left join productos_sin_fk
       on productos_sin_fk.proveedor_id = proveedores.id
       UNION
select proveedores.nombre as proveedor,
       proveedores.persona_contacto as contacto,
       proveedores.telefono,
       productos_sin_fk.nombre as producto,
       productos_sin_fk.precio
       from proveedores
       right join productos_sin_fk
       on productos_sin_fk.proveedor_id = proveedores.id;

--RESULTADO 
MariaDB [bd_reinaldo_20250714]> select proveedores.nombre AS proveedor,
    ->        proveedores.persona_contacto as contacto,
    ->        proveedores.telefono,
    ->        productos_sin_fk.nombre as producto,
    ->        productos_sin_fk.precio
    ->        from proveedores
    ->        left join productos_sin_fk
    ->        on productos_sin_fk.proveedor_id = proveedores.id
    ->        UNION
    -> select proveedores.nombre as proveedor,
    ->        proveedores.persona_contacto as contacto,
    ->        proveedores.telefono,
    ->        productos_sin_fk.nombre as producto,
    ->        productos_sin_fk.precio
    ->        from proveedores
    ->        right join productos_sin_fk
    ->        on productos_sin_fk.proveedor_id = proveedores.id;
+------------------+-----------------+---------------+------------------+--------+
| proveedor        | contacto        | telefono      | producto         | precio |
+------------------+-----------------+---------------+------------------+--------+
| General Electric | Ana Vasquez     | 0212-5431234  | NEVERA           | 500.25 |
| General Electric | Ana Vasquez     | 0212-5431234  | CONGELADOR       | 250.75 |
| General Electric | Ana Vasquez     | 0212-5431234  | LAVADORA 10KG    | 300.00 |
| DAMASCO          | Roraima Rojas   | 0212-2431234  | COCINA DE GAS    | 120.00 |
| Whirpool         | Yolanda Tortoza | 0212-9871234  | CONGELADOR       | 275.00 |
| Whirpool         | Yolanda Tortoza | 0212-9871234  | HORNO ELECTRICO  | 450.00 |
| Whirpool         | Yolanda Tortoza | 0212-9871234  | LAVADORA 10KG    | 295.00 |
| HAIR             | Rosa Gonzales   | 0212-645123   | COCINA ELECTRICA | 350.00 |
| Electrolux       | Nelly Contreras | 0212-2671234  | NEVERA           | 450.00 |
| Electrolux       | Nelly Contreras | 0212-2671234  | LAVADORA         | 380.00 |
| Electrolux       | Nelly Contreras | 0212-2671234  | COCINA DE GAS    | 230.00 |
| SONY             | Ssana Mir       | 0212-1234098  | COCINA ELECTRICA | 120.00 |
| LG               | Maiba Romero    | 0212-4431234  | NEVERA           | 590.75 |
| LG               | Maiba Romero    | 0212-4431234  | CONGELADOR       | 249.99 |
| LG               | Maiba Romero    | 0212-4431234  | LAVADORA 10KG    | 310.00 |
| MAVE             | Norma Gainfa    | 0212-56789432 | NULL             |   NULL |
| NULL             | NULL            | NULL          | COCINA DE GAS    | 170.00 |
+------------------+-----------------+---------------+------------------+--------+
17 rows in set (0.001 sec)

select * from vista_prov_pro_null where proveedor is null;
MariaDB [bd_reinaldo_20250714]> select * from vista_prov_pro_null where proveedor is null;
+-----------+----------+----------+---------------+--------+
| proveedor | contacto | telefono | producto      | precio |
+-----------+----------+----------+---------------+--------+
| NULL      | NULL     | NULL     | COCINA DE GAS | 170.00 |
+-----------+----------+----------+---------------+--------+
1 row in set (0.001 sec)
----------------------------------------------------------------------------

--SE INGRESA UN PRODUCTO CUYO NOMBRE QUEDA EN BLANCO
insert into productos_sin_fk(proveedor_id,nombre,precio,existencia)
values
(8,'',1.50,100);

MariaDB [bd_reinaldo_20250714]> select * from vista_prov_pro_null where producto = "";
+-----------+----------+----------+----------+--------+
| proveedor | contacto | telefono | producto | precio |
+-----------+----------+----------+----------+--------+
| NULL      | NULL     | NULL     |          |   1.50 |
+-----------+----------+----------+----------+--------+
1 row in set (0.001 sec)

---------------------------------------------------------------------------

--MOSTRAR VALORES UNICOS
select producto, precio, existencia from vista_prov_pro_02;

distinct 
select distinct producto from vista_prov_pro_02;

--RESULTADO
MariaDB [bd_reinaldo_20250714]> select distinct producto from vista_prov_pro_02;
+------------------+
| producto         |
+------------------+
| NEVERA           |
| CONGELADOR       |
| LAVADORA 10KG    |
| COCINA DE GAS    |
| HORNO ELECTRICO  |
| COCINA ELECTRICA |
| LAVADORA         |
+------------------+
7 rows in set (0.000 sec)
-------------------------------------------------------------------

group by

select producto from vista_prov_pro_02 Group by producto;

MariaDB [bd_reinaldo_20250714]> select producto from vista_prov_pro_02 Group by producto;
+------------------+
| producto         |
+------------------+
| COCINA DE GAS    |
| COCINA ELECTRICA |
| CONGELADOR       |
| HORNO ELECTRICO  |
| LAVADORA         |
| LAVADORA 10KG    |
| NEVERA           |
+------------------+
7 rows in set (0.001 sec)

-------------------------------------------------------------------------

