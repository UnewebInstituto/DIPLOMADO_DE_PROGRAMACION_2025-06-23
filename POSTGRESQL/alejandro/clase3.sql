-- Uso de alias
-- A: Proveedores
-- B: Productos
create view vista_prov_prod_01 as 
select A.nombre as proveedor,
       A.persona_contacto as contacto,
       A.telefono,
       B.nombre as producto,
       B.precio
       from proveedores as A, productos as B
       where B.proveedor_id = A.id;

--


  create table productos_sin_fk(
    id serial,
    proveedor_id integer,
    nombre varchar(80),
    precio numeric(13,2),
    existencia integer,
    primary key(id)
    );

    INSERT INTO productos_sin_fk(proveedor_id, nombre, precio, existencia)
VALUES 
(1,'NEVERA',500.25,6),
(1,'CONGELADOR',250.75,3),
(1,'LAVADORA 10K',300,8),
(5,'COCINA A GAS',120,10),
(2,'CONGELADOR',275,5),
(2,'HORNO ELECTRICO',450,3),
(2,'LAVADORA 10K',295,12),
(6,'COCINA ELECTRICA',350,2),
(3,'NEVERA',450,3),
(3,'LAVADORA',380,6),
(3,'COCINA A GAS',230,12),
(7,'COCINA ELECTRICA',390,8),
(4,'NEVERA',500.75,3),
(4,'CONGELADOR',249.99,6),
(4,'LAVADORA 10K',310,3),
(8,'COCINA A GAS',170,8);

insert into proveedores(id,nombre,direccion,correo_electronico,telefono,persona_contacto)
values (9,'DAMASCO','AV.FCO.MIRANDA','info@damasco,com','0212-2341234','RORAIMA ROJAS'),
(10,'HAIER','AV.PPL,DEL VALLE','info@haier.com','0212-6431234','SOFIA CHANG');

--inner join
create view vista_prov_prod_inner_join as
       select A.nombre as proveedor,
              A.correo_electronico,
              A.persona_contacto as contacto,
              A.telefono,
              B.nombre as producto,
              B.precio
             from proveedores as A 
             inner join productos_sin_fk as B
            on B.proveedor_id = A.id;

   --left join
  create view vista_prov_prod_left_join as
       select A.nombre as proveedor,
              A.correo_electronico,
              A.persona_contacto as contacto,
              A.telefono,
              B.nombre as producto,
              B.precio
             from proveedores as A 
            left join productos_sin_fk as B
            on B.proveedor_id = A.id;

--right join
create view vista_prov_prod_right_join as
       select A.nombre as proveedor,
              A.correo_electronico,
              A.persona_contacto as contacto,
              A.telefono,
              B.nombre as producto,
              B.precio
             from proveedores as A 
            right join productos_sin_fk as B
            on B.proveedor_id = A.id;

            --full join
            create view vista_prov_prod_full_join as
           select A.nombre as proveedor,
              A.correo_electronico,
              A.persona_contacto as contacto,
              A.telefono,
              B.nombre as producto,
              B.precio   
             from proveedores as A 
            left join productos_sin_fk as B
            on B.proveedor_id = A.id
            union
          select A.nombre as proveedor,
              A.correo_electronico,
              A.persona_contacto as contacto,
              A.telefono,
              B.nombre as producto,
              B.precio
             from proveedores as A 
            right join productos_sin_fk as B
            on B.proveedor_id = A.id;



 --creacion de un tipo de dato

 create Type profesion as enum('SALUD','EDUCACION','INGENIERIA','ECONOMIA','SEGURIDAD','RECREACION','DEPORTE','OTRA');

--creacion de tipo de datos 

create table personas(
    id serial,
    doc char(1), 
    cedula integer,
    nombre varchar(80),
    apellido varchar(80),
    direccion text,
    actividad profesion Default 'OTRA',
    correo_electronico varchar(80),
    fecha_nacimiento date);


    insert into personas(doc,cedula,nombre,apellido,direccion,actividad,correo_electronico,fecha_nacimiento) 
values 
('V',1234,'ANA','VASQUEZ','SANTA FE','ECONOMIA','av@gmail.com','1960-08-15'),
('E',8100,'PEDRO','ALMODOVAR','CARICUAO','DEPORTE','pa@gmail.com','1950-09-01'),
('P',9100,'SARA','SUAREZ','CHACAITO','SALUD','ss@hotmail.com','1990-06-20'),
('V',5678,'YOLANDA','TORTOZA','CATIA LA MAR','EDUCACION','yt@gmail.com','1978-10-15');


    insert into personas(doc,cedula,nombre,apellido,direccion,correo_electronico,fecha_nacimiento) 
values ('V',9797,'LINDA','EVANS','LA CASTELLANA','Le@gmail.com','1960-08-15');




ERROR:  error de sintaxis en o cerca de «9797»
LINE 2: values ('V'9797,'LINDA','EVANS','LA CASTELLANA','Le@gmail.co..