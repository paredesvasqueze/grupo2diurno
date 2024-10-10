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
    public class KardexRepository
    {
        private readonly ConexionSingleton _conexionSingleton;

        // Constructor que recibe el singleton de conexión
        public KardexRepository(ConexionSingleton conexionSingleton)
        {
            _conexionSingleton = conexionSingleton;
        }

        // Método para obtener una lista de Kardexs
        public IEnumerable<Kardex> ObtenerKardexTodos()
        {
            var Kardexs = new List<Kardex>();

            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                IEnumerable<Kardex> lstFound = new List<Kardex>();
                var query = "USP_GET_Kardex_Todos";
                var param = new DynamicParameters();
                //param.Add("@nConstGrupo", nConstGrupo, dbType: DbType.Int32);
                lstFound = SqlMapper.Query<Kardex>(connection, query, param, commandType: CommandType.StoredProcedure);
                return lstFound;

            }
        }

        public int InsertarKardex(Kardex oKardex)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_InsertKardex";
                var param = new DynamicParameters();
                param.Add("@nCantidad ", oKardex.nCantidad);
                param.Add("@nStockActual", oKardex.nStockActual);
                param.Add("@cTipoMovimiento", oKardex.cTipoMovimiento);
                param.Add("@dFechaMovimiento ", oKardex.dFechaMovimiento);
                param.Add("@nIdProducto", oKardex.nIdProducto);
                param.Add("@nIdUsuario", oKardex.nIdUsuario);
                //param.Add("@dFechaNacimiento", oKardex.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }

        public int ActualizarKardex(Kardex oKardex)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_UpdateKardex";
                var param = new DynamicParameters();
                param.Add("@nIdKardex", oKardex.nIdKardex);
                param.Add("@nCantidad ", oKardex.nCantidad);
                param.Add("@nStockActual", oKardex.nStockActual);
                param.Add("@cTipoMovimiento", oKardex.cTipoMovimiento);
                param.Add("@dFechaMovimiento ", oKardex.dFechaMovimiento);
                param.Add("@nIdProducto", oKardex.nIdProducto);
                param.Add("@nIdUsuario", oKardex.nIdUsuario);
                //param.Add("@dFechaNacimiento", oKardex.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }
        public int EliminarKardex(Kardex oKardex)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_DeleteKardex";
                var param = new DynamicParameters();
                param.Add("@nIdKardex", oKardex.nIdKardex);

                //param.Add("@dFechaNacimiento", oKardex.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }
    }
}
