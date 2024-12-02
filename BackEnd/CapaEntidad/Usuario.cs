using System;

namespace CapaEntidad
{
    public class Usuario
    {
        public int nIdUsuario { get; set; }
        public string? cNombreUsuario { get; set; }
        public string? cContrasenaHash { get; set; }
        public string? cNombreCompleto { get; set; }
        public DateTime? dtFechaCreacion { get; set; }
        public DateTime? dtUltimoAcceso { get; set; }
        public bool bActivo { get; set; }
        public int nIdRol { get; set; }
        public string cDescripcionRol { get; set; }


    }
}
