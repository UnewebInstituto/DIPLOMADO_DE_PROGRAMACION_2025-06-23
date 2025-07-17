-- carga de datos para proveedores y productos
insert into proveedores(nombre, direccion, correo_electronico, telefono, persona_contacto)
values
('GENERAL ELECTRIC','AV. LECUNA', 'info@ge.com', '0212-5431234','ANA VASQUEZ'),
('WHIRPOOL','AV. ROMULO GALLEGOS','info@whirpool.com','0212-9871234','YOLANDA TORTOZA'),
('ELECTROLUX','AV. PPAL. DE LAS MERCEDES','info@electrolux.com','0212-2671234','NELLY CONTRERAS'),
('LG','AV. SAN MARTIN','info@lg.com','0212-4431234','MAIBA ROMERO');

insert into productos(proveedor_id, nombre, precio, existencia)
values
(1,'NEVERA',500.25,6),
(1,'CONGELADOR',250.75,3),
(1,'LAVADORA 10KG',300,8),
(1,'COCINA A GAS',120,10),
(2,'CONGELADOR',275,5),
(2,'HORNO ELECTRICO',450,3),
(2,'LAVADORA 10KG',295,12),
(2,'COCINA ELECTRICA',350,2),
(3,'NEVERA',450,3),
(3,'LAVADORA',380,6),
(3,'COCINA A GAS',230,12),
(3,'COCINA ELECTRICA',390,8),
(4,'NEVERA',590.75,3),
(4,'CONGELADOR',249.99,6),
(4,'LAVADORA 10KG',310,3),
(4,'COCINA A GAS',170,8);

-- Pruebas de integridad de la asociación entre las tablas
-- (1) Añadir un registro en la tabla productos, cuyo proveedor_id
-- no existe en la tabla proveedores. El proveedor_id = 5 NO EXISTE en proveedores.
insert into productos(proveedor_id, nombre, precio, existencia)
values
(5,'NEVERA',500.25,6);

-----------------------------------------------------------------------------
-- Resultado:
MariaDB [bd_henry_20250714]> insert into productos(proveedor_id, nombre, precio, existencia)
    -> values
    -> (5,'NEVERA',500.25,6);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`bd_henry_20250714`.`productos`, CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`))
MariaDB [bd_henry_20250714]> use bd_alejandro_20250714;
Database changed
-------------------------------------------------------------------------

-- (2) Se intentará borrar un registro de la tabla proveedores(padre), dado
-- que existen registros dependientes (hijos) en la tabla productos, tal operación
-- no será permitida. 
delete from proveedores where id = 1;

----------------------------------------------------------------------
-- Resultado:
MariaDB [bd_henry_20250714]> delete from proveedores where id = 1;
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`bd_henry_20250714`.`productos`, CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`))
MariaDB [bd_henry_20250714]>
------------------------------------------------------------------------

-- (3) Si permitirá añadir un nuevo registro en proveedores
insert into proveedores(nombre, direccion, correo_electronico, telefono, persona_contacto)
values
('DAMASCO','AV. FCO. DE MIRANDA', 'info@damasco.com', '0212-2431234','RORAIMA ROJAS');

----------------------------------------------------------------------------
-- Resultado
MariaDB [bd_henry_20250714]> insert into proveedores(nombre, direccion, correo_electronico, telefono, persona_contacto)
    -> values
    -> ('DAMASCO','AV. FCO. DE MIRANDA', 'info@damasco.com', '0212-2431234','RORAIMA ROJAS');
Query OK, 1 row affected (0.003 sec)

MariaDB [bd_henry_20250714]>
----------------------------------------------------------------------------

-- Una vez creado el id en la tabla padre (proveedores), es
-- posible crear productos (tabla hija), que haga referencia
-- a dicha entidad (tabla).
insert into productos(proveedor_id, nombre, precio, existencia)
values
(5,'NEVERA',400.25,9);

--------------------------------------------------------------
-- Resultado:
MariaDB [bd_henry_20250714]> insert into productos(proveedor_id, nombre, precio, existencia)
    -> values
    -> (5,'NEVERA',400.25,9);
Query OK, 1 row affected (0.002 sec)
--------------------------------------------------------------

-- Consulta combinada entre proveedores y productos
select proveedores.nombre,
       proveedores.persona_contacto,
       proveedores.telefono,
       productos.nombre,
       productos.precio
       from proveedores, productos
       where productos.proveedor_id = proveedores.id;


insert into proveedores(nombre, direccion, correo_electronico, telefono, persona_contacto)
values
('HAIR','AV. PPAL. DEL VALLE', 'info@hair.com', '0212-6431234','SOFIA CHAN');


-- Consulta combinada entre proveedores y productos empleando inner join
select proveedores.nombre,
       proveedores.persona_contacto,
       proveedores.telefono,
       productos.nombre,
       productos.precio
       from proveedores
       inner join productos
       on productos.proveedor_id = proveedores.id;

-- Consulta combinada entre proveedores y productos empleando left join
select proveedores.nombre,
       proveedores.persona_contacto,
       proveedores.telefono,
       productos.nombre,
       productos.precio
       from proveedores
       left join productos
       on productos.proveedor_id = proveedores.id;

-- Consulta combinada entre proveedores y productos_sin_fk empleando right join
select proveedores.nombre,
       proveedores.persona_contacto,
       proveedores.telefono,
       productos_sin_fk.nombre,
       productos_sin_fk.precio
       from proveedores
       right join productos_sin_fk
       on productos_sin_fk.proveedor_id = proveedores.id;

create table productos_sin_fk(
    id integer auto_increment,
    proveedor_id integer,
    nombre varchar(80),
    precio numeric(13,2),
    existencia integer,
    primary key(id)
);

insert into productos_sin_fk(proveedor_id, nombre, precio, existencia)
values
(1,'NEVERA',500.25,6),
(1,'CONGELADOR',250.75,3),
(1,'LAVADORA 10KG',300,8),
(5,'COCINA A GAS',120,10),
(2,'CONGELADOR',275,5),
(2,'HORNO ELECTRICO',450,3),
(2,'LAVADORA 10KG',295,12),
(6,'COCINA ELECTRICA',350,2),
(3,'NEVERA',450,3),
(3,'LAVADORA',380,6),
(3,'COCINA A GAS',230,12),
(7,'COCINA ELECTRICA',390,8),
(4,'NEVERA',590.75,3),
(4,'CONGELADOR',249.99,6),
(4,'LAVADORA 10KG',310,3),
(8,'COCINA A GAS',170,8);

-- producto cardinal
select proveedores.nombre,
       proveedores.persona_contacto,
       proveedores.telefono,
       productos_sin_fk.nombre,
       productos_sin_fk.precio
       from proveedselect proveedores.nombre,
       proveedores.persona_contacto,
       proveedores.telefono,
       productos_sin_fk.nombre,
       productos_sin_fk.precio
       from proveedores
       left join productos_sin_fk
       on productos_sin_fk.proveedor_id = proveedores.id
       UNION
select proveedores.nombre,
       proveedores.persona_contacto,
       proveedores.telefono,
       productos_sin_fk.nombre,
       productos_sin_fk.precio
       from proveedores
       right join productos_sin_fk
       on productos_sin_fk.proveedor_id = proveedores.id;ores, productos_sin_fk;

-- full join
