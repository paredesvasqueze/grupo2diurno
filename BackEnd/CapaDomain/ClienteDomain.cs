using CapaEntidad;
using CapaDatos;

namespace CapaDomain
{
    public class ClienteDomain
    {
        private readonly ClienteRepository _ClienteRepository;

        public ClienteDomain(ClienteRepository ClienteRepository)
        {
           
                _ClienteRepository = ClienteRepository;     
        }

        public IEnumerable<Cliente> ObtenerClienteTodos()
        {
            try
            {
                return _ClienteRepository.ObtenerClienteTodos();
            }
            catch (Exception)
            {

                throw;
            }
           
        }

        public int InsertarCliente(Cliente oCliente)
        {
            try
            {
                return _ClienteRepository.InsertarCliente(oCliente);
            }
            catch (Exception)
            {
                throw;
            }
            
        }

        public int ActualizarCliente(Cliente oCliente)
        {
            try
            {
                return _ClienteRepository.ActualizarCliente(oCliente);
            }
            catch (Exception)
            {
                throw;
            }
            
        }
        public int EliminarCliente(Cliente oCliente)
        {
            try
            {
                return _ClienteRepository.EliminarCliente(oCliente);
            }
            catch (Exception)
            {
                throw;
            }

        }
    }
}
