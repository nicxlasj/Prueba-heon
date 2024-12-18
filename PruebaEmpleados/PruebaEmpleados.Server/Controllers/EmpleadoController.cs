using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using PruebaHeonAnalista.Server.Models;
using PruebaHeonAnalista.Server.Services;
using System.Collections.Specialized;
using System.ComponentModel;

namespace PruebaHeonAnalista.Server.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class EmpleadoController : ControllerBase
    {
        private readonly EmpleadoService _service;
        public EmpleadoController(EmpleadoService empleadoService)
        {
            _service = empleadoService;
        }

        [HttpGet]
        public async Task<List<Empleado>> GetEmpleados()
        {
            return await _service.GetEmpleados(null);
        }

        [HttpGet("{idEmpleado}")]
        public async Task<List<Empleado>> GetEmpleados(int idEmpleado)
        {
            return await _service.GetEmpleados(idEmpleado);
        }

        [HttpPost]
        public async Task SaveEmpleado([FromBody] Empleado empleado) 
        {
            await _service.SaveEmpleado(empleado);
        }

        [HttpDelete("{idEmpleado}")]
        public async Task DeleteEmpleado(int idEmpleado)
        {
            await _service.DeleteEmpleado(idEmpleado);
        }
    }
}
