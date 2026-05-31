use DB taller_mecanico
SELECT p.diagnostico, p.valor, v.matricula, v.modelo
FROM Presupuesto p
JOIN Ficha f ON p.ID_ficha = f.ID
JOIN Vehiculos v ON f.ID_vehiculo = v.ID;
