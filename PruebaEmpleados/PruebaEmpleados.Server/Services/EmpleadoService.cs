using Dapper;
using Microsoft.Data.SqlClient;
using PruebaHeonAnalista.Server.Models;

namespace PruebaHeonAnalista.Server.Services
{
    public class EmpleadoService
    {
        private string _connectionString;
        private IConfiguration configuration;   
        public EmpleadoService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("db")!;
            this.configuration = configuration;
        }

        public async Task<List<Empleado>> GetEmpleados(int? id) 
        {      
            using var db = new SqlConnection(this._connectionString);
            var result = await db.QueryAsync<Empleado>("[dbo].[Sp_GetEmpleados]", new { idEmpleado = id }, commandType: System.Data.CommandType.StoredProcedure);
            return result.ToList();
        } 

        public async Task SaveEmpleado(Empleado empleado)
        {
            using var db = new SqlConnection(this._connectionString);
            var result = await db.QueryAsync<Empleado>("[dbo].[Sp_SaveEmpleados]", new 
            { 
                idEmpleado = empleado.idEmpleado,
                idTipoIdentificacion = empleado.idTipoIdentificacion,
                nombres = empleado.nombres,
                apellidos = empleado.apellidos,
                identificacion = empleado.identificacion
            }, commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task DeleteEmpleado(int id)
        {
            using var db = new SqlConnection(this._connectionString);
            var result = await db.QueryAsync<int>("[dbo].[Sp_DeleteEmpleados]", new { idEmpleado = id });
        }
    }
}
