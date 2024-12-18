/*
	Autor				:	Nicolás Jaiquel
	Descripcion			:	Guarda los datos de la tabla Empleado
	Fecha				:	16-12-2024
*/

ALTER PROCEDURE Sp_SaveEmpleados(
	@idEmpleado INT = NULL,
	@idTipoIdentificacion INT,
	@nombres VARCHAR(100),
	@apellidos VARCHAR(100),
	@identificacion VARCHAR(11)
)
AS
BEGIN
	IF(@idEmpleado IS NULL OR @idEmpleado = 0)
	BEGIN
		INSERT INTO Empleado(idTipoIdentificacion, nombres, apellidos, identificacion) 
			SELECT @idTipoIdentificacion, @nombres, @apellidos, @identificacion;	
			SET @idEmpleado = SCOPE_IDENTITY();
	END

	ELSE
	BEGIN
		UPDATE Empleado SET 
		idTipoIdentificacion = @idTipoIdentificacion,
		nombres = @nombres,
		apellidos = @apellidos,
		identificacion = @identificacion,
		fechaEdicion = GETDATE()
		WHERE idEmpleado = @idEmpleado;

	END

	EXEC [dbo].[Sp_GetEmpleados] @idEmpleado;

END