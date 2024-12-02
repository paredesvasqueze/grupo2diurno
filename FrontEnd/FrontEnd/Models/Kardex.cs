namespace FrontEnd.Models
{
    public class Kardex
    {
        public int nIdKardex { get; set; }
        public int nCantidad { get; set; }
        public int nStockActual { get; set; }
        public string? cTipoMovimiento { get; set; }
        public DateTime dFechaMovimiento { get; set; }
        public int nIdProducto { get; set; }
        public int nIdUsuario { get; set; }
        public string? cNombreProducto { get; set; }
        public string? cNombreUsuario { get; set; }

    }
}
