USE RestauranteOrlanda;
calcular_total_pedidoregistrar_nuevo_pedidoregistrar_nuevo_pedidoregistrar_nuevo_pedido
DELIMITER //
CREATE FUNCTION calcular_total_pedido(pedido_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(pp.cantidad * prod.precio) INTO total
    FROM pedido_producto pp
    JOIN producto prod ON pp.id_producto = prod.id_producto
    WHERE pp.id_pedido = pedido_id;
    RETURN total;
END //
DELIMITER ;
