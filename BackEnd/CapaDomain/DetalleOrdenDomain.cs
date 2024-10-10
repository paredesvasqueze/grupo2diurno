using CapaEntidad;
using CapaDatos;

namespace CapaDomain
{
    public class DetalleOrdenDomain
    {
        private readonly DetalleOrdenRepository _DetalleOrdenRepository;

        public DetalleOrdenDomain(DetalleOrdenRepository DetalleOrdenRepository)
        {

            _DetalleOrdenRepository = DetalleOrdenRepository;
        }

        public IEnumerable<DetalleOrden> ObtenerDetalleOrdenTodos()
        {
            try
            {
                return _DetalleOrdenRepository.ObtenerDetalleOrdenTodos();
            }
            catch (Exception)
            {

                throw;
            }

        }

        public int InsertarDetalleOrden(DetalleOrden oDetalleOrden)
        {
            try
            {
                return _DetalleOrdenRepository.InsertarDetalleOrden(oDetalleOrden);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public int ActualizarDetalleOrden(DetalleOrden oDetalleOrden)
        {
            try
            {
                return _DetalleOrdenRepository.ActualizarDetalleOrden(oDetalleOrden);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public int EliminarDetalleOrden(DetalleOrden oDetalleOrden)
        {
            try
            {
                return _DetalleOrdenRepository.EliminarDetalleOrden(oDetalleOrden);
            }
            catch (Exception)
            {
                throw;
            }

        }
    }
}

