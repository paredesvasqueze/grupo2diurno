using CapaEntidad;
using CapaDatos;

namespace CapaDomain
{
    public class OrdenDomain
    {
        private readonly OrdenRepository _OrdenRepository;

        public OrdenDomain(OrdenRepository OrdenRepository)
        {

            _OrdenRepository = OrdenRepository;
        }

        public IEnumerable<Orden> ObtenerOrdenTodos()
        {
            try
            {
                return _OrdenRepository.ObtenerOrdenTodos();
            }
            catch (Exception)
            {

                throw;
            }

        }

        public int InsertarOrden(Orden oOrden)
        {
            try
            {
                return _OrdenRepository.InsertarOrden(oOrden);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public int ActualizarOrden(Orden oOrden)
        {
            try
            {
                return _OrdenRepository.ActualizarOrden(oOrden);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public int EliminarOrden(Orden oOrden)
        {
            try
            {
                return _OrdenRepository.EliminarOrden(oOrden);
            }
            catch (Exception)
            {
                throw;
            }

        }
    }
}
