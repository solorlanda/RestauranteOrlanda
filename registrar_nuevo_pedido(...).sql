USE RestauranteOrlanda;

DELIMITER //
CREATE PROCEDURE registrar_nuevo_pedido (
    IN p_fecha DATETIME,
    IN p_id_cliente INT,
    IN p_id_empleado INT,
    IN p_id_mesa INT,
    IN p_id_metodo_pago INT,
    IN p_total DECIMAL(10,2),
    OUT p_id_pedido INT
)
BEGIN
    INSERT INTO pedido (fecha, id_cliente, id_empleado, id_mesa, id_metodo_pago, total)
    VALUES (p_fecha, p_id_cliente, p_id_empleado, p_id_mesa, p_id_metodo_pago, p_total);
    SET p_id_pedido = LAST_INSERT_ID();
END //
DELIMITER ;