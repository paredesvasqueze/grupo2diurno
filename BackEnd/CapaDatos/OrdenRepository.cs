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
    public class OrdenRepository
    {
        private readonly ConexionSingleton _conexionSingleton;

        // Constructor que recibe el singleton de conexión
        public OrdenRepository(ConexionSingleton conexionSingleton)
        {
            _conexionSingleton = conexionSingleton;
        }

        // Método para obtener una lista de Ordens
        public IEnumerable<Orden> ObtenerOrdenTodos()
        {
            var Ordens = new List<Orden>();

            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                IEnumerable<Orden> lstFound = new List<Orden>();
                var query = "USP_GET_Orden_Todos";
                var param = new DynamicParameters();
                //param.Add("@nConstGrupo", nConstGrupo, dbType: DbType.Int32);
                lstFound = SqlMapper.Query<Orden>(connection, query, param, commandType: CommandType.StoredProcedure);
                return lstFound;

            }
        }

        public int InsertarOrden(Orden oOrden)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_InsertOrden";
                var param = new DynamicParameters();
                param.Add("@cEstado", oOrden.cEstado);
                param.Add("@dFecha", oOrden.dFecha);
                param.Add("@nTotal", oOrden.nTotal);
                param.Add("@nIdUsuario", oOrden.nIdUsuario);
                param.Add("@nIdCliente ", oOrden.nIdCliente);
                //param.Add("@dFechaNacimiento", oOrden.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }

        public int ActualizarOrden(Orden oOrden)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_UpdateOrden";
                var param = new DynamicParameters();
                param.Add("@nIdOrden", oOrden.nIdOrden);
                param.Add("@cEstado", oOrden.cEstado);
                param.Add("@dFecha", oOrden.dFecha);
                param.Add("@nTotal", oOrden.nTotal);
                param.Add("@nIdUsuario", oOrden.nIdUsuario);
                param.Add("@nIdCliente ", oOrden.nIdCliente);
                //param.Add("@dFechaNacimiento", oOrden.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }
        public int EliminarOrden(Orden oOrden)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_DeleteOrden";
                var param = new DynamicParameters();
                param.Add("@nIdOrden", oOrden.nIdOrden);

                //param.Add("@dFechaNacimiento", oOrden.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }
    }
}
