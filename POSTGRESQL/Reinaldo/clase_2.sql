create table contactos2(
    id integer default nextval('contactos1_id_seq'::regclass) primary key,
    nombre varchar(80),
    apellido varchar(80),
    fecha_nacimiento date,
    direccion text,
    telefono varchar(30)[],
    correo_electronico varchar(80) unique
);


--1era forma de ingresar datos en un campo del tipo arreglo

insert into contactos2(nombre,apellido,fecha_nacimiento,direccion,telefono,correo_electronico)
values
('ANA','VASQUEZ','1960-08-15','SANTA FE','{"041287594975","042487353454"}','av@gmail.com'),
('PEDRO','ALMODOVAR','1950-09-01','CARICUAO','{"0412346758739","04140986779","0412876947333"}','pa@gmail.com'),
('SARA','SUAREZ','1990-06-20','CHACAITO','{"04267866559"}','ss@hotmail.com'),
('YOLANDA','TORTOZA','1978-10-15','CATIA LA MAR','{"041454773639","041608857234"}','yt@gmail.com');


-- 2da forma de ingresar datos en un campo del tipo arreglo

insert into contactos2(nombre,apellido,fecha_nacimiento,direccion,telefono,correo_electronico)
values
('MARLENE','FERNANDES','1976-09-20','AV. LECUNA', ARRAY['0212-09857583','0426-94736284'],'MF@Gmai.com'),
('LIBIA','COLS','1980-11-15','GUARENAS',ARRAY['0414-9347424','0426-97364732'],'LC@gmail.com');

--todas las operaciones de crud, son estandar en sql
--insert, select, update, delete
select * from contactos2;


-- acceder a los valores contenidos en un campo del tipo arreglo

select nombre as "Nombre", apellido as "Apellido",
telefono[1] as "telefono habitación",
telefono[2] as "telefono ofi.",
telefono[3] as "telefono cel",
correo_electronico as "correo electronico"
from contactos2;

--asosiacion entre tablas 
create sequence proveedores_id_seq; 

create table proveedores(
  id integer default nextval('proveedores_id_seq'::regclass) primary key,
  nombre varchar(80),
  direccion text,
  correo_electronico varchar(80) unique,
  telefono varchar(80),
  persona_contacto varchar(80)
);


--2da forma de declaracion 
create table proveedores(
  id serial primary key,
  nombre varchar(80),
  direccion text,
  correo_electronico varchar(80) unique,
  telefono varchar(80),
  persona_contacto varchar(80),
);




create table productos(
  id serial primary key,
  proveedor_id integer,
  nombre varchar(80),
  precio numeric(13,2),
  existencia integer,
  foreign key(proveedor_id) references proveedores(id)
);

ERROR:  no existe la relación «proveedores_id_seq::regclass»
LINE 2:   id integer default nextval('proveedores_id_seq::regclass')


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