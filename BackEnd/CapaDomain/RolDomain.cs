using CapaEntidad;
using CapaDatos;

namespace CapaDomain
{
    public class RolDomain
    {
        private readonly RolRepository _RolRepository;

        public RolDomain(RolRepository RolRepository)
        {

            _RolRepository = RolRepository;
        }

        public IEnumerable<Rol> ObtenerRolTodos()
        {
            try
            {
                return _RolRepository.ObtenerRolTodos();
            }
            catch (Exception)
            {

                throw;
            }

        }

        public int InsertarRol(Rol oRol)
        {
            try
            {
                return _RolRepository.InsertarRol(oRol);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public int ActualizarRol(Rol oRol)
        {
            try
            {
                return _RolRepository.ActualizarRol(oRol);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public int EliminarRol(Rol oRol)
        {
            try
            {
                return _RolRepository.EliminarRol(oRol);
            }
            catch (Exception)
            {
                throw;
            }

        }
    }
}
