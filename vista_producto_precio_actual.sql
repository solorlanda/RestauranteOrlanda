USE restauranteorlanda;

CREATE OR REPLACE VIEW vista_producto_precio_actual AS
SELECT
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria,
    pr.precio,
    pr.fecha_inicio,
    pr.fecha_fin
FROM producto p
JOIN categoria cat ON p.id_categoria = cat.id_categoria
JOIN precio pr ON p.id_producto = pr.id_producto
WHERE pr.fecha_fin IS NULL OR pr.fecha_fin > CURDATE();
