-- DISTINCT
-- PRUEBA 1
SELECT DISTINCT producto FROM vista_prov_prod_02;

-- GROUP BY (PERMITE AGRUPAR POR UN CAMPO)
SELECT DISTINCT producto, sum(existencia) 
FROM vista_prov_prod_02
GROUP BY producto;

-- Combinación de distinct y group by
SELECT DISTINCT producto, 
sum(existencia) as existencia,
min(precio) as precio_minimo,
max(precio) as precio_maximo,
round(avg(precio),2) as precio_promedio
FROM vista_prov_prod_02
GROUP BY producto;

-- Resumen basado en group by
SELECT proveedor, sum(existencia) 
FROM vista_prov_prod_02
GROUP BY proveedor;

-- vistas de datos agrupados
create view vista_prod_inventario as
SELECT DISTINCT producto, sum(existencia) 
FROM vista_prov_prod_02
GROUP BY producto;

create view vista_prov_inventario as
SELECT proveedor, sum(existencia) 
FROM vista_prov_prod_02
GROUP BY proveedor;

create view vista_prod_resumen as
SELECT DISTINCT producto, 
sum(existencia) as existencia,
min(precio) as precio_minimo,
max(precio) as precio_maximo,
round(avg(precio),2) as precio_promedio
FROM vista_prov_prod_02
GROUP BY producto;

-- Ordenamiento
-- clausula order by asc/desc

-- Por omisión el ordenamiento es ascendente
select producto, proveedor, precio, existencia
from vista_prov_prod_02
order by producto;

-- Ordenamiento de manera descendente
select producto, proveedor, precio, existencia
from vista_prov_prod_02
order by precio desc;

-- Combinando 2 campos en la operación de consulta
-- Ordenamiento de manera descendente
select producto, proveedor, precio, existencia
from vista_prov_prod_02
order by precio desc, producto asc;

-- vistas a partir de las consultas
-- Por omisión el ordenamiento es ascendente
create view vista_orden1 as 
select producto, proveedor, precio, existencia
from vista_prov_prod_02
order by producto;

-- Ordenamiento de manera descendente
create view vista_orden2 as 
select producto, proveedor, precio, existencia
from vista_prov_prod_02
order by precio desc;

-- Combinando 2 campos en la operación de consulta
-- Ordenamiento de manera descendente
create view vista_orden3 as 
select producto, proveedor, precio, existencia
from vista_prov_prod_02
order by precio desc, producto asc;




