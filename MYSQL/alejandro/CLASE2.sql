--visualizar las tablas contenidas en las bases de DATOS
show tables;
--visualizar estructura de tabla
describe personas;
--ver contenido de una tabla
srlect * from personas;
--borrar columna de una tabla
alter table persona drop column sexo;
--consultar registro rspecifico
select * from personas where nro = 1234;
--borrar el registro especifico de una tabala
delete from personas where nro= 1234;
--borrar todos los registros de una tabala
--1ra forma: esta opcion rinicia el contador auto_increment
truncate personas;
--2da forma
delete personas;
--operaciones basicas de una tabla:
--conocido como crud
insert(create o crear)
select(read o consultar)
update(update o actualizar)
delete(delete o borrar)

--creacion de tablas indexadas  con campo auto_increment 
-- se va a adaptar la definicin de la tabla personas
-- el tipi de dato auto_increment es un valor de tipo entero enumerado
-- se va a ir incrementando automaticamente,cada vez que se ingrese un nuevo registro
--se añade el campo id,como clave primaria
create table personas1(
    id integer auto_increment,
    doc char(1), 
    nro integer,
    nombre varchar(80),
    apellido varchar(80),
    direccion text,
    correo_electronico varchar(80),
    fecha_nacimiento date,
    primary key(id));

    --como borrar una tabla de la base de datos
    drop table personas;

insert into personas1(doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento) 
values 
('V',1234,'ANA','VASQUEZ','SANTA FE','av@gmail.com','1960-08-15'),
('E',8100,'PEDRO','ALMODOVAR','CARICUAO','pa@gmail.com','1950-09-01'),
('P',9100,'SARA','SUAREZ','CHACAITO','ss@hotmail.com','1990-06-20'),
('V',5678,'YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','1978-10-15');

--borrar todos los registros cuyo id sea mayor a 4
delete from personas where id >4;
-- dado que el id , es clave primaria no admite duplicidad de registro


insert into personas1(id,doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento) 
values 
(1,'V',9012,'nelly','contreras','la vega','nc@gmail.com','1968-08-16');
-----------------------------------------------------------------------




insert into personas1(doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento) 
values 
('V',9012,'nelly','contreras','la vega','nc@gmail.com','1968-08-16');
  
  -- definicion de claves unicas
  --se dewfine como clave unica la combinacion de doc,nro que conforman la identificacion de la persona
  --correo electronico sera clave unica


create table personas2(
    id integer auto_increment,
    doc char(1), 
    nro integer,
    nombre varchar(80),
    apellido varchar(80),
    direccion text,
    correo_electronico varchar(80),
    fecha_nacimiento date,
    primary key(id),
    UNIQUE(doc,nro),
    UNIQUE(correo_electronico));

    insert into personas2(doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento) 
values 
('V',1234,'ANA','VASQUEZ','SANTA FE','av@gmail.com','1960-08-15'),
('E',8100,'PEDRO','ALMODOVAR','CARICUAO','pa@gmail.com','1950-09-01'),
('P',9100,'SARA','SUAREZ','CHACAITO','ss@hotmail.com','1990-06-20'),
('V',5678,'YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','1978-10-15');

--pruebas de integridad de datos
--cedula repetida
    insert into personas2(doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento) 
values 
('V',1234,'nelly','contreras','la vega','nc@gmail.com','1960-08-15');

--correo electronico repetid0

    insert into personas2(doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento) 
values 
('V',9012,'nelly','contreras','la vega','av@gmail.com','1960-08-15');
--caso enque funciona

--caso 3 : no hay colision con los campos de clave primaria y clave unica
 insert into personas2(doc,nro,nombre,apellido,direccion,correo_electronico,fecha_nacimiento) 
values 
('V',9012,'nelly','contreras','la vega','nc@gmail.com','1960-08-15');

--comando para consultar detalles de tabla
show create table personas2;

---cambio de motor de la base de datos
ALTER TABLE personas2  engine MyIsam;

--asociacion entre tablas
--tipo 1 a muchos

create table proveedores(
    id integer auto_increment,nombre varchar(80),
    direccion text,
    correo_electronico varchar(80),
    telefono varchar(80), 
    persona_contacto varchar(80),
    primary key (id),
    unique(correo_electronico)

);


create table productos(
    id integer auto_increment,
    proveedor_id integer,
    nombre varchar(80),
    precio numeric(13,2),
    existencia integer,
    primary key(id),
    FOREIGN key(proveedor_id) REFERENCES proveedores(id)
);



