INSERT INTO usuarios(nombre, apellido, telefono, correo)
values
('ANA'    ,'VASQUEZ'   ,'{"0414-1234567","0212-9998877"}','{"av@gmail.com","av@hotmail.com"}'),
('PEDRO'  ,'ALMODOVAR' ,'{"0424-9876543","0212-5556644"}','{"pa@gmail.com","pa@hotmail.com"}'),
('SARA'   ,'SUAREZ'    ,'{"0212-6782345"}','{"ss@hotmail.com","ss@gmail.com"}'),
('YOLANDA','TORTOZA'   ,'{"0412-9996543","0212-4563728"}','{"yt@gmail.com","yt@gmail.com"}');

INSERT INTO roles(nombre) values
('administrador'),
('visitante');

insert into usuarios_roles(usuario_id, rol_id)
values
(1,1),
(2,2),
(3,2),
(4,2);

insert into categorias(nombre)
values
('CALZADO'),
('HIGIENE'),
('LIMPIEZA'),
('LENCERIA'),
('OTROS');

