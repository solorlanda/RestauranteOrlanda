-- Poblar tabla cliente
INSERT INTO cliente (nombre, apellido, email, telefono) VALUES
('Laura', 'Gómez', 'laura.gomez@gmail.com', '3511234567'),
('Carlos', 'Pérez', 'carlos.perez@hotmail.com', '3512345678'),
('Ana', 'Rodríguez', 'ana.r@gmail.com', '3513456789'),
('Mariano', 'Sosa', 'mariano.sosa@yahoo.com', '3514567890');

-- Poblar tabla categoria
INSERT INTO categoria (nombre_categoria) VALUES
('Entradas'),
('Platos Principales'),
('Postres'),
('Bebidas');

-- Poblar tabla producto
INSERT INTO producto (nombre_producto, precio, id_categoria) VALUES
('Empanadas de carne', 1200.00, 1),
('Milanesa con papas', 3500.00, 2),
('Ravioles con salsa', 4000.00, 2),
('Flan casero', 1500.00, 3),
('Coca-Cola 500ml', 800.00, 4),
('Agua sin gas 500ml', 700.00, 4);

-- Poblar tabla empleado
INSERT INTO empleado (nombre, apellido, puesto) VALUES
('Sofía', 'Martínez', 'Camarera'),
('Julián', 'Fernández', 'Cocinero'),
('Marcela', 'Ruiz', 'Cajera'),
('Tomás', 'López', 'Camarero');

-- Poblar tabla mesa
INSERT INTO mesa (numero, capacidad) VALUES
(1, 4),
(2, 2),
(3, 6);

-- Poblar tabla metodo_pago
INSERT INTO metodo_pago (descripcion) VALUES
('Efectivo'),
('Tarjeta de crédito'),
('Transferencia bancaria');

-- Poblar tabla pedido
INSERT INTO pedido (fecha, id_cliente, id_empleado, id_mesa, id_metodo_pago, total) VALUES
('2025-04-10 12:45:00', 1, 1, 1, 1, 5300.00),
('2025-04-10 13:15:00', 2, 2, 2, 2, 4800.00),
('2025-04-11 19:30:00', 3, 3, 3, 3, 2300.00);

-- Poblar tabla precio
INSERT INTO precio (id_producto, precio, fecha_inicio) VALUES
(1, 2500.00, '2025-04-01'),
(2, 3000.00, '2025-04-01'),
(3, 2000.00, '2025-04-01');

-- Poblar tabla orden_pago
INSERT INTO orden_pago (id_pedido, id_metodo_pago, monto, estado_pago, fecha_pago) VALUES
(1, 1, 5300.00, 'pagado', '2025-04-10 13:00:00'),
(2, 2, 4800.00, 'pendiente', '2025-04-10 13:20:00');