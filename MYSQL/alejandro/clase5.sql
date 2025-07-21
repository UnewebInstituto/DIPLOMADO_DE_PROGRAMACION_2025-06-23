--distict
--prueba1
SELECT DISTINCT producto FROM vista_prov_prod_02;

--group by(permite agrupar por un campo)
SELECT DISTINCT producto, sum(existencia)
FROM vista_prov_prod_02
GROUP BY producto;

--combinacion de disctinct y group by
SELECT DISTINCT producto,
 sum(existencia),
 min(precio) as asprecio_minimo,
 max(precio) as precio_maximo,
  round(avg(precio),2) as precio_promedio
FROM vista_prov_prod_02
GROUP BY producto;

--resumen basado en group by
CREATE VIEW vista_prov_inventario as 
SELECT  proveedor, sum(existencia)
FROM vista_prov_prod_02
GROUP BY proveedor;

 --vista de datos guardados
 CREATE VIEW vista_prod_inventario as 
 SELECT DISTINCT proveedor, sum(existencia)
 FROM vista_prov_prod_02
 GROUP BY producto;

CREATE VIEW vista_prod_resumen AS
SELECT DISTINCT producto,
sum(existencia) as existencia,
 min(precio) as precio_minimo,
 max(precio) as precio_maximo,
  round(avg(precio),2) as precio_promedio
FROM vista_prov_prod_02
GROUP BY producto;
GROUP BY producto;

--ordenamiento--

--clausula order by ascendente
SELECT producto, proveedor, precio,existencia
FROM vista_prov_prod_02
ORDER BY producto;

--ordenamiento de forma descendiente
SELECT producto, proveedor,precio,existencia
FROM vista_prov_prod_02
ORDER BY precio DESC;



--vistas apartir de consultas--
create VIEW vista_orde1 as
SELECT producto, proveedor, precio,existencia
FROM vista_prov_prod_02
ORDER BY producto;

--ordenamiento de forma descendiente
create VIEW vista_orde2 as
SELECT producto, proveedor,precio,existencia
FROM vista_prov_prod_02
ORDER BY precio DESC;



--combinado asc/desc
create VIEW vista_orde3 as
SELECT producto, proveedor,precio,existencia
FROM vista_prov_prod_02
ORDER BY precio DESC, producto asc;