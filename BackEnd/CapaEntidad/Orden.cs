namespace CapaEntidad
{
    public class Orden
    {
        public int nIdOrden { get; set; }
        public string? cEstado { get; set; }
        public DateTime? dFecha { get; set; }
        public double nTotal { get; set; }
        public int nIdUsuario { get; set; }
        public int nIdCliente { get; set; }

    }
}
