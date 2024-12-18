/*
	Autor				:	Nicolás Jaiquel
	Descripcion			:	Consulta los datos de la tabla Empleado
	Fecha				:	16-12-2024
*/

CREATE OR ALTER PROCEDURE Sp_GetEmpleados(
	@idEmpleado INT = NULL
)
AS
BEGIN
	IF(@idEmpleado IS NULL)
	BEGIN
		SELECT e.*, ti.nombre as nombreTipoId, ti.abreviacion FROM Empleado e
		INNER JOIN TipoIdentificacion ti ON e.idTipoIdentificacion = ti.idTipoIdentificacion;
	END

	ELSE
	BEGIN
		SELECT e.*, ti.nombre as nombreTipoId, ti.abreviacion FROM Empleado e
		INNER JOIN TipoIdentificacion ti ON e.idTipoIdentificacion = ti.idTipoIdentificacion
		WHERE idEmpleado = @idEmpleado;
	END
END