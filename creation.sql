--BORRADO DE TABLAS
DROP TABLE USUARIOS CASCADE CONSTRAINTS;
DROP TABLE PERFIL CASCADE CONSTRAINTS;
DROP TABLE GENEROS CASCADE CONSTRAINTS;
DROP TABLE GENERO_PELICULAS CASCADE CONSTRAINTS;
DROP TABLE PELICULAS CASCADE CONSTRAINTS;
DROP TABLE ACTOR CASCADE CONSTRAINTS;
DROP TABLE REPARTO CASCADE CONSTRAINTS;
DROP TABLE PALABRAS_CLAVE CASCADE CONSTRAINTS;
DROP TABLE PALABRAS_CLAVE_PELICULA CASCADE CONSTRAINTS;
DROP TABLE CLUB CASCADE CONSTRAINTS;
DROP TABLE MIEMBROS CASCADE CONSTRAINTS;
DROP TABLE PELICULAS_PROPUESTAS CASCADE CONSTRAINTS;
DROP TABLE INVITACIONES CASCADE CONSTRAINTS;
DROP TABLE SOLICITUDES CASCADE CONSTRAINTS;
DROP TABLE ACEPTACIONES CASCADE CONSTRAINTS;
DROP TABLE TIPO_CONTRATO CASCADE CONSTRAINTS;
DROP TABLE CONTRATO CASCADE CONSTRAINTS;
DROP TABLE CESES CASCADE CONSTRAINT;
DROP TABLE CLUBES_HISTORICOS CASCADE CONSTRAINT;


--CREACION DE TABLAS
CREATE TABLE USUARIOS (
nombre_usuario	VARCHAR2(100),
password	VARCHAR2(100) NOT NULL,
correo		VARCHAR2(100) UNIQUE NOT NULL,
CONSTRAINT PK_USUARIOS PRIMARY KEY(nombre_usuario),
CONSTRAINT CK_USUARIOS CHECK LENGTH(password)>=8
);

CREATE TABLE PERFIL(
nb_usuario	VARCHAR2(100) NOT NULL,
nombre		VARCHAR2(100),
app1		VARCHAR2(100),
app2		VARCHAR2(100),
movil		NUMBER(9),
DNI		VARCHAR2(9),
fecha_nac	DATE(),
CONSTRAINT PK_PERFIL PRIMARY KEY(DNI),
CONSTRAINT FK_PERFIL FOREIGN KEY(nb_usuario) REFERENCES USUARIOS
);


CREATE TABLE PELICULAS (
titulo		VARCHAR2(100),
director	VARCHAR2(100),
duracion	NUMBER(3),
imagen		VARCHAR2(20),
ratio		NUMBER(1,2),
ano_estreno	NUMBER(4),
calificacion	INT,
pais_prod	VARCHAR(20),
idioma_vo	VARCHAR(20),
presupuesto	VARCHAR(),
ingresos	INT,
n_rostros	NUMBER(3),
likes_dir	INT,
likes_reparto	INT,
likes_pelicula	INT,
CONSTRAINT PK_PELICULAS PRIMARY KEY(titulo,director),
CONSTRAINT CK_PELICULAS CHECK imagen in ('Color','Black and White')
);


CREATE TABLE IDBM (
titulo		VARCHAR2(100),
director	VARCHAR2(100),
url		VARCHAR2(100),
puntuacion	FLOAT,
cantidad_us	INT,
cantidad_crit	INT,
CONSTRAINT PK_IDBM PRIMARY KEY(url),
CONSTRAINT FK_IDBM FOREIGN KEY(titulo,director) REFERENCES PELICULAS
);


CREATE TABLE GENEROS (
genero	VARCHAR2(100),
CONSTRAINT PK_GENERO PRIMARY KEY(genero)
);


CREATE TABLE GENERO_PELICULAS (
titulo		VARCHAR2(100),
director	VARCHAR2(100),
genero		VARCHAR2(100),
CONSTRAINT PK_GENERO_PELICULAS PRIMARY KEY(titulo,director,genero),
CONSTRAINT FK_GENERO_PELICULAS_PELICULAS FOREIGN KEY(titulo,director) REFERENCES PELICULAS,
CONSTRAINT FK_GENERO_PELICULAS_GENEROS FOREIGN KEY(genero) REFERENCES GENEROS
);


CREATE TABLE PALABRAS_CLAVE (
palabra		VARCHAR2(100),
CONSTRAINT PK_PALABRA_CLAVE PRIMARY KEY(palabra)
);


CREATE TABLE PALABRAS_CLAVE_PELICULA (
titulo		VARCHAR2(100),
director	VARCHAR2(100),
palabra		VARCHAR2(100),
CONSTRAINT PK_PALABRAS_CLAVE_PELICULA PRIMARY KEY(titulo,director,palabra),
CONSTRAINT FK_PALABRAS_CLAVE_PELICULA_PELICULAS FOREIGN KEY(titulo,director) REFERENCES PELICULAS,
CONSTRAINT FK_PALABRAS_CLAVE_PELICULA_PALABRAS_CLAVE FOREIGN KEY(palabra) REFERENCES PALABRAS_CLAVE
);


CREATE TABLE ACTOR (
nombre_actor	VARCHAR2(100),
CONSTRAINT PK_ACTOR PRIMARY KEY(nombre_actor)
);



CREATE TABLE REPARTO (
titulo		VARCHAR2(100),
director	VARCHAR2(100),
nb_actor	VARCHAR2(100),
likes		NUMBER(5) NOT NULL,
CONSTRAINT PK_REPARTO PRIMARY KEY (titulo,director,nb_actor),
CONSTRAINT FK_REPARTO_PELICULA (titulo,director) REFERENCES PELICULAS,
CONSTRAINT FK_REPARTO_ACTOR (nb_actor) REFERENCES ACTOR
);

CREATE TABLE TIPO_CONTRATO (
tipo		VARCHAR2(100),
CONSTRAINT PK_TIPO_CONTRATO PRIMARY KEY (tipo)
);

CREATE TABLE CONTRATOS (
id_contrato	VARCHAR2(100),
DNI		VARCHAR2(9) NOT NULL,
telefono	NUMBER(9) NOT NULL,
tipo_contr	VARCHAR2(100) NOT NULL,
CONSTRAINT PK_CONTRATOS PRIMARY KEY (id_contrato),
CONSTRAINT FK_CONTRATOS_TIPO_CONTRATO FOREIGN KEY (tipo_contr) REFERENCES TIPO_CONTRATO,
CONSTRAINT FK_CONTRATOS_USUARIOS FOREIGN KEY (DNI) REFERENCES PERFIL
);


CREATE TABLE CLUB (
nombre_club	VARCHAR2(100),
creador		VARCHAR2(100) NOT NULL,
tipo		VARCHAR2(100) NOT NULL,
fecha_creac	DATE() NOT NULL,
media_activ	INT,
CONSTRAINT PK_CLUB PRIMARY KEY(nombre_club)
);

CREATE TABLE MIEMBRO (
nombre_club	VARCHAR2(100),
nombre_usuario	VARCHAR2(100),
CONSTRAINT PK_MIEMBRO PRIMARY KEY(nombre_club,nombre_usuario),
CONSTRAINT FK_MIEMBRO FOREIGN KEY(nombre_usuario) REFERENCES USUARIOS
);


CREATE TABLE PELICULAS_PROPUESTAS (
titulo		VARCHAR2(100),
director	VARCHAR2(100),
club		VARCHAR2(100),
propositor	VARCHAR2(100),
momento_prop	DATE(),
mensaje		VARCHAR2(100),
CONSTRAINT PK_PELICULAS_PROPUESTAS PRIMARY KEY(titulo,director,club,propositor,momento_prop),
CONSTRAINT FK_PELICULAS_PROPUESTAS FOREIGN KEY(titulo,director) REFERENCES PELICULA,
CONSTRAINT FK_PELICULAS_PROPUESTAS FOREIGN KEY(club) REFERENCES CLUB,
CONSTRAINT FK_PELICULAS_PROPUESTAS FOREIGN KEY(propositor) REFERENCES USUARIOS
);


CREATE TABLE INVITACIONES (
invitador	VARCHAR2(100),
invitado	VARCHAR2(100),
club		VARCHAR2(100),
momento_prop	DATE(),
mensaje		VARCHAR2(100),
CONSTRAINT PK_INVITACION PRIMARY KEY(invitador,invitado,club,momento_prop),
CONSTRAINT FK_INVITACION FOREIGN KEY(invitador) REFERENCES USUARIOS,
CONSTRAINT FK_INVITACION FOREIGN KEY(invitado) REFERENCES USUARIOS,
CONSTRAINT FK_INVITACION FOREIGN KEY(club) REFERENCES CLUB
);


CREATE TABLE SOLICITUDES (
solicitante	VARCHAR2(100),
club		VARCHAR2(100),
momento_prop	DATE(),
mensaje		VARCHAR2(100),
CONSTRAINT PK_SOLICITUDES PRIMARY KEY(invitador,invitado,club,momento_prop),
CONSTRAINT FK_SOLICITUDES FOREIGN KEY(invitador) REFERENCES USUARIOS,
CONSTRAINT FK_SOLICITUDES FOREIGN KEY(invitado) REFERENCES USUARIOS,
/CONSTRAINT FK_SOLICITUDES FOREIGN KEY(club) REFERENCES CLUB
);


CREATE TABLE CESES (
club		VARCHAR2(100)
momento_cese	DATE()
CONSTRAINT PK_PELICULAS_PROPUESTAS PRIMARY KEY(club,momento_cese),
CONSTRAINT FK_PELICULAS_PROPUESTAS FOREIGN KEY(club) REFERENCES CLUB
);


CREATE TABLE CLUBES_HISTORICOS(
club		VARCHAR2(100)
momento_cese	DATE()
creador		VARCHAR2(100),
tipo		VARCHAR2(100),
fecha_creac	DATE(),
media_activ	INT,
CONSTRAINT PK_PELICULAS_PROPUESTAS PRIMARY KEY(club,momento_cese),
CONSTRAINT FK_PELICULAS_PROPUESTAS FOREIGN KEY(club) REFERENCES CLUB
);










