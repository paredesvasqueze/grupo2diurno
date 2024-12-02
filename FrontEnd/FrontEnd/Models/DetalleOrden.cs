namespace FrontEnd.Models
{
    public class DetalleOrden
    {
        public int nIdDetalleorden { get; set; }
        public int nCantidad { get; set; }
        public double nPrecioUnitario { get; set; }
        public int nIdProducto { get; set; }
        public int nIdOrden { get; set; }

        public string? cNombreProducto { get; set; }

        public string? cOrden { get; set; }

    }
}
