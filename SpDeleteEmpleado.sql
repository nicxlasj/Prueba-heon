/*
	Autor				:	Nicolás Jaiquel
	Descripcion			:	Elimina los registros de la tabla Empleado
	Fecha				:	16-12-2024
*/

CREATE OR ALTER PROCEDURE Sp_DeleteEmpleados(
	@idEmpleado INT
)AS
BEGIN
	DELETE Empleado WHERE idEmpleado= @idEmpleado;
	SELECT @idEmpleado;
END