-- CARGA DE DATOS PARA PROVEEDORES Y PRODUCTOS
insert into proveedores(nombre,direccion,correo_electronico,telefono,persona_contacto)
values
('General Electric','AV. LECUNA','info@ge.com','0212-5431234','Ana Vasquez'),
('Whirpool','AV. ROMULO GALLEGOS','info@whirpool.com','0212-9871234','Yolanda Tortoza'),
('Electrolux','AV. DE LAS MERCEDES','info@electrolux.com','0212-2671234','Nelly Contreras'),
('LG','AV. SAN MARTIN', 'info@gmail.com', '0212-4431234','Maiba Romero');

-- CARGA DE LOS PRODUCTOS
insert into productos(proveedor_id,nombre,precio,existencia)
values
(1,'NEVERA',500.25,6),
(1,'CONGELADOR',250.75,3),
(1,'LAVADORA 10KG',300,8),
(1,'COCINA DE GAS',120,10),
(2,'CONGELADOR',275,5),
(2,'HORNO ELECTRICO',450,3),
(2,'LAVADORA 10KG',295,12),
(2,'COCINA ELECTRICA',350,2),
(3,'NEVERA',450,3),
(3,'LAVADORA',380,6),
(3,'COCINA DE GAS',230,12),
(3,'COCINA ELECTRICA',120,8),
(4,'NEVERA',590.75,3),
(4,'CONGELADOR',249.99,6),
(4,'LAVADORA 10KG',310,3),
(4,'COCINA DE GAS',170,8);

-----prueba de integridad de la asosacion entre las tablas
-- 1) AÑADIR UN REGISTRO EN LA TABLA PRODUCTO CUYO PROVEEDOR ID NO 
--EXISTE EN LA TABLA
--NO EXISTE EN LA TABLA PROVEEDORES. EL PROVEDOR_ID = NO EXISTE EN
--PROVEEDORES
insert into productos(proveedor_id,nombre,precio,existencia)
values
(5,'NEVERA',500.25,6);

--RESULTADO

MariaDB [bd_reinaldo_20250714]> insert into productos(proveedor_id,nombre,precio,existencia)
    -> values
    -> (5,'NEVERA',500.25,6);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`bd_reinaldo_20250714`.`productos`, CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`))
MariaDB [bd_reinaldo_20250714]>

-----------------------------------------------------------------------

-- 2) SE INTENTARA BORRAR UN REGISTRODE LA TABLA PROVEEDORES(PADRE)
--DADO QUE EXISTEN REGRISTROS PENDIENTES (HIJOS) EN LA TABLA
--PRODUCTOS, TAL OPERACION NO SERA PERMITIDA.

delete from proveedores where id = 1;

--RESULTADO DEL COMANDO
MariaDB [bd_reinaldo_20250714]> delete from proveedores where id = 1;
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`bd_reinaldo_20250714`.`productos`, CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`))
MariaDB [bd_reinaldo_20250714]>
-----------------------------------------------------------------------

-- 3) SI PERMITIRA AÑADIR UN NUEVO REGISTRO EN PROVEEDORES

insert into proveedores(nombre,direccion,correo_electronico,telefono,persona_contacto)
values
('DAMASCO','AV. FCO. DE MIRANDA','info@damasco.com','0212-2431234','Roraima Rojas');

--------------------------------------------------------------------------

-- UNA VEZ CREADO EL ID EN LA TABLA PADRE (PROVEEDORES), ES POSIBLE
--CREAR PRODUCTOS (TABLA HIJA), QUE HAGA REFENCIA A DICHA ENTIDAD (TABLA)

insert into productos(proveedor_id,nombre,precio,existencia)
values
(5,'NEVERA',400.25,9);

--RESULTADO 
MariaDB [bd_reinaldo_20250714]> insert into productos(proveedor_id,nombre,precio,existencia)
    -> values
    -> (5,'NEVERA',400.25,9);
Query OK, 1 row affected (0.001 sec)

MariaDB [bd_reinaldo_20250714]>

---------------------------------------------------------------------------

-- CONSULTA CONBINADA ENTRE PROVEEDORES Y PRODUCTOS
select proveedores.nombre,
      proveedores.persona_contacto,
      proveedores.telefono,
      productos.nombre,
      productos.precio
      from proveedores, productos
      where productos.proveedor_id = proveedores.id;
--------------------------------------------------

insert into proveedores(nombre,direccion,correo_electronico,telefono,persona_contacto)
values
('HAIR','AV. DEL VALLE','info@hair.com','0212-645123','Rosa Gonzales');

------------------------------------------------------

-- CONSULTA CONBINADA ENTRE PROVEEDORES Y PRODUCTOS empleando inner join
select proveedores.nombre,
      proveedores.persona_contacto,
      proveedores.telefono,
      productos.nombre,
      productos.precio
      from proveedores
      inner join productos
      on productos.proveedor_id = proveedores.id;
------------------------------------------------------------------------------

--CONSULTA CONBINADA ENTRE PROVEEDORES Y PRODUCTOS empleando left join
select proveedores.nombre,
      proveedores.persona_contacto,
      proveedores.telefono,
      productos.nombre,
      productos.precio
      from proveedores
      left join productos
      on productos.proveedor_id = proveedores.id;

------------------------------------------------------------------------------

--CONSULTA CONBINADA ENTRE PROVEEDORES Y PRODUCTOS_sin_fk empleando right join
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

insert into productos_sin_fk(proveedor_id,nombre,precio,existencia)
values
(1,'NEVERA',500.25,6),
(1,'CONGELADOR',250.75,3),
(1,'LAVADORA 10KG',300,8),
(5,'COCINA DE GAS',120,10),
(2,'CONGELADOR',275,5),
(2,'HORNO ELECTRICO',450,3),
(2,'LAVADORA 10KG',295,12),
(6,'COCINA ELECTRICA',350,2),
(3,'NEVERA',450,3),
(3,'LAVADORA',380,6),
(3,'COCINA DE GAS',230,12),
(7,'COCINA ELECTRICA',120,8),
(4,'NEVERA',590.75,3),
(4,'CONGELADOR',249.99,6),
(4,'LAVADORA 10KG',310,3),
(8,'COCINA DE GAS',170,8);

--------------------------------------------------------------------

--PRODUCTO CARDINAL JOIN
select proveedores.nombre,
      proveedores.persona_contacto,
      proveedores.telefono,
      productos_sin_fk.nombre,
      productos_sin_fk.precio
      from proveedores, PRODUCTOS_sin_fk;

------------------------------------------------------------------------


