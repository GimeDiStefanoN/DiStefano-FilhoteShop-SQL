# CREO LA BASE DE DATOS
CREATE DATABASE IF NOT EXISTS filhote_shop;

#SELECCIONO LA BASE DE DATOS
USE filhote_shop;

#CREO LAS TABLAS
	#tabla productos
CREATE TABLE IF NOT EXISTS productos(
	id_producto INT NOT NULL  AUTO_INCREMENT,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria_producto VARCHAR(40) NOT NULL,
    detalle_producto VARCHAR(900),
    precio_producto DECIMAL(10, 2),
    stock_producto INT,
    url_imagen_producto VARCHAR(200),
    PRIMARY KEY(id_producto)
);
	#tabla usuarios
CREATE TABLE IF NOT EXISTS usuarios(
	id_usuario INT NOT NULL  AUTO_INCREMENT,
    nombre_usuario VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    pais VARCHAR(50),
    provincia VARCHAR(50),
    genero ENUM('FEMENINO','MASCULINO','OTRO'),
    nacimiento DATE,
    telefono VARCHAR(20),
    PRIMARY KEY(id_usuario)
);
#Para una futura actualizacion deberia crear tabla paises, provincias y generos, y asociarla a usuarios.

	#tabla carrito
CREATE TABLE IF NOT EXISTS carrito_compras(
	id INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_producto INT NOT NULL,
    nombre_producto VARCHAR(100) NOT NULL,
    precio_producto DECIMAL(10, 2) NOT NULL,
    url_imagen_producto VARCHAR(200),
    categoria_producto VARCHAR(40) NOT NULL,
    stock_producto INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_producto) REFERENCES productos (id_producto)
);

#INSERTO LOS DATOS
	#En tabla productos (aca tengo dudas en como insertar 2 categorias al producto 3)
INSERT INTO productos (nombre_producto, categoria_producto, detalle_producto, precio_producto, stock_producto, url_imagen_producto)
VALUES ('Correa Larga para Perros','PERROS','Correa de 5 metros para perros, con enganche seguro, reforzada. Varios colores.','1500','500','https://ibb.co/rwn0csv'),
	   ('Alimento Balanceado para Gatos 7.5kg','GATOS','Bolsa de Alimento balanceado de 7.5 kg para gatos adultos castrados. Sabor pescado','12000','40','https://ibb.co/5KmShby'),
	   ('Cepillo Autolimpiante Macostas Perros Gatos','GATOS Y PERROS','Peine/Cardina autolimpiante con cerdas de acero inoxidable y mango ergonómico. Elimina enredos, suciedad y pelo suelto','2500','100','https://ibb.co/zhxb3Yy'),
       ('Jaula para roedores N2','EXOTICOS','Casita ideal para tu roedor, de un nivel, con bebedor automático y desmontable para facil limpieza','11800','500','https://ibb.co/N13ZBVP'),
	   ('Cucha Moises para Perros','PERROS','Cucha/Moises para perros de diversos tamaños. Confeccionado con materiales premium, tela antidesgarro, resistente, con cierre para un facil lavado. Varios colores.','10000','30','https://ibb.co/2j4x5c2');

	#En la tabla usuarios
INSERT INTO usuarios (nombre_usuario, username, password, email, pais, provincia, genero, nacimiento, telefono)
VALUES ('Admin', 'Admin', 'Admin', 'admin@admin.com', 'Argentina', 'CORDOBA', 'OTRO', '2000-01-01', '0123456789'),
	   ('Gimena Di Stefano', 'GimeDN', '12345' , 'gimedn@gmail.com', 'Argentina', 'CORDOBA', 'FEMENINO', '1988-06-19', '0000303456');
       
# MOSTRAR DATOS DE LAS TABLAS
	#Tabla usuarios
SELECT * FROM filhote_shop.usuarios;
	#Tabla productos
SELECT * FROM filhote_shop.productos;