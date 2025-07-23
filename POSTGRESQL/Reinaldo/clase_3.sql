-- CREACION DE VISTAS UTILIZANDO LA ASOSACION DE ALIAS
-- A) PROVEEDORES 
-- B) PRODUCTOS

create view vista_prov_pro_01 as 
select A.nombre as proveedor,
      A.persona_contacto as contacto,
      A.telefono,
      B.nombre as producto,
      B.precio
      from proveedores as A, productos as B
      where B.proveedor_id = A.id;

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

-------------------------------------------------------------------------------------------

create table productos_sin_fk(
  id serial,
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


insert into proveedores(id,nombre,direccion,correo_electronico,telefono,persona_contacto)
values
(9,'HAIR','AV. DEL VALLE','info@hair.com','0212-645123','Rosa Gonzales'),
(10,'DAMASCO','AV. FCO. DE MIRANDA','info@damasco.com','0212-2431234','Roraima Rojas');

create view vista_prov_prod_left_join as
select proveedores.nombre,
      proveedores.persona_contacto,
      proveedores.telefono,
      productos_sin_fk.nombre,
      productos_sin_fk.precio
      from proveedores
      left join productos_sin_fk
      on productos_sin_fk.proveedor_id = proveedores.id;

--inner join
create view vista_prov_prod_full_join as
select A.nombre as proveedor,
      A.persona_contacto as contacto,
      A.telefono,
      B.nombre as producto,
      B.precio
      from proveedores as A
      left join productos_sin_fk as B
      on B.proveedor_id = A.id
      union
select A.nombre as proveedor,
      A.persona_contacto as contacto,
      A.telefono,
      B.nombre as producto,
      B.precio
      from proveedores as A
      right join productos_sin_fk as B
      on B.proveedor_id = A.id;

--CREACION DE TIPO DE DATOS
create type profesion as enum('salud','educacion','ingenieria','economia','seguridad','recreacion','deporte','otra');

create table personas(
  doc char(1), 
  cedula integer,
  nombre varchar(80),
  apellido varchar(80),
  direccion text,
  actividad profesion default 'otra',
  correo_electronico varchar(80),
  fecha_nacimiento date)


insert into personas(doc,cedula,nombre,apellido,direccion,actividad,correo_electronico,
fecha_nacimiento)
values
('V',1234,'Ana','Vasquez','Santa Fe','economia','av@gmail.com','1960-08-01'),
('E',8100,'Pedro','Almodovar','Caricuao','deporte','pa@gmail.com','1950-09-15'),
('P',9100,'Sara','Suarez','Chacaito','educacion','ss@hotmail.com','1990-06-20'),
('V',5678,'Yolanda','Tortoza','catia la mar','salud','yt@hotmail.com','1978-10-15');

insert into personas(doc,cedula,nombre,apellido,direccion,correo_electronico,
fecha_nacimiento)
values
('V',9797,'linda','evan','la castellana','lv@ghotmail.com','1975-10-20');