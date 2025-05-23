USE restauranteorlanda;

CREATE OR REPLACE VIEW vista_empleados_turno AS
SELECT
    e.id_empleado,
    CONCAT(e.nombre, ' ', e.apellido) AS empleado,
    e.puesto,
    t.horario_inicio,
    t.horario_fin
FROM empleado e
JOIN empleado_turno et ON e.id_empleado = et.id_empleado
JOIN turno t ON et.id_turno = t.id_turno;
