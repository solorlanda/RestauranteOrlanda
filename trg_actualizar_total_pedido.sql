USE RestauranteOrlanda;

DELIMITER //
CREATE TRIGGER trg_actualizar_total_pedido
AFTER INSERT ON pedido_producto
FOR EACH ROW
BEGIN
    DECLARE nuevo_total DECIMAL(10,2);
    SELECT SUM(pp.cantidad * prod.precio)
    INTO nuevo_total
    FROM pedido_producto pp
    JOIN producto prod ON pp.id_producto = prod.id_producto
    WHERE pp.id_pedido = NEW.id_pedido;

    UPDATE pedido
    SET total = nuevo_total
    WHERE id_pedido = NEW.id_pedido;
END //
DELIMITER ;
