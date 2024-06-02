USE Inmobiliaria
GO

INSERT INTO LOCALIDADES (NOMBRE) VALUES
('25 de Mayo'),
('Adolfo Alsina'),
('Almirante Brown'),
('America'),
('Arrecifes'),
('Ayacucho'),
('Azul'),
('Bah�a Blanca'),
('Balcarce'),
('Baradero'),
('Benito Ju�rez'),
('Berazategui'),
('Bol�var'),
('Bragado'),
('Campana'),
('Ca�uelas'),
('Capit�n Sarmiento'),
('Carlos Casares'),
('Carlos Tejedor'),
('Carmen de Areco'),
('Carmen de Patagones'),
('Casbas'),
('Castelli'),
('Chacabuco'),
('Chascom�s'),
('Chivilcoy'),
('Ciudad Aut�noma de Buenos Aires'),
('Col�n'),
('Coronel Dorrego'),
('Coronel Pringles'),
('Coronel Rosales'),
('Coronel Su�rez'),
('Daireaux'),
('Dolores'),
('Ensenada'),
('Escobar'),
('Esteban Echeverr�a'),
('Exaltaci�n de la Cruz'),
('Ezeiza'),
('Florencio Varela'),
('Florentino Ameghino'),
('General Alvarado'),
('General Alvear'),
('General Belgrano'),
('General Guido'),
('General La Madrid'),
('General Las Heras'),
('General Lavalle'),
('General Madariaga'),
('General Paz'),
('General Pinto'),
('General Pueyrred�n'),
('General Rodr�guez'),
('General San Mart�n'),
('General Viamonte'),
('General Villegas'),
('Gonzales Chaves'),
('Guamin�'),
('Hip�lito Yrigoyen'),
('Hurlingham'),
('Ituzaing�'),
('Jos� C. Paz'),
('Jun�n'),
('La Costa'),
('La Plata'),
('La Matanza'),
('Lan�s'),
('Laprida'),
('Las Flores'),
('Leandro N. Alem'),
('Lezama'),
('Lincoln'),
('Lober�a'),
('Lobos'),
('Lomas de Zamora'),
('Luj�n'),
('Magdalena'),
('Maip�'),
('Malvinas Argentinas'),
('Mar Chiquita'),
('Mar del Plata'),
('Marcos Paz'),
('Mercedes'),
('Merlo'),
('Monte'),
('Monte Hermoso'),
('Moreno'),
('Mor�n'),
('Navarro'),
('Necochea'),
('Nueve de Julio'),
('Olavarr�a'),
('Partido de la Costa'),
('Patagones'),
('Pehuaj�'),
('Pellegrini'),
('Pergamino'),
('Pila'),
('Pilar'),
('Pinamar'),
('Presidente Per�n'),
('Puan'),
('Punta Indio'),
('Quilmes'),
('Ramallo'),
('Rauch'),
('Rivadavia'),
('Rojas'),
('Roque P�rez'),
('Saavedra'),
('Saladillo'),
('Salliquel�'),
('Salto'),
('San Andr�s de Giles'),
('San Antonio de Areco'),
('San Cayetano'),
('San Fernando'),
('San Isidro'),
('San Miguel'),
('San Nicol�s'),
('San Pedro'),
('San Vicente'),
('Suipacha'),
('Tandil'),
('Tapalqu�'),
('Tigre'),
('Tordillo'),
('Tornquist'),
('Trenque Lauquen'),
('Tres Arroyos'),
('Tres de Febrero'),
('Tres Lomas'),
('Vicente L�pez'),
('Villa Gesell'),
('Villarino'),
('Z�rate');

INSERT INTO UBICACIONES(DIRECCION, IDLOCALIDAD) VALUES
('Calle 1', 64),
('Avenida Col�n 1234', 65),
('Calle Rivadavia 567', 27),
('Avenida Espa�a 789', 27),
('Calle San Mart�n 101', 133),
('Avenida del Libertador 202', 27),
('Calle Lavalle 303', 126),
('Coronel Pringles 404', 88),
('Calle Belgrano 505', 88),
('Avenida de Mayo 606', 27);

-- Insertando datos en la tabla TIPOS
INSERT INTO TIPOS (NOMBRE) VALUES
('Casa'),
('Departamento'),
('PH'),
('Terreno'),
('Oficina');

-- Insertando datos en la tabla DISPONIBILIDADES--
INSERT INTO DISPONIBILIDADES (NOMBRE) VALUES
('Venta'),
('Alquiler');

-- Insertando datos en la tabla USUARIOS
INSERT INTO USUARIOS (EMAIL, CONTRASE�A, NOMBRE, APELLIDO, TELEFONO, DNI) VALUES
('juanperez@gmail.com', 'password123', 'Juan', 'Perez', '1122334455', '32551481'),
('mariagonzalez@gmail.com', 'password456', 'Maria', 'Gonzalez', '1122334456', '36942764'),
('pedrolopez@gmail.com', 'password789', 'Pedro', 'Lopez', '1122334457', '10801517'),
('juanchitomei@hotmail.com', 'password432', 'Juan', 'Tomei', '1524803439', '41812337'); 

-- Insertando datos en la tabla VENDEDORES
INSERT INTO VENDEDORES (IDUSUARIO) VALUES
(1),
(2)

-- Insertando datos en la tabla INMUEBLES
INSERT INTO INMUEBLES (IDTIPO, IDVENDEDOR, IDUBICACION, METROS2, METROS2CUBIERTOS, IDDISPONIBILIDAD, AMBIENTES, BA�OS, PRECIO, DESCRIPCION, ESTADO) VALUES
(1, 1, 1, 200, 150, 1, 4, 2, 250000, 'Casa amplia con jard�n', 1),
(2, 1, 2, 80, 80, 2, 3, 1, 15000, 'Departamento c�ntrico', 1),
(3, 1, 3, 120, 120, 2, 5, 2, 20000, 'PH con patio', 1),
(1, 2, 4, 250, 200, 1, 5, 3, 300000, 'Casa amplia con jard�n', 1),
(4, 2, 8, 250, 0, 1, 0, 0, 100000, 'Terreno sin edificar', 1);

-- Insertando datos en la tabla IMAGENES
INSERT INTO IMAGENES (IDPROPIEDAD, URLIMAGEN, DESCRIPCION) VALUES
(1, 'https://static1.sosiva451.com/82877651/b5cd6092-0621-4de0-8cb4-728eec471010_u_small.jpg', 'Vista frontal de la casa'),
(1, 'https://static1.sosiva451.com/82877651/e4c82137-8c04-4536-b294-ab604c90c876_u_large.jpg', 'Jard�n de la casa'),
(2, 'https://static1.sosiva451.com/68988151/376c557b-75d5-463c-8809-3c3855584243_u_large.jpg', 'Sala de estar del departamento'),
(3, 'https://static1.sosiva451.com/61149541/0b62c7fe-91a4-4314-b6cc-15ac1d257165_u_large.jpg', 'Patio del PH'),
(5, 'https://static1.sosiva451.com/15905221/05531471-d235-4fa6-a3f1-3f0d1660b787_u_medium.jpg', 'Terreno');

SELECT u.DIRECCION, l.NOMBRE, us.NOMBRE, us.APELLIDO, d.NOMBRE, i.AMBIENTES, i.BA�OS, i.DESCRIPCION, i.ESTADO,i.precio FROM INMUEBLES i
INNER JOIN TIPOS t ON t.ID=i.IDTIPO
INNER JOIN DISPONIBILIDADES d ON d.ID=i.IDDISPONIBILIDAD
INNER JOIN UBICACIONES u ON u.ID=i.IDUBICACION
INNER JOIN VENDEDORES v ON v.ID=i.IDVENDEDOR
INNER JOIN USUARIOS us ON us.ID=v.IDUSUARIO
INNER JOIN LOCALIDADES l ON l.ID=u.IDLOCALIDAD
GO

CREATE VIEW VW_DatosInmuebles AS
(SELECT i.ID, t.Nombre AS TIPO, us.NOMBRE, us.APELLIDO, u.DIRECCION, i.METROS2, i.METROS2CUBIERTOS, d.NOMBRE AS DISPONIBILIDAD, i.AMBIENTES, i.BA�OS, i.PRECIO, i.DESCRIPCION, i.ESTADO
FROM INMUEBLES i
INNER JOIN TIPOS t ON t.ID=i.IDTIPO
INNER JOIN DISPONIBILIDADES d ON d.ID=i.IDDISPONIBILIDAD
INNER JOIN UBICACIONES u ON u.ID=i.IDUBICACION
INNER JOIN VENDEDORES v ON v.ID=i.IDVENDEDOR
INNER JOIN USUARIOS us ON us.ID=v.IDUSUARIO
INNER JOIN LOCALIDADES l ON l.ID=u.IDLOCALIDAD)
GO