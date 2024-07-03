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

-- Insertando datos en la tabla LOCALIDADES
INSERT INTO LOCALIDADES (NOMBRE) VALUES
('25 de Mayo'),
('Adolfo Alsina'),
('Almirante Brown'),
('America'),
('Arrecifes'),
('Ayacucho'),
('Azul'),
('Bahía Blanca'),
('Balcarce'),
('Baradero'),
('Benito Juárez'),
('Berazategui'),
('Bolívar'),
('Bragado'),
('Campana'),
('Cañuelas'),
('Capitán Sarmiento'),
('Carlos Casares'),
('Carlos Tejedor'),
('Carmen de Areco'),
('Carmen de Patagones'),
('Casbas'),
('Castelli'),
('Chacabuco'),
('Chascomús'),
('Chivilcoy'),
('Ciudad Autónoma de Buenos Aires'),
('Colón'),
('Coronel Dorrego'),
('Coronel Pringles'),
('Coronel Rosales'),
('Coronel Suárez'),
('Daireaux'),
('Dolores'),
('Ensenada'),
('Escobar'),
('Esteban Echeverría'),
('Exaltación de la Cruz'),
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
('General Pueyrredón'),
('General Rodríguez'),
('General San Martín'),
('General Viamonte'),
('General Villegas'),
('Gonzales Chaves'),
('Guaminí'),
('Hipólito Yrigoyen'),
('Hurlingham'),
('Ituzaingó'),
('José C. Paz'),
('Junín'),
('La Costa'),
('La Plata'),
('La Matanza'),
('Lanús'),
('Laprida'),
('Las Flores'),
('Leandro N. Alem'),
('Lezama'),
('Lincoln'),
('Lobería'),
('Lobos'),
('Lomas de Zamora'),
('Luján'),
('Magdalena'),
('Maipú'),
('Malvinas Argentinas'),
('Mar Chiquita'),
('Mar del Plata'),
('Marcos Paz'),
('Mercedes'),
('Merlo'),
('Monte'),
('Monte Hermoso'),
('Moreno'),
('Morón'),
('Navarro'),
('Necochea'),
('Nueve de Julio'),
('Olavarría'),
('Partido de la Costa'),
('Patagones'),
('Pehuajó'),
('Pellegrini'),
('Pergamino'),
('Pila'),
('Pilar'),
('Pinamar'),
('Presidente Perón'),
('Puan'),
('Punta Indio'),
('Quilmes'),
('Ramallo'),
('Rauch'),
('Rivadavia'),
('Rojas'),
('Roque Pérez'),
('Saavedra'),
('Saladillo'),
('Salliqueló'),
('Salto'),
('San Andrés de Giles'),
('San Antonio de Areco'),
('San Cayetano'),
('San Fernando'),
('San Isidro'),
('San Miguel'),
('San Nicolás'),
('San Pedro'),
('San Vicente'),
('Suipacha'),
('Tandil'),
('Tapalqué'),
('Tigre'),
('Tordillo'),
('Tornquist'),
('Trenque Lauquen'),
('Tres Arroyos'),
('Tres de Febrero'),
('Tres Lomas'),
('Vicente López'),
('Villa Gesell'),
('Villarino'),
('Zárate');

-- Insertando datos en la tabla UBICACIONES
INSERT INTO UBICACIONES(DIRECCION, IDLOCALIDAD) VALUES
('Calle 1', 64),
('Avenida Colón 1234', 65),
('Calle Rivadavia 567', 27),
('Avenida España 789', 27),
('Calle San Martín 101', 133),
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

-- Insertando datos en la tabla DISPONIBILIDADES
INSERT INTO DISPONIBILIDADES (NOMBRE) VALUES
('Venta'),
('Alquiler');

-- Insertando datos en la tabla USUARIOS
INSERT INTO USUARIOS (EMAIL, CONTRASEÑA, NOMBRE, APELLIDO, TELEFONO, TIPOUSUARIO) VALUES
('juanperez@gmail.com', 'password123', 'Juan', 'Perez', '1122334455', 0),
('mariagonzalez@gmail.com', 'password456', 'Maria', 'Gonzalez', '1122334456', 0),
('pedrolopez@gmail.com', 'password789', 'Pedro', 'Lopez', '1122334457', 0),
('juanchitomei@hotmail.com', 'password432', 'Juan', 'Tomei', '1524803439', 0),
('victoria@lusivi.com.ar', 'admin123', 'Victoria', 'Kowalk', '1566156439', 1),
('lucas@lusivi.com.ar', 'admin123', 'Lucas', 'Delfino', '1566156439', 1),
('simon@lusivi.com.ar', 'admin123', 'Simon', 'Altgelt', '1566156439', 1)

-- Insertando datos en la tabla INMUEBLES
INSERT INTO INMUEBLES (IDTIPO, IDUBICACION, METROS2, METROS2CUBIERTOS, IDDISPONIBILIDAD, AMBIENTES, BAÑOS, PRECIO, DESCRIPCION, ESTADO) VALUES
(1, 1, 200, 150, 1, 4, 2, 250000, 'Casa amplia con jardín', 1),
(2, 2, 80, 80, 2, 3, 1, 15000, 'Departamento céntrico', 1),
(3, 3, 120, 120, 2, 5, 2, 20000, 'PH con patio', 1),
(1, 4, 250, 200, 1, 5, 3, 300000, 'Casa amplia con jardín', 1),
(4, 8, 250, 0, 1, 0, 0, 100000, 'Terreno sin edificar', 1);

-- Insertando datos en la tabla IMAGENES
INSERT INTO IMAGENES (IDINMUEBLE, URLIMAGEN, DESCRIPCION) VALUES
(1, 'https://static1.sosiva451.com/82877651/b5cd6092-0621-4de0-8cb4-728eec471010_u_small.jpg', 'Vista frontal de la casa'),
(1, 'https://static1.sosiva451.com/82877651/e4c82137-8c04-4536-b294-ab604c90c876_u_large.jpg', 'Jardín de la casa'),
(2, 'https://static1.sosiva451.com/68988151/376c557b-75d5-463c-8809-3c3855584243_u_large.jpg', 'Sala de estar del departamento'),
(3, 'https://static1.sosiva451.com/61149541/0b62c7fe-91a4-4314-b6cc-15ac1d257165_u_large.jpg', 'Patio del PH'),
(5, 'https://static1.sosiva451.com/15905221/05531471-d235-4fa6-a3f1-3f0d1660b787_u_medium.jpg', 'Terreno');

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