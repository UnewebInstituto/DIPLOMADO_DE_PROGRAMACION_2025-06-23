--creacion de campos tipo arreglo
create table contactos2(
    id integer default nextval('contactos1_id_seq'::regclass) primary key,
    nombre varchar(80),
    apellido varchar(80),
    fecha_nacimiento date,
    direccion text,
    telefono varchar(30)[],
    correo_electronico varchar(80) unique

);


--primera forma de ingresar datos en un campo del tipo arreglo
insert into contactos2(nombre, apellido, fecha_nacimiento, direccion, telefono, correo_electronico) values 
('ANA'    ,'VASQUEZ'  ,'1960-08-15','SANTA FE'    ,'{"0414-1234567","0212-9988777"}','av@gmail.com'),
('PEDRO'  ,'ALMODOVAR','1950-09-01','CARICUAO'    ,'{"0424-9876543","0212-998666"}','pa@gmail.com'),
('SARA'   ,'SUAREZ'   ,'1990-06-20','CHACAITO'    ,'{"0212-6782345","0212-998234"}','ss@hotmail.com'),
('YOLANDA','TORTOZA'  ,'1978-10-15','CATIA LA MAR','{"0412-9996543","0212-998333"}','yt@gmail.com');


--2da forma
insert into contactos2(nombre, apellido, fecha_nacimiento, direccion, telefono, correo_electronico) values 
('MARLENE','FERNANDES','1976-08-20','AV LECUNA',ARRAY['0414-123111','0212-998222'],'M@gmail.com'),
('LIBIA' ,'COLS','1980-11-15','GUARENAS',ARRAY['0424-987444','0212-998222'],'La@gmail.com');

--insert,select,update,delete

select * from contactos2;

--accdeder a los valores contenidos enun campo del tipo arreglo

select nombre as "nombre",apellido as "apellido",
       telefono[1] as "telefono hab",
       telefono[2] as "telefono ofi",
       telefono[3] as  "telefono cel",
       correo_electronico as "correo electronico"
       from contactos2;

       --asosiacion entre tablas 

--1ra forma
create SEQUENCE proveedores_id_seq;
       
create table proveedores(
    id integer default nextval('proveedores_id_seq'::regclass) primary key,
    nombre varchar(80),
    direccion text,
    correo_electronico varchar(80) UNIQUE,
    telefono varchar(80), 
    persona_contacto varchar(80),
    

);

--otra forma de declaracion de proveedores

       
create table proveedores(
    id serial primary key,
    nombre varchar(80),
    direccion text,
    correo_electronico varchar(80) unique,
    telefono varchar(80), 
    persona_contacto varchar(80)
);


create table productos(
    id serial primary key,
    proveedor_id integer,
    nombre varchar(80),
    precio numeric(13,2),
    existencia integer,
    FOREIGN key(proveedor_id) REFERENCES proveedores(id)
);

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






