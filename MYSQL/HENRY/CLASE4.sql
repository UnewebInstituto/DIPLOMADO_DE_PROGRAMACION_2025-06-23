insert into proveedores(nombre, direccion, correo_electronico, telefono, persona_contacto)
values
('SONY','AV. FCO. DE MIRANDA', 'info@sony.com', '0212-2431234','SUSANA MIR');

insert into proveedores(id, nombre, direccion, correo_electronico, telefono, persona_contacto)
values
(9,'MABE','BOLEITA NORTE', 'info@mabe.com', '0212-7431234','NORMA GAINFA');

-- Uso de alias

-- Consulta combinada entre proveedores y productos empleando inner join
select A.nombre as proveedor,
       A.persona_contacto as contacto,
       A.telefono,
       B.nombre as producto,
       B.precio
       from proveedores as A
       inner join productos as B
       on B.proveedor_id = A.id;

-- Creación de vistas
create view vista_prov_prod_01 as 
select A.nombre as proveedor,
       A.persona_contacto as contacto,
       A.telefono,
       B.nombre as producto,
       B.precio
       from proveedores as A
       inner join productos as B
       on B.proveedor_id = A.id;

-- Resultado
MariaDB [bd_henry_20250714]> create view vista_prov_prod_01 as
    -> select A.nombre as proveedor,
    ->        A.persona_contacto as contacto,
    ->        A.telefono,
    ->        B.nombre as producto,
    ->        B.precio
    ->        from proveedores as A
    ->        inner join productos as B
    ->        on B.proveedor_id = A.id;
Query OK, 0 rows affected (0.005 sec)
---------------------------------------------------------
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

-- columnas calculadas
-- sumatoria
select sum(existencia) from vista_prov_prod_02;
-- mínimo
select min(precio) from vista_prov_prod_02;
-- máximo
select max(precio) from vista_prov_prod_02;
-- promedio
select avg(precio) from vista_prov_prod_02;
-- contar
select count(*) from vista_prov_prod_02;

-- Condición en consultas
-- lista
SELECT producto, precio, existencia from vista_prov_prod_02
where producto = 'NEVERA' or producto = 'LAVADORA' or producto = 'CONGELADOR';

-- Equivalente
SELECT producto, precio, existencia from vista_prov_prod_02
where producto in ('NEVERA', 'LAVADORA', 'CONGELADOR');

-- Opuesto de ambos casos anteriores
-- Negación
SELECT producto, precio, existencia from vista_prov_prod_02
where not(producto = 'NEVERA' or producto = 'LAVADORA' or producto = 'CONGELADOR');

-- Equivalente de la negación anterior
SELECT producto, precio, existencia from vista_prov_prod_02
where producto not in ('NEVERA', 'LAVADORA', 'CONGELADOR');

-- Consulta de un intervalo o rango
SELECT producto, precio, existencia from vista_prov_prod_02
where precio >= 200 and precio <= 500;

-- Equivalente
SELECT producto, precio, existencia from vista_prov_prod_02
where precio between 200 and 500;

-- Opuesto o negación de lo anterior
-- Consulta de un intervalo o rango
SELECT producto, precio, existencia from vista_prov_prod_02
where not (precio >= 200 and precio <= 500);

-- Equivalente
SELECT producto, precio, existencia from vista_prov_prod_02
where not (precio between 200 and 500);

-- Consulta basada en parte del contenido
SELECT producto, precio, existencia from vista_prov_prod_02 
where producto like '%COCINA%';

-- DIFERENCIAR NULL DE ESPACIO EN BLANCO

create view vista_prov_prod_null as
select proveedores.nombre as proveedor,
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

select * from vista_prov_prod_null where proveedor is null;

-- Se ingresa producto, cuyo nombre queda en blanco
insert into productos_sin_fk(proveedor_id, nombre, precio, existencia)
values
(8,'',1.50,100);

-- mostrar valores únicos
SELECT producto, precio, existencia FROM VISTA_PROV_PROD_02;

select DISTINCT producto FROM VISTA_PROV_PROD_02;

-- EQUIVALENTE

GROUP BY

select producto from VISTA_PROV_PROD_02 group by producto;


