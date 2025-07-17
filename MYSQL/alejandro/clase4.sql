--carga de datos para proveedores y productos
INSERT INTO proveedores(nombre,direccion,correo_electronico,telefono,persona_contacto)
VALUES("GENERAL ELECTRIC","AV.LECUNA","Info@ge.com","0212-5431234","ANA VASQUEZ"),
("WHIRPOOL","AV.ROMULO GALLEGOS","info@whirpool.com","0212-9871234","YOLANDATORTOZA"),
("ELECTROLUX","AV.PPAL.DE LAS MERCEDES","info@electrolux.com","0212-2671234","NELLY CONTRERAS"),
("LG","AV.SAN MARTIN","info@lg.com","0212-4431234","MARIA ROMERO");

INSERT INTO productos(proveedor_id, nombre, precio, existencia)
VALUE 
(1,"NEVERA",500.25,6),
(1,"CONGELADOR",250.75,3),
(1,"LAVADORA 10K",300,8),
(1,"COCINA A GAS",120,10),
(2,"CONGELADOR",275,5),
(2,"HORNO ELECTRICO",450,3),
(2,"LAVADORA 10K",295,12),
(2,"COCINA ELECTRICA",350,2),
(3,"NEVERA",450,3),
(3,"LAVADORA",380,6),
(3,"COCINA A GAS",230,12),
(3,"COCINA ELECTRICA",390,8),
(4,"NEVERA",500.75,3),
(4,"CONGELADOR",249.99,6),
(4,"LAVADORA 10K",310,3),
(4,"COCINA A GAS",170,8);

--pruebas de interidad de la asociacion entre las tablas
--(1) añadir un registro en la tabla productos,cuyo proveedor_id
--no existe en la tabal de proveedores(5)
INSERT INTO productos(proveedor_id, nombre, precio, existencia)
VALUES 
(5,"NEVERA",500.25,6);
--(2)se intentara borrar un registrode la tabla proveedores(padre),dado que existen registros independientes(hijo) en la tabla productos
delete from proveedores where id = 1;
--(3) si permitiraañadir un nuevo registro en proovedores
insert into proveedores(nombre,direccion,correo_electronico,telefono,persona_contacto)
values ("DAMASCO","AV.FCO.MIRANDA","info@damasco,com","0212-2341234","RORAIMA ROJAS");
--una vez creado el id en la tabla padre(proveedores),es posible crear productos(tabal hija),que haga referencia a dicha entidad
INSERT INTO productos(proveedor_id, nombre, precio, existencia)
VALUES 
(5,"NEVERA",499.25,9);
--consulta combinada entre proveedores y productos

select proveedores.nombre,
       proveedores.persona_contacto,
       proveedores.telefono,
       productos.nombre,
       productos.precio
       from proveedores,productos
       where productos.proveedor_id = proveedores.id;


       insert into proveedores(nombre,direccion,correo_electronico,telefono,persona_contacto)
values ("HAIER","AV.PPL,DEL VALLE","info@haier.com","0212-6431234","SOFIA CHANG");

--consulta combinada entre proveedores y productos empleando inner join

select proveedores.nombre,
       proveedores.persona_contacto,
       proveedores.telefono,
       productos.nombre,
       productos.precio
       from proveedores
       inner join productos
       on  productos.proveedor_id = proveedores.id;

----consulta combinada entre proveedores y productos empleando left join

select proveedores.nombre,
       proveedores.persona_contacto,
       proveedores.telefono,
       productos.nombre,
       productos.precio
       from proveedores
       left join productos
       on  productos.proveedor_id = proveedores.id;

       ----consulta combinada entre proveedores y productos empleando right join

select proveedores.nombre,
       proveedores.persona_contacto,
       proveedores.telefono,
       productos.nombre,
       productos.precio
       from proveedores
       left join productos
       on  productos.proveedor_id = proveedores.id;

    create table productos_sin_fk(
    id integer auto_increment,
    proveedor_id integer,
    nombre varchar(80),
    precio numeric(13,2),
    existencia integer,
    primary key(id)
    );

INSERT INTO productos_sin_fk(proveedor_id, nombre, precio, existencia)
VALUE 
(1,"NEVERA",500.25,6),
(1,"CONGELADOR",250.75,3),
(1,"LAVADORA 10K",300,8),
(5,"COCINA A GAS",120,10),
(2,"CONGELADOR",275,5),
(2,"HORNO ELECTRICO",450,3),
(2,"LAVADORA 10K",295,12),
(6,"COCINA ELECTRICA",350,2),
(3,"NEVERA",450,3),
(3,"LAVADORA",380,6),
(3,"COCINA A GAS",230,12),
(7,"COCINA ELECTRICA",390,8),
(4,"NEVERA",500.75,3),
(4,"CONGELADOR",249.99,6),
(4,"LAVADORA 10K",310,3),
(8,"COCINA A GAS",170,8);

----consulta combinada entre proveedores y productos empleando full join

select proveedores.nombre,
       proveedores.persona_contacto,
       proveedores.telefono,
       productos_sin_fk.nombre,
       productos_sin_fk.precio
       from proveedores,productos_sin_fk;

       --full join
       select proveedores.nombre,
       proveedores.persona_contacto,
       proveedores.telefono,
       productos_sin_fk.nombre,
       productos_sin_fk.precio
       from proveedores
       left join productos_sin_fk
       on  productos_sin_fk.proveedor_id = proveedores.id
       union
        select proveedores.nombre,
       proveedores.persona_contacto,
       proveedores.telefono,
       productos_sin_fk.nombre,
       productos_sin_fk.precio
       from proveedores
       right join productos_sin_fk
       on  productos_sin_fk.proveedor_id = proveedores.id;
    -----------------------------------------------------------

insert into proveedores(nombre,direccion,correo_electronico,telefono,persona_contacto)
values ("SONY","AV.FCO,DE MIRANDA","info@SONY.com","0212-2431234","SUSANA MIR");




insert into proveedores( id,nombre,direccion,correo_electronico,telefono,persona_contacto)
values (9,"MABE","BOLEITA NORTE","info@MABE.com","0212-731234","NORMA 
GAINFA");

--consulta combinada entre proveedores y productos inner join
select A.nombre as proveedor,
       A.persona_contacto as contacto,
       A.telefono,
       B.nombre as producto,
       B.precio
       from proveedores as A 
       inner join productos as B
       on B.proveedor_id = A.id;

       --creasion de vistas 
       create view vista_prov_prod_01 AS
       select A.nombre as proveedor,
       A.persona_contacto as contacto,
       A.telefono,
       B.nombre as producto,
       B.precio
       from proveedores as A 
       inner join productos as B
       on B.proveedor_id = A.id;
       ------------------------------------
       create view vista_prov_prod_02 as
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


---columnas calculadas
SELECT sum(existencia) FROM vista_prov_prod_02;
--minimo
SELECT min(precio) FROM vista_prov_prod_02;
--maximo
SELECT max(precio) FROM vista_prov_prod_02;
--promedio
SELECT avg(precio) FROM vista_prov_prod_02;
--contar 
SELECT count(*) FROM vista_prov_prod_02;


---condicion en consultas

SELECT producto,precio,existencia FROM vista_prov_prod_02
WHERE producto = "NEVERA" or producto = "LAVADORA" or producto="CONGELADOR";

--equivalente
SELECT producto,precio,existencia FROM vista_prov_prod_02
WHERE producto in ("NEVERA" , "LAVADORA","CONGELADOR");

--opuesto de ambos casos anteriores
SELECT producto,precio,existencia FROM vista_prov_prod_02
WHERE not (producto = "NEVERA" or producto = "LAVADORA" or producto="CONGELADOR");

--equivalente
SELECT producto,precio,existencia FROM vista_prov_prod_02
WHERE producto not in ("NEVERA" , "LAVADORA","CONGELADOR");

--consulta de un intervalo o rango
SELECT producto, precio, existencia FROM vista_prov_prod_02
WHERE precio >= 200 and precio <= 500;

--equivalente

SELECT producto, precio, existencia FROM vista_prov_prod_02
WHERE precio BETWEEN 200 and 500;

--opuesto o negacion del anterior caso
SELECT producto, precio, existencia FROM vista_prov_prod_02
WHERE not (precio >= 200 and precio <= 500);

--equivalente segunda consulta
SELECT producto, precio, existencia FROM vista_prov_prod_02
WHERE  not (precio BETWEEN 200 and 500);

--consulta basada en parte del contenido
SELECT producto, precio, existencia FROM vista_prov_prod_02
WHERE producto like "%COCINA%";

--DIFERENCIAR NULL DE ESPACIO EN BLANCO
CREATE VIEW vista_prov_prod_null as
 select proveedores.nombre as proveedor,
       proveedores.persona_contacto as contacto,
       proveedores.telefono,
       productos_sin_fk.nombre as producto,
       productos_sin_fk.precio
       from proveedores
       left join productos_sin_fk
       on  productos_sin_fk.proveedor_id = proveedores.id
       union
        select proveedores.nombre as proveedor,
       proveedores.persona_contacto as contacto,
       proveedores.telefono,
       productos_sin_fk.nombre as producto,
       productos_sin_fk.precio
       from proveedores
       right join productos_sin_fk
       on  productos_sin_fk.proveedor_id = proveedores.id;
        
        SELECT * from vista_prov_prod_null WHERE proveedor is null;



        --se ingrsa producto cuyo nombre queda en blanco
 INSERT INTO productos_sin_fk(proveedor_id, nombre, precio, existencia)
VALUE(8,"",1.59,100);

--mostrar valores unicos
SELECT producto, precio, existencia from vista_prov_prod_02;
SELECT DISTINCT producto from vista_prov_prod_02;

--equivalente

GROUP BY
 select producto from vista_prov_prod_02 group by producto;


