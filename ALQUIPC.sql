CREATE DATABASE alquiler;
USE alquiler;

CREATE TABLE ciudad (
  pk_idCiudad INT (11) PRIMARY KEY not null,
  ciudad_nombre VARCHAR(25) not null
);

CREATE TABLE categoria (
  pk_idCategoria INT (11) PRIMARY KEY not null,
  categoria_nombre VARCHAR(25) not null
);

CREATE TABLE usuario (
  pk_idUsuario INT (11) PRIMARY KEY not null AUTO_INCREMENT,
  usuario_nombre VARCHAR(50) not null, 
  usuario_cedula INT(10) not null,
  usuario_telefono VARCHAR(10) not null,
  usuario_correo VARCHAR(50) not null,
  usuario_contraseña VARCHAR(50) not null,
  usuario_rol VARCHAR (50) not null
);

CREATE TABLE equipo (
  pk_idEquipo INT (11) PRIMARY KEY not null AUTO_INCREMENT,
  equipo_nombre VARCHAR(50) not null,
  equipo_descripcion TEXT not null,
  equipo_tarifa DOUBLE not null,
  fk_id_Categoria INT(10) not null,
  FOREIGN KEY (fk_id_Categoria) REFERENCES categoria(pk_idCategoria)
);

CREATE TABLE alquiler (
  pk_idAlquiler INT (11) PRIMARY KEY not null AUTO_INCREMENT,
  alquiler_fechaInicio DATE not null,
  alquiler_fechaFinal DATE not null,
  alquiler_totalDias INT(3) not null,
  alquiler_diasAdicionales INT(3),
  alquiler_descripcion TEXT,
  alquiler_direccion VARCHAR(50) not null,
  fk_idCiudad INT(11) not null,
  fk_idUsuario INT(11) not null,
  FOREIGN KEY (fk_idCiudad) REFERENCES ciudad(pk_idCiudad),
  FOREIGN KEY (fk_idUsuario) REFERENCES usuario(pk_idUsuario)
);

CREATE TABLE equipo_alquiler (
  pk_idEquipo_Alquiler INT (11) PRIMARY KEY not null,
  fk_idEquipo int(11) not null,
  fk_idAlquiler int(11) not null,
  FOREIGN KEY (fk_idEquipo) REFERENCES equipo(pk_idEquipo),
  FOREIGN KEY (fk_idAlquiler) REFERENCES alquiler(pk_idAlquiler)
  );

CREATE TABLE pago (
  pk_idPago INT (11) PRIMARY KEY not null AUTO_INCREMENT,
  pago_fecha DATE not null,
  pago_monto DOUBLE not null,
  pago_estado VARCHAR(30) not null,
  pago_metodo VARCHAR(30) not null,
  fk_idAlquiler INT(11) not null,
  FOREIGN KEY (fk_idAlquiler) REFERENCES alquiler(pk_idAlquiler)
);

INSERT INTO `ciudad` (`pk_idCiudad`, `ciudad_nombre`) VALUES ('1', 'Bogota');
INSERT INTO `ciudad` (`pk_idCiudad`, `ciudad_nombre`) VALUES ('2', 'Medellin');
INSERT INTO `ciudad` (`pk_idCiudad`, `ciudad_nombre`) VALUES ('3', 'Cali');

INSERT INTO `usuario` (`pk_idUsuario`, `usuario_nombre`, `usuario_cedula`, `usuario_telefono`, `usuario_correo`, `usuario_contraseña`, usuario_rol) VALUES ('1', 'Santiago Murillo', '1141714236', '3228156326', 'murillo@gmail.com', 'murillo123', 'Cliente');

