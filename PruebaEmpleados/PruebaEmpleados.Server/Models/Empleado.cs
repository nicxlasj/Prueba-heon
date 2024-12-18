namespace PruebaHeonAnalista.Server.Models
{
    public class Empleado
    {
        public int? idEmpleado { get; set; }
        public int? idTipoIdentificacion { get; set; }
        public string? identificacion { get; set; }
        public string? nombres { get; set; }
        public string? apellidos { get; set; }
        public DateTime fechaCreacion { get; set; }
        public DateTime fechaEdicion { get; set; }
        public string? nombreTipoId { get; set; }
        public string? abreviacion { get; set; }
    }
}
