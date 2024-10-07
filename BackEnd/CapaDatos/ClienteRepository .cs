using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using CapaEntidad;
using Dapper;

namespace CapaDatos
{
    public class ClienteRepository
    {
        private readonly ConexionSingleton _conexionSingleton;

        // Constructor que recibe el singleton de conexión
        public ClienteRepository(ConexionSingleton conexionSingleton)
        {
            _conexionSingleton = conexionSingleton;
        }

        // Método para obtener una lista de Clientes
        public IEnumerable<Cliente> ObtenerClienteTodos()
        {
            var Clientes = new List<Cliente>();

            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                IEnumerable<Cliente> lstFound = new List<Cliente>();
                var query = "USP_GET_Cliente_Todos";
                var param = new DynamicParameters();
                //param.Add("@nConstGrupo", nConstGrupo, dbType: DbType.Int32);
                lstFound = SqlMapper.Query<Cliente>(connection, query, param, commandType: CommandType.StoredProcedure);
                return lstFound;              
                
            }
        }

        public int InsertarCliente(Cliente oCliente)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                
                var query = "sp_InsertCliente";
                var param = new DynamicParameters();
                param.Add("@cNombre", oCliente.cNombre);
                param.Add("@cApellido", oCliente.cApellido);
                param.Add("@cDireccion", oCliente.cDireccion);
                param.Add("@cEmail", oCliente.cEmail);
                param.Add("@cTelefono", oCliente.cTelefono);
                //param.Add("@dFechaNacimiento", oCliente.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);                
            }


        }

        public int ActualizarCliente(Cliente oCliente)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_UpdateCliente";
                var param = new DynamicParameters();
                param.Add("@cNombre", oCliente.cNombre);
                param.Add("@cApellido", oCliente.cApellido);
                param.Add("@cDireccion", oCliente.cDireccion);
                param.Add("@cEmail", oCliente.cEmail);
                param.Add("@cTelefono", oCliente.cTelefono);
                //param.Add("@dFechaNacimiento", oCliente.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }
        public int EliminarCliente(Cliente oCliente)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_DeleteCliente";
                var param = new DynamicParameters();
                param.Add("@cNombre", oCliente.cNombre);
                param.Add("@cApellido", oCliente.cApellido);
                param.Add("@cDireccion", oCliente.cDireccion);
                param.Add("@cEmail", oCliente.cEmail);
                param.Add("@cTelefono", oCliente.cTelefono);
                //param.Add("@dFechaNacimiento", oCliente.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }
    }
}
