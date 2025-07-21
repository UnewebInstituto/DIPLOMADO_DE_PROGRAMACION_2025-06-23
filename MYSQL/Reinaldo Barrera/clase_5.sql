-- DISTINCT
select distinct producto, sum(existencia) from vista_prov_pro_02;

MariaDB [bd_reinaldo_20250714]> select distinct producto, sum(existencia) from vista_prov_pro_02;
+----------+-----------------+
| producto | sum(existencia) |
+----------+-----------------+
| NEVERA   |             107 |
+----------+-----------------+
1 row in set (0.000 sec)
------------------------------------------------------------------------------

--PRUEBA 01

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
-------------------------------------------------------------------------------

--GROUP BY (PERMITE AGRUPAR POR UN CAMPO)
select distinct producto, sum(existencia) from vista_prov_pro_02
group by producto;

--RESULTADO
MariaDB [bd_reinaldo_20250714]> select distinct producto, sum(existencia) from vista_prov_pro_02
    -> group by producto;
+------------------+-----------------+
| producto         | sum(existencia) |
+------------------+-----------------+
| COCINA DE GAS    |              30 |
| COCINA ELECTRICA |              10 |
| CONGELADOR       |              14 |
| HORNO ELECTRICO  |               3 |
| LAVADORA         |               6 |
| LAVADORA 10KG    |              23 |
| NEVERA           |              21 |
+------------------+-----------------+
7 rows in set (0.001 sec)
----------------------------------------------------------------------------

--SUMATORIA DE LA EXISTENCIA QUE ME DE EL PRECIO
select distinct producto, sum(existencia) AS existencia,
min(precio) as precio_minimo,
max(precio) as precio_maximo,
avg(precio) as precio_promedio from vista_prov_pro_02
group by producto;

select distinct producto, sum(existencia) AS existencia,
min(precio) as precio_minimo,
max(precio) as precio_maximo,
ROUND(avg(precio),2) as precio_promedio from vista_prov_pro_02
group by producto;


--------------------------------------------------------------------

select proveedor, sum(existencia) from vista_prov_pro_02 group by proveedor;

----COMBINACION DE GROUP BY Y DISTINCT


create view vista_prod_inventario as 
select distinct producto, sum(existencia)
from vista_prov_pro_02 
group by producto;

create view vista_prod_resumen as 
select distinct producto, sum(existencia),
min(precio) as precio_minimo,
max(precio) as precio_maximo,
ROUND(avg(precio),2) as precio_promedio
from vista_prov_pro_02 
group by proveedor;

create view vista_prov_inventario as 
select distinct proveedor, sum(existencia)
from vista_prov_pro_02 
group by proveedor;

--------------------------------------------------------------------------}

-- ORDENAMIENTO 
--CLASULA ORDER BY ASC/DESC

--POR OMISION EL ORDENAMIENTO ES ASCENDENTE
create view vista_orden1 as
select producto,proveedor,precio,existencia from vista_prov_pro_02 order by producto;

--POR OMISION EL ORDENAMIENTO ES DESCENDENTE
create view vista_orden2 as
select producto,proveedor,precio,existencia from vista_prov_pro_02 order by precio desc;

-- COMBINANDO 2 CAMPOS EN LA OPERACION DE CONSULTA
--ORDENAMIENTO DE MANERA DESCENDENTE
create view vista_orden3 as
select producto,proveedor,precio,existencia from vista_prov_pro_02 order by precio desc, producto asc;

-------------------------------------------------------------------------

