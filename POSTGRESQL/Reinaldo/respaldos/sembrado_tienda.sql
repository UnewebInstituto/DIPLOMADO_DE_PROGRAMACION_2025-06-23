insert into usuarios (nombre,apellido,telefono,correo)
values
('ANA','VASQUEZ','{"041287594975","042487353454"}','{"av@gmail.com","av@hotmail.com"}'),
('PEDRO','ALMODOVAR','{"0412346758739","04140986779","0412876947333"}','{"pa@gmail.com","pa@hotmail.com"}'),
('SARA','SUAREZ','{"04267866559"}','{"ss@hotmail.com", "ss@gmail.com"}'),
('YOLANDA','TORTOZA','{"041454773639","041608857234"}','{"yt@gmail.com","yt@hotmail.com"}');


-- ESTABLECER ROLES
insert into roles(nombre) values
('administrador'),
('visitante');

insert into usuarios_roles(usuario_id, rol_id) 
values
(1, 1), 
(2, 2), 
(3, 2),
(4, 2); 

insert into categorias(nombre)
values
('calzado'),
('limpieza'),
('higiene'),
('lenceria'),
('otros');
