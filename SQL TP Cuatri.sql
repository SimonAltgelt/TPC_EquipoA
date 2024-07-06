CREATE DATABASE Inmobiliaria
GO

USE Inmobiliaria

CREATE TABLE LOCALIDADES(
	ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	NOMBRE VARCHAR(50) NOT NULL
)

CREATE TABLE UBICACIONES(
	ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	DIRECCION varchar(50) NOT NULL,
	IDLOCALIDAD int NOT NULL FOREIGN KEY REFERENCES LOCALIDADES(ID),
)

CREATE TABLE TIPOS(
	ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Nombre varchar(30) NOT NULL
)

CREATE TABLE DISPONIBILIDADES(
	ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	NOMBRE VARCHAR(30) NOT NULL
)

CREATE TABLE USUARIOS(
	ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	EMAIL VARCHAR(50) NOT NULL,
	CONTRASEÑA VARCHAR(20) NOT NULL,
	NOMBRE VARCHAR(20) NOT NULL,
	APELLIDO VARCHAR(20) NOT NULL,
	TELEFONO VARCHAR(20) NOT NULL,
	DOCUMENTO VARCHAR(8) NULL,
	DOMICILIO VARCHAR(50) NULL,
	IMAGENPERFIL VARCHAR(300) NULL,
	TIPOUSUARIO INT NOT NULL,
)

CREATE TABLE INMUEBLES(
	ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	IDTIPO INT NOT NULL FOREIGN KEY REFERENCES TIPOS(id),
	IDUBICACION INT NOT NULL FOREIGN KEY REFERENCES UBICACIONES(ID),
	METROS2 INT NOT NULL,
	METROS2CUBIERTOS INT NOT NULL,
	IDDISPONIBILIDAD INT NOT NULL FOREIGN KEY REFERENCES DISPONIBILIDADES(ID),
	AMBIENTES INT NOT NULL,
	BAÑOS INT NOT NULL,
	PRECIO MONEY NOT NULL,
	DESCRIPCION VARCHAR(500) NOT NULL,
	ESTADO BIT NOT NULL DEFAULT 1,
)

CREATE TABLE IMAGENES(
	ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	IDINMUEBLE INT FOREIGN KEY REFERENCES INMUEBLES(ID),
	URLIMAGEN VARCHAR(300) NOT NULL,
	DESCRIPCION VARCHAR(100) NULL,
)

CREATE TABLE TURNOS(
	IDTurno int primary key identity(1,1),
	IDUsuario int foreign key references USUARIOS(ID),
	IDInmueble int foreign key references INMUEBLES(ID),
	Fecha date not null,
	Turno char not null
)

CREATE TABLE FAVORITOS(
	IDFavorito int primary key identity(1,1),
	IDUsuario int foreign key references USUARIOS(ID),
	IDInmueble int foreign key references INMUEBLES(ID),
	UNIQUE(IDUsuario, IDInmueble)
)

USE [Inmobiliaria]
GO
SET IDENTITY_INSERT [dbo].[LOCALIDADES] ON 

INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (1, N'25 de Mayo')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (2, N'Adolfo Alsina')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (3, N'Almirante Brown')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (4, N'America')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (5, N'Arrecifes')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (6, N'Ayacucho')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (7, N'Azul')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (8, N'Bahía Blanca')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (9, N'Balcarce')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (10, N'Baradero')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (11, N'Benito Juárez')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (12, N'Berazategui')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (13, N'Bolívar')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (14, N'Bragado')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (15, N'Campana')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (16, N'Cañuelas')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (17, N'Capitán Sarmiento')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (18, N'Carlos Casares')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (19, N'Carlos Tejedor')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (20, N'Carmen de Areco')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (21, N'Carmen de Patagones')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (22, N'Casbas')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (23, N'Castelli')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (24, N'Chacabuco')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (25, N'Chascomús')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (26, N'Chivilcoy')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (27, N'Ciudad Autónoma de Buenos Aires')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (28, N'Colón')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (29, N'Coronel Dorrego')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (30, N'Coronel Pringles')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (31, N'Coronel Rosales')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (32, N'Coronel Suárez')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (33, N'Daireaux')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (34, N'Dolores')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (35, N'Ensenada')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (36, N'Escobar')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (37, N'Esteban Echeverría')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (38, N'Exaltación de la Cruz')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (39, N'Ezeiza')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (40, N'Florencio Varela')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (41, N'Florentino Ameghino')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (42, N'General Alvarado')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (43, N'General Alvear')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (44, N'General Belgrano')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (45, N'General Guido')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (46, N'General La Madrid')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (47, N'General Las Heras')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (48, N'General Lavalle')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (49, N'General Madariaga')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (50, N'General Paz')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (51, N'General Pinto')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (52, N'General Pueyrredón')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (53, N'General Rodríguez')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (54, N'General San Martín')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (55, N'General Viamonte')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (56, N'General Villegas')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (57, N'Gonzales Chaves')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (58, N'Guaminí')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (59, N'Hipólito Yrigoyen')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (60, N'Hurlingham')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (61, N'Ituzaingó')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (62, N'José C. Paz')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (63, N'Junín')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (64, N'La Costa')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (65, N'La Plata')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (66, N'La Matanza')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (67, N'Lanús')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (68, N'Laprida')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (69, N'Las Flores')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (70, N'Leandro N. Alem')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (71, N'Lezama')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (72, N'Lincoln')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (73, N'Lobería')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (74, N'Lobos')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (75, N'Lomas de Zamora')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (76, N'Luján')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (77, N'Magdalena')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (78, N'Maipú')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (79, N'Malvinas Argentinas')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (80, N'Mar Chiquita')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (81, N'Mar del Plata')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (82, N'Marcos Paz')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (83, N'Mercedes')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (84, N'Merlo')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (85, N'Monte')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (86, N'Monte Hermoso')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (87, N'Moreno')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (88, N'Morón')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (89, N'Navarro')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (90, N'Necochea')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (91, N'Nueve de Julio')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (92, N'Olavarría')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (93, N'Partido de la Costa')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (94, N'Patagones')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (95, N'Pehuajó')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (96, N'Pellegrini')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (97, N'Pergamino')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (98, N'Pila')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (99, N'Pilar')
GO
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (100, N'Pinamar')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (101, N'Presidente Perón')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (102, N'Puan')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (103, N'Punta Indio')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (104, N'Quilmes')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (105, N'Ramallo')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (106, N'Rauch')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (107, N'Rivadavia')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (108, N'Rojas')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (109, N'Roque Pérez')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (110, N'Saavedra')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (111, N'Saladillo')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (112, N'Salliqueló')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (113, N'Salto')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (114, N'San Andrés de Giles')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (115, N'San Antonio de Areco')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (116, N'San Cayetano')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (117, N'San Fernando')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (118, N'San Isidro')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (119, N'San Miguel')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (120, N'San Nicolás')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (121, N'San Pedro')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (122, N'San Vicente')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (123, N'Suipacha')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (124, N'Tandil')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (125, N'Tapalqué')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (126, N'Tigre')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (127, N'Tordillo')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (128, N'Tornquist')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (129, N'Trenque Lauquen')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (130, N'Tres Arroyos')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (131, N'Tres de Febrero')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (132, N'Tres Lomas')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (133, N'Vicente López')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (134, N'Villa Gesell')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (135, N'Villarino')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (136, N'Zárate')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (137, N'Caballito')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (138, N'Zarate')
INSERT [dbo].[LOCALIDADES] ([ID], [NOMBRE]) VALUES (139, N'Puerto Madero')
SET IDENTITY_INSERT [dbo].[LOCALIDADES] OFF
GO
SET IDENTITY_INSERT [dbo].[UBICACIONES] ON 

INSERT [dbo].[UBICACIONES] ([ID], [DIRECCION], [IDLOCALIDAD]) VALUES (1, N'Calle 1', 64)
INSERT [dbo].[UBICACIONES] ([ID], [DIRECCION], [IDLOCALIDAD]) VALUES (2, N'Avenida Colón 1234', 65)
INSERT [dbo].[UBICACIONES] ([ID], [DIRECCION], [IDLOCALIDAD]) VALUES (3, N'Calle Rivadavia 567', 27)
INSERT [dbo].[UBICACIONES] ([ID], [DIRECCION], [IDLOCALIDAD]) VALUES (4, N'Avenida España 789', 27)
INSERT [dbo].[UBICACIONES] ([ID], [DIRECCION], [IDLOCALIDAD]) VALUES (5, N'Calle San Martín 101', 133)
INSERT [dbo].[UBICACIONES] ([ID], [DIRECCION], [IDLOCALIDAD]) VALUES (6, N'Avenida del Libertador 202', 27)
INSERT [dbo].[UBICACIONES] ([ID], [DIRECCION], [IDLOCALIDAD]) VALUES (7, N'Calle Lavalle 303', 126)
INSERT [dbo].[UBICACIONES] ([ID], [DIRECCION], [IDLOCALIDAD]) VALUES (8, N'Coronel Pringles 404', 88)
INSERT [dbo].[UBICACIONES] ([ID], [DIRECCION], [IDLOCALIDAD]) VALUES (9, N'Calle Belgrano 505', 88)
INSERT [dbo].[UBICACIONES] ([ID], [DIRECCION], [IDLOCALIDAD]) VALUES (10, N'Avenida de Mayo 606', 27)
INSERT [dbo].[UBICACIONES] ([ID], [DIRECCION], [IDLOCALIDAD]) VALUES (11, N'Oldman Lote  N 704 Haras Santa María', 36)
INSERT [dbo].[UBICACIONES] ([ID], [DIRECCION], [IDLOCALIDAD]) VALUES (12, N'Avenida Gaona 1200', 137)
INSERT [dbo].[UBICACIONES] ([ID], [DIRECCION], [IDLOCALIDAD]) VALUES (13, N'Rawson al 3700', 133)
INSERT [dbo].[UBICACIONES] ([ID], [DIRECCION], [IDLOCALIDAD]) VALUES (14, N'Colectora Norte 1233', 138)
INSERT [dbo].[UBICACIONES] ([ID], [DIRECCION], [IDLOCALIDAD]) VALUES (15, N'Moreau de Justo Alicia al 1900', 139)
INSERT [dbo].[UBICACIONES] ([ID], [DIRECCION], [IDLOCALIDAD]) VALUES (16, N'Leopoldo Lugones 3100', 117)
SET IDENTITY_INSERT [dbo].[UBICACIONES] OFF
GO
SET IDENTITY_INSERT [dbo].[TIPOS] ON 

INSERT [dbo].[TIPOS] ([ID], [Nombre]) VALUES (1, N'Casa')
INSERT [dbo].[TIPOS] ([ID], [Nombre]) VALUES (2, N'Departamento')
INSERT [dbo].[TIPOS] ([ID], [Nombre]) VALUES (3, N'PH')
INSERT [dbo].[TIPOS] ([ID], [Nombre]) VALUES (4, N'Terreno')
INSERT [dbo].[TIPOS] ([ID], [Nombre]) VALUES (5, N'Oficina')
SET IDENTITY_INSERT [dbo].[TIPOS] OFF
GO
SET IDENTITY_INSERT [dbo].[DISPONIBILIDADES] ON 

INSERT [dbo].[DISPONIBILIDADES] ([ID], [NOMBRE]) VALUES (1, N'Venta')
INSERT [dbo].[DISPONIBILIDADES] ([ID], [NOMBRE]) VALUES (2, N'Alquiler')
SET IDENTITY_INSERT [dbo].[DISPONIBILIDADES] OFF
GO
SET IDENTITY_INSERT [dbo].[INMUEBLES] ON 

INSERT [dbo].[INMUEBLES] ([ID], [IDTIPO], [IDUBICACION], [METROS2], [METROS2CUBIERTOS], [IDDISPONIBILIDAD], [AMBIENTES], [BAÑOS], [PRECIO], [DESCRIPCION], [ESTADO]) VALUES (1, 1, 1, 200, 150, 1, 4, 2, 250000.0000, N'Casa amplia con jardín', 1)
INSERT [dbo].[INMUEBLES] ([ID], [IDTIPO], [IDUBICACION], [METROS2], [METROS2CUBIERTOS], [IDDISPONIBILIDAD], [AMBIENTES], [BAÑOS], [PRECIO], [DESCRIPCION], [ESTADO]) VALUES (2, 2, 2, 80, 80, 2, 3, 1, 15000.0000, N'Departamento céntrico', 1)
INSERT [dbo].[INMUEBLES] ([ID], [IDTIPO], [IDUBICACION], [METROS2], [METROS2CUBIERTOS], [IDDISPONIBILIDAD], [AMBIENTES], [BAÑOS], [PRECIO], [DESCRIPCION], [ESTADO]) VALUES (3, 3, 3, 120, 120, 2, 5, 2, 20000.0000, N'PH con patio', 1)
INSERT [dbo].[INMUEBLES] ([ID], [IDTIPO], [IDUBICACION], [METROS2], [METROS2CUBIERTOS], [IDDISPONIBILIDAD], [AMBIENTES], [BAÑOS], [PRECIO], [DESCRIPCION], [ESTADO]) VALUES (4, 1, 4, 250, 200, 1, 5, 3, 300000.0000, N'Casa amplia con jardín', 1)
INSERT [dbo].[INMUEBLES] ([ID], [IDTIPO], [IDUBICACION], [METROS2], [METROS2CUBIERTOS], [IDDISPONIBILIDAD], [AMBIENTES], [BAÑOS], [PRECIO], [DESCRIPCION], [ESTADO]) VALUES (5, 4, 8, 250, 0, 1, 0, 0, 100000.0000, N'Terreno sin edificar', 1)
INSERT [dbo].[INMUEBLES] ([ID], [IDTIPO], [IDUBICACION], [METROS2], [METROS2CUBIERTOS], [IDDISPONIBILIDAD], [AMBIENTES], [BAÑOS], [PRECIO], [DESCRIPCION], [ESTADO]) VALUES (6, 1, 11, 175, 160, 2, 5, 3, 1.1000, N'Casa en Alquiler en Haras Santa Maria.
CASA DESARROLLADA EN UNA PLANTA,CUENTA CON HALL DE RECEPCION,TOILETTE,COCINA COMEDOR INTEGRADOS,ISLA CON ANAFE A GAS,HORNO ELECTRICO,LIVING,LAVADERO,DEPENDECIA DE SERVICIO CON BAÑO COMPLETO,TRES DORMITORIOS MUY LUMINOSOS,DOS DE ELLOS CON PLACARES COMPLETOS,BAÑO COMPLETO,DORMITORIO PRINCIPAL EN SUITE CON VESTIDOR.

EXTERIOR GALERIA,PARRILLA,PILETA,BAÑO EXTERIOR CON DUCHA,CUARTO DE MAQUINAS.RIEGO POR ASPERSION
CALEFACCION POR LOSA RADIANTE.', 1)
INSERT [dbo].[INMUEBLES] ([ID], [IDTIPO], [IDUBICACION], [METROS2], [METROS2CUBIERTOS], [IDDISPONIBILIDAD], [AMBIENTES], [BAÑOS], [PRECIO], [DESCRIPCION], [ESTADO]) VALUES (7, 2, 12, 42, 38, 2, 2, 1, 500.0000, N'Alquiler residencial

Departamento 2 ambientes con cochera, piso alto al frente con balcón corrido
El edificio cuenta con seguridad las 24 horas, gimnasio, pileta y Laundry
Esta ubicado en el centro de caballito, a metros del cid campeador, donde encontras gran cantidad de líneas de colectivos y el subte G e I que conectan con el resto de la ciudad
Excelente alternativa para vivir
El departamento cuenta con living comedor con salida al balcón
Mucha luz, y una gran vista al frente. Cocina ', 1)
INSERT [dbo].[INMUEBLES] ([ID], [IDTIPO], [IDUBICACION], [METROS2], [METROS2CUBIERTOS], [IDDISPONIBILIDAD], [AMBIENTES], [BAÑOS], [PRECIO], [DESCRIPCION], [ESTADO]) VALUES (8, 3, 13, 65, 65, 2, 3, 2, 750.0000, N'Este PH en alquiler en La Lucila es una verdadera joya. Con 2 dormitorios espaciosos , uno de ellos en suite y otro con salida al balcon, una cocina moderna, un baño elegante y dos patios encantadores, ofrece comodidad y estilo. Todo el espacio ha sido recientemente reciclado a nuevo, lo que garantiza un ambiente fresco y acogedor. Ubicado en una zona tranquila y buscada, este inmueble combina lo mejor de la comodidad y la cercania de medios de transporte y comercios', 1)
INSERT [dbo].[INMUEBLES] ([ID], [IDTIPO], [IDUBICACION], [METROS2], [METROS2CUBIERTOS], [IDDISPONIBILIDAD], [AMBIENTES], [BAÑOS], [PRECIO], [DESCRIPCION], [ESTADO]) VALUES (9, 4, 14, 72000, 0, 2, 0, 0, 18700.0000, N'Terreno en Alquiler 
Excelente terreno en alquiler ubicado en la zona de Zárate, en la provincia de Buenos Aires. Zárate se caracteriza por su actividad industrial, agroindustrial y logística. Es un enclave estratégico dada su disposición en un eje de circulación que une el Mercosur con Buenos Aires.
Frente de 500 mts sobre Ruta 9.
Accesibilidad directa a la ruta.', 1)
INSERT [dbo].[INMUEBLES] ([ID], [IDTIPO], [IDUBICACION], [METROS2], [METROS2CUBIERTOS], [IDDISPONIBILIDAD], [AMBIENTES], [BAÑOS], [PRECIO], [DESCRIPCION], [ESTADO]) VALUES (10, 5, 15, 480, 480, 2, 2, 1, 3.8420, N'Oficina en alquiler en Puerto Madero.
Al contrafente, en planta dividida, con excelente vista al dique. Posee 1 despacho gerencial, más 4 para subgerentes, una gran área de trabajo con divisiones de vidrio. Divisiones móviles. Cuenta con recepción depósito y office. Se podría alquilar con luminarias. 1 despacho gerencial más 4 para subgerentes con excelente vista al dique, una gran área de trabajo con divisiones de vidrio.Divisiones móviles.Se podría alquilar con luminarias.', 1)
INSERT [dbo].[INMUEBLES] ([ID], [IDTIPO], [IDUBICACION], [METROS2], [METROS2CUBIERTOS], [IDDISPONIBILIDAD], [AMBIENTES], [BAÑOS], [PRECIO], [DESCRIPCION], [ESTADO]) VALUES (11, 2, 16, 162, 152, 1, 4, 2, 164000.0000, N'EXCELENTE OPORTUNIDAD PARA MUDARTE
Propiedad Triplex desarrollada.
Planta Baja Living Comedor , Cocina ,Toilet, jardín de invierno , jardín exterior , cochera para 2 autos.
1ra Planta  2 Dormitorios , Baño.
2da Ptanta 1 dormitorio , Baño , escritorio, baulera , lavadero.

Impecable casa al ingresar a la planta baja nos recibe un pasillo de recepción hacia el living comedor muy luminoso con grandes ventanales hacia el Jardín de invierno totalmente vidriado aportando gran vista y luminosidad', 1)
SET IDENTITY_INSERT [dbo].[INMUEBLES] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIOS] ON 

INSERT [dbo].[USUARIOS] ([ID], [EMAIL], [CONTRASEÑA], [NOMBRE], [APELLIDO], [TELEFONO], [DOCUMENTO], [DOMICILIO], [IMAGENPERFIL], [TIPOUSUARIO]) VALUES (1, N'juanperez@gmail.com', N'password123', N'Juan', N'Perez', N'1122334455', NULL, NULL, NULL, 0)
INSERT [dbo].[USUARIOS] ([ID], [EMAIL], [CONTRASEÑA], [NOMBRE], [APELLIDO], [TELEFONO], [DOCUMENTO], [DOMICILIO], [IMAGENPERFIL], [TIPOUSUARIO]) VALUES (2, N'mariagonzalez@gmail.com', N'password456', N'Maria', N'Gonzalez', N'1122334456', NULL, NULL, NULL, 0)
INSERT [dbo].[USUARIOS] ([ID], [EMAIL], [CONTRASEÑA], [NOMBRE], [APELLIDO], [TELEFONO], [DOCUMENTO], [DOMICILIO], [IMAGENPERFIL], [TIPOUSUARIO]) VALUES (3, N'pedrolopez@gmail.com', N'password789', N'Pedro', N'Lopez', N'1122334457', NULL, NULL, NULL, 0)
INSERT [dbo].[USUARIOS] ([ID], [EMAIL], [CONTRASEÑA], [NOMBRE], [APELLIDO], [TELEFONO], [DOCUMENTO], [DOMICILIO], [IMAGENPERFIL], [TIPOUSUARIO]) VALUES (4, N'juanchitomei@hotmail.com', N'password432', N'Juan', N'Tomei', N'1524803439', NULL, NULL, NULL, 0)
INSERT [dbo].[USUARIOS] ([ID], [EMAIL], [CONTRASEÑA], [NOMBRE], [APELLIDO], [TELEFONO], [DOCUMENTO], [DOMICILIO], [IMAGENPERFIL], [TIPOUSUARIO]) VALUES (5, N'victoria@lusivi.com.ar', N'admin123', N'Victoria', N'Kowalk', N'1566156439', N'', N'', N'perfil-5.jpg', 1)
INSERT [dbo].[USUARIOS] ([ID], [EMAIL], [CONTRASEÑA], [NOMBRE], [APELLIDO], [TELEFONO], [DOCUMENTO], [DOMICILIO], [IMAGENPERFIL], [TIPOUSUARIO]) VALUES (6, N'lucas@lusivi.com.ar', N'admin123', N'Lucas', N'Delfino', N'1566156439', NULL, NULL, NULL, 1)
INSERT [dbo].[USUARIOS] ([ID], [EMAIL], [CONTRASEÑA], [NOMBRE], [APELLIDO], [TELEFONO], [DOCUMENTO], [DOMICILIO], [IMAGENPERFIL], [TIPOUSUARIO]) VALUES (7, N'simon@lusivi.com.ar', N'admin123', N'Simon', N'Altgelt', N'1566156439', NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[USUARIOS] OFF
GO
SET IDENTITY_INSERT [dbo].[IMAGENES] ON 

INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (1, 1, N'https://static1.sosiva451.com/82877651/b5cd6092-0621-4de0-8cb4-728eec471010_u_small.jpg', N'Vista frontal de la casa')
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (2, 1, N'https://static1.sosiva451.com/82877651/e4c82137-8c04-4536-b294-ab604c90c876_u_large.jpg', N'Jardín de la casa')
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (3, 2, N'https://static1.sosiva451.com/68988151/376c557b-75d5-463c-8809-3c3855584243_u_large.jpg', N'Sala de estar del departamento')
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (4, 3, N'https://static1.sosiva451.com/61149541/0b62c7fe-91a4-4314-b6cc-15ac1d257165_u_large.jpg', N'Patio del PH')
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (5, 5, N'https://static1.sosiva451.com/15905221/05531471-d235-4fa6-a3f1-3f0d1660b787_u_medium.jpg', N'Terreno')
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (6, 6, N'img/Haras Santa María, Escobar1-6.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (7, 6, N'img/Haras Santa María, Escobar2-6.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (8, 6, N'img/Haras Santa María, Escobar3-6.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (9, 6, N'img/Haras Santa María, Escobar-6.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (10, 7, N'img/caballito1-7.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (11, 7, N'img/caballito2-7.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (12, 7, N'img/caballito3-7.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (13, 7, N'img/caballito4-7.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (14, 8, N'img/vicebte lopez 1-8.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (15, 8, N'img/vicebte lopez 2-8.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (16, 8, N'img/vicebte lopez 3-8.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (17, 8, N'img/vicebte lopez-8.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (18, 10, N'img/Puero Madero-10.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (19, 10, N'img/Puero Madero1-10.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (20, 10, N'img/Puero Madero2-10.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (21, 11, N'img/SanFer-11.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (22, 11, N'img/SanFer1-11.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (23, 11, N'img/SanFer2-11.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (24, 11, N'img/SanFer3-11.jpg', NULL)
INSERT [dbo].[IMAGENES] ([ID], [IDINMUEBLE], [URLIMAGEN], [DESCRIPCION]) VALUES (25, 11, N'img/SanFer4-11.jpg', NULL)
SET IDENTITY_INSERT [dbo].[IMAGENES] OFF
GO



-- Creación de la view
GO
CREATE OR ALTER VIEW VW_DatosInmuebles AS
(SELECT i.ID, t.Nombre AS TIPO, u.DIRECCION AS DIRECCION, l.NOMBRE AS LOCALIDAD, i.METROS2, i.METROS2CUBIERTOS, d.NOMBRE AS DISPONIBILIDAD, i.AMBIENTES, i.BAÑOS, i.PRECIO, i.DESCRIPCION, i.ESTADO
FROM INMUEBLES i
INNER JOIN TIPOS t ON t.ID=i.IDTIPO
INNER JOIN DISPONIBILIDADES d ON d.ID=i.IDDISPONIBILIDAD
INNER JOIN UBICACIONES u ON u.ID=i.IDUBICACION
INNER JOIN LOCALIDADES l ON l.ID=u.IDLOCALIDAD)
GO

-- Creación del procedimiento para agregar
CREATE OR ALTER PROCEDURE SP_Agregar_Inmueble(
	@tipo varchar(30),
	@direccion varchar(50),
	@localidad varchar(50),
	@precio money,
	@descripcion varchar(500),
	@metros2 int,
	@metros2cubiertos int,
	@ambientes int,
	@baños int,
	@disponibilidad varchar(30)
)
AS
BEGIN
	Declare @idlocalidad int
	Declare @idubicacion int
	Declare @iddisponibilidad int
	Declare @idtipo int
	SELECT @iddisponibilidad = ID FROM DISPONIBILIDADES WHERE NOMBRE = @disponibilidad;
	SELECT @idtipo = ID FROM TIPOS WHERE Nombre = @tipo;

	IF @localidad NOT IN (SELECT NOMBRE FROM LOCALIDADES)
	BEGIN
		INSERT INTO LOCALIDADES (NOMBRE) VALUES (@localidad)
		SELECT @idlocalidad=@@IDENTITY
	END
	ELSE
	BEGIN
		SELECT @idlocalidad = ID FROM LOCALIDADES WHERE NOMBRE = @localidad;
	END

	INSERT INTO UBICACIONES (DIRECCION, IDLOCALIDAD)
	VALUES (@direccion, @idlocalidad)
	SELECT @idubicacion = @@IDENTITY

	INSERT INTO INMUEBLES (IDTIPO, IDUBICACION, METROS2, METROS2CUBIERTOS, IDDISPONIBILIDAD,AMBIENTES,BAÑOS,PRECIO,DESCRIPCION,ESTADO)
	VALUES (@idtipo, @idubicacion, @metros2, @metros2cubiertos, @iddisponibilidad, @ambientes, @baños, @precio, @descripcion, 1)
END
GO

-- Creación del procedimiento para modificar
CREATE OR ALTER PROCEDURE SP_Modificar_Inmueble(
	@id int,
	@tipo varchar(30),
	@direccion varchar(50),
	@localidad varchar(50),
	@precio money,
	@descripcion varchar(500),
	@metros2 int,
	@metros2cubiertos int,
	@ambientes int,
	@baños int,
	@disponibilidad varchar(30)
)
AS
BEGIN
	Declare @idlocalidad int
	Declare @idubicacion int
	Declare @iddisponibilidad int
	Declare @idtipo int
	
	IF @localidad NOT IN (SELECT NOMBRE FROM LOCALIDADES)
	BEGIN
		INSERT INTO LOCALIDADES (NOMBRE) VALUES (@localidad)
		SELECT @idlocalidad=@@IDENTITY
	END
	ELSE
	BEGIN
		SELECT @idlocalidad = ID FROM LOCALIDADES WHERE NOMBRE = @localidad;
	END

	SELECT @iddisponibilidad = ID FROM DISPONIBILIDADES WHERE NOMBRE = @disponibilidad;
	SELECT @idtipo = ID FROM TIPOS WHERE Nombre = @tipo;
	SELECT @idubicacion = u.ID FROM UBICACIONES u INNER JOIN INMUEBLES i ON i.IDUBICACION=u.ID
	WHERE i.ID = @id;

	UPDATE UBICACIONES
	SET DIRECCION=@direccion, IDLOCALIDAD=@idlocalidad
	WHERE ID=@idubicacion;

	UPDATE INMUEBLES
	SET 
		IDTIPO=@idtipo,
		IDUBICACION=@idubicacion,
		METROS2=@metros2,
		METROS2CUBIERTOS=@metros2cubiertos,
		IDDISPONIBILIDAD=@iddisponibilidad,
		AMBIENTES=@ambientes,
		BAÑOS=@baños,
		PRECIO=@precio,
		DESCRIPCION=@descripcion
	WHERE ID=@id;
END
GO

CREATE OR ALTER PROCEDURE SP_InsertarUsuario(
	@Nombre varchar (20),
	@Apellido varchar (20),
	@Email varchar (50),
	@Contraseña varchar (20),
	@Telefono varchar (20)
)
AS
BEGIN
	INSERT INTO USUARIOS (NOMBRE, APELLIDO,EMAIL, CONTRASEÑA, TELEFONO, TIPOUSUARIO)
	OUTPUT inserted.ID --para que traiga el id del ultimo creado
	VALUES	(@Nombre, @Apellido, @Email, @Contraseña,@Telefono, 0)
END
GO

CREATE OR ALTER PROCEDURE SP_ComprobarTurno(
	@Fecha date,
	@Turno char
)
AS
BEGIN
	SELECT COUNT(*) FROM TURNOS WHERE Fecha=@Fecha AND Turno=@Turno;
END
GO

CREATE OR ALTER PROCEDURE SP_InsertarTurno(
	@Fecha date,
	@Turno char,
	@IDUsuario int,
	@IDInmueble int
)
AS
BEGIN
	INSERT INTO TURNOS (IDUsuario, IDInmueble, Fecha, Turno)
	VALUES(@IDUsuario, @IDInmueble, @Fecha, @Turno)
END
GO

CREATE OR ALTER PROCEDURE SP_AdministrarFavorito(
	@IDUsuario int,
	@IDInmueble int
)
AS
BEGIN
	Declare @Cantidad int;
	SELECT @Cantidad = COUNT(*) FROM FAVORITOS WHERE IDUsuario=@IDUsuario AND IDInmueble=@IDInmueble;
	IF @CANTIDAD = 0
	BEGIN
		INSERT INTO FAVORITOS(IDUsuario,IDInmueble)
		VALUES(@IDUsuario,@IDInmueble)
	END
	ELSE
	BEGIN
		DELETE FROM FAVORITOS WHERE IDUsuario=@IDUsuario AND IDInmueble=@IDInmueble;
	END
END
GO

CREATE OR ALTER PROCEDURE SP_ListarFavoritos(
	@IDUsuario int
)
AS
BEGIN
	SELECT i.ID, t.Nombre AS 'TIPO', u.DIRECCION, l.NOMBRE AS 'LOCALIDAD', i.METROS2, i.METROS2CUBIERTOS, d.NOMBRE AS 'DISPONIBILIDAD', i.AMBIENTES, i.BAÑOS, i.PRECIO, i.DESCRIPCION, i.ESTADO FROM Inmuebles i
	INNER JOIN DISPONIBILIDADES d ON i.IDDISPONIBILIDAD=d.ID
	INNER JOIN UBICACIONES u ON i.IDUBICACION=u.ID
	INNER JOIN LOCALIDADES l ON u.IDLOCALIDAD=l.ID
	INNER JOIN TIPOS t ON i.IDTIPO=t.ID
	INNER JOIN FAVORITOS f ON f.IDInmueble=i.ID
	WHERE f.IDUsuario=@IDUsuario
END
GO

DELETE  FROM FAVORITOS

SP_ListarFavoritos 6