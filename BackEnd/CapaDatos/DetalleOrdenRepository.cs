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
    public class DetalleOrdenRepository
    {
        private readonly ConexionSingleton _conexionSingleton;

        // Constructor que recibe el singleton de conexión
        public DetalleOrdenRepository(ConexionSingleton conexionSingleton)
        {
            _conexionSingleton = conexionSingleton;
        }

        // Método para obtener una lista de DetalleOrdens
        public IEnumerable<DetalleOrden> ObtenerDetalleOrdenTodos()
        {
            var DetalleOrdens = new List<DetalleOrden>();

            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                IEnumerable<DetalleOrden> lstFound = new List<DetalleOrden>();
                var query = "USP_GET_DetalleOrden_Todos";
                var param = new DynamicParameters();
                //param.Add("@nConstGrupo", nConstGrupo, dbType: DbType.Int32);
                lstFound = SqlMapper.Query<DetalleOrden>(connection, query, param, commandType: CommandType.StoredProcedure);
                return lstFound;

            }
        }

        public int InsertarDetalleOrden(DetalleOrden oDetalleOrden)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_InsertDetalleOrden";
                var param = new DynamicParameters();
                param.Add("@nCantidad ", oDetalleOrden.nCantidad);
                param.Add("@nPrecioUnitario", oDetalleOrden.nPrecioUnitario);
                param.Add("@nIdProducto", oDetalleOrden.nIdProducto);
                param.Add("@nIdOrden", oDetalleOrden.nIdOrden);
                
                //param.Add("@dFechaNacimiento", oDetalleOrden.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }

        public int ActualizarDetalleOrden(DetalleOrden oDetalleOrden)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_UpdateDetalleOrden";
                var param = new DynamicParameters();
                param.Add("@nIdDetalleorden", oDetalleOrden.nIdDetalleorden);
                param.Add("@nCantidad ", oDetalleOrden.nCantidad);
                param.Add("@nPrecioUnitario", oDetalleOrden.nPrecioUnitario);
                param.Add("@nIdProducto", oDetalleOrden.nIdProducto);
                param.Add("@nIdOrden", oDetalleOrden.nIdOrden);
                //param.Add("@dFechaNacimiento", oDetalleOrden.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }
        public int EliminarDetalleOrden(DetalleOrden oDetalleOrden)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_DeleteDetalleOrden";
                var param = new DynamicParameters();
                param.Add("@nIdDetalleorden", oDetalleOrden.nIdDetalleorden);

                //param.Add("@dFechaNacimiento", oDetalleOrden.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }
    }
}
