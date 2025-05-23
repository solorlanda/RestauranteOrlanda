USE restauranteorlanda;

CREATE OR REPLACE VIEW vista_pedidos_detalle AS
SELECT
    p.id_pedido,
    CONCAT(c.nombre, ' ', c.apellido) AS cliente,
    m.numero AS numero_mesa,
    p.fecha,
    p.total,
    GROUP_CONCAT(prod.nombre_producto SEPARATOR ', ') AS productos
FROM pedido p
JOIN cliente c ON p.id_cliente = c.id_cliente
JOIN mesa m ON p.id_mesa = m.id_mesa
JOIN pedido_producto pp ON p.id_pedido = pp.id_pedido
JOIN producto prod ON pp.id_producto = prod.id_producto
GROUP BY p.id_pedido;
