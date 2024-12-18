/*  
	
	DROP TABLE Empleado;
	DROP TABLE TipoIdentificacion;

*/


CREATE TABLE TipoIdentificacion(
	idTipoIdentificacion INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(80),
	abreviacion VARCHAR(3),
	fechaCreacion DATETIME,
	fechaEdicion DATETIME
);

ALTER TABLE TipoIdentificacion ADD CONSTRAINT [DF_TipoIdentificacion_Default] DEFAULT GETDATE() FOR fechaCreacion;

INSERT INTO TipoIdentificacion(nombre, abreviacion) SELECT 'Cedula de Ciudadania', 'CC';
SELECT * FROM TipoIdentificacion;

CREATE TABLE Empleado(
	idEmpleado INT PRIMARY KEY IDENTITY,
	idTipoIdentificacion  INT,
	identificacion VARCHAR(11),
	nombres VARCHAR(100),
	apellidos VARCHAR(100),
	fechaCreacion DATETIME,
	fechaEdicion DATETIME
);

ALTER TABLE Empleado ADD CONSTRAINT [DF_Empleado_Default] DEFAULT GETDATE() FOR fechaCreacion;
ALTER TABLE Empleado ADD CONSTRAINT [UC_Empleado] UNIQUE(identificacion);
ALTER TABLE Empleado ADD CONSTRAINT [FK_Empleado_TipoIdentificacion] FOREIGN KEY (idTipoIdentificacion) REFERENCES TipoIdentificacion(idTipoIdentificacion);

INSERT INTO Empleado(idTipoIdentificacion, identificacion, nombres, apellidos) SELECT 1, '1019990889', 'NICOLAS', 'JAIQUEL';
INSERT INTO Empleado(idTipoIdentificacion, identificacion, nombres, apellidos) SELECT 1, '1122334455', 'LAURA', 'SUAREZ';

SELECT e.*, ti.nombre, ti.abreviacion FROM Empleado e
INNER JOIN TipoIdentificacion ti ON e.idTipoIdentificacion = ti.idTipoIdentificacion;

[dbo].[Sp_GetEmpleados]  2

SELECT * FROM Empleado
 [dbo].[Sp_DeleteEmpleados] 5
exec [dbo].[Sp_SaveEmpleados] @idEmpleado=NULL,@idTipoIdentificacion=1,@nombres='JULIAN',@apellidos='JAIQUEL',@identificacion='5544332211'

exec [dbo].[Sp_SaveEmpleados] @idEmpleado=NULL, @idTipoIdentificacion=1,@nombres='JULIAN',@apellidos='JAIQUEL',@identificacion='5544332211'