-- Creación de base de datos
CREATE DATABASE IF NOT EXISTS RestauranteOrlanda;
USE RestauranteOrlanda;

-- Tabla: cliente
CREATE TABLE cliente (
    id_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla: categoria
CREATE TABLE categoria (
    id_categoria INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50)
);

-- Tabla: producto
CREATE TABLE producto (
    id_producto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio DECIMAL(10,2),
    id_categoria INT UNSIGNED,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

-- Tabla: mesa
CREATE TABLE mesa (
    id_mesa INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    numero INT,
    capacidad INT
);

-- Tabla: empleado
CREATE TABLE empleado (
    id_empleado INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    puesto VARCHAR(50)
);

-- Tabla: turno
CREATE TABLE turno (
    id_turno INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    horario_inicio TIME,
    horario_fin TIME
);

-- Tabla intermedia: empleado_turno
CREATE TABLE empleado_turno (
    id_empleado INT UNSIGNED,
    id_turno INT UNSIGNED,
    PRIMARY KEY (id_empleado, id_turno),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_turno) REFERENCES turno(id_turno)
);

-- Tabla: metodo_pago
CREATE TABLE metodo_pago (
    id_metodo_pago INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50)
);

-- Tabla: pedido
CREATE TABLE pedido (
    id_pedido INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME,
    id_cliente INT UNSIGNED,
    id_empleado INT UNSIGNED,
    id_mesa INT UNSIGNED,
    id_metodo_pago INT UNSIGNED,
    total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_mesa) REFERENCES mesa(id_mesa),
    FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pago(id_metodo_pago)
);

-- Tabla intermedia: pedido_producto
CREATE TABLE pedido_producto (
    id_pedido INT UNSIGNED,
    id_producto INT UNSIGNED,
    cantidad INT,
    PRIMARY KEY (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- Tabla: proveedor
CREATE TABLE proveedor (
    id_proveedor INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla intermedia: producto_proveedor
CREATE TABLE producto_proveedor (
    id_producto INT UNSIGNED,
    id_proveedor INT UNSIGNED,
    PRIMARY KEY (id_producto, id_proveedor),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

-- Tabla: precio
CREATE TABLE precio (
    id_precio INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_producto INT UNSIGNED,
    precio DECIMAL(10, 2),
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- Tabla: orden_pago
CREATE TABLE orden_pago (
    id_orden_pago INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT UNSIGNED,
    id_metodo_pago INT UNSIGNED,
    monto DECIMAL(10, 2),
    estado_pago ENUM('pendiente', 'pagado', 'cancelado') DEFAULT 'pendiente',
    fecha_pago DATETIME,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pago(id_metodo_pago)
);