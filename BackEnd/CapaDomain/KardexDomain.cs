using CapaEntidad;
using CapaDatos;

namespace CapaDomain
{
    public class KardexDomain
    {
        private readonly KardexRepository _KardexRepository;

        public KardexDomain(KardexRepository KardexRepository)
        {

            _KardexRepository = KardexRepository;
        }

        public IEnumerable<Kardex> ObtenerKardexTodos()
        {
            try
            {
                return _KardexRepository.ObtenerKardexTodos();
            }
            catch (Exception)
            {

                throw;
            }

        }

        public int InsertarKardex(Kardex oKardex)
        {
            try
            {
                return _KardexRepository.InsertarKardex(oKardex);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public int ActualizarKardex(Kardex oKardex)
        {
            try
            {
                return _KardexRepository.ActualizarKardex(oKardex);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public int EliminarKardex(Kardex oKardex)
        {
            try
            {
                return _KardexRepository.EliminarKardex(oKardex);
            }
            catch (Exception)
            {
                throw;
            }

        }
    }
}
