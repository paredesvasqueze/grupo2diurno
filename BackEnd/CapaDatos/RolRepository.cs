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
    public class RolRepository
    {
        private readonly ConexionSingleton _conexionSingleton;

        // Constructor que recibe el singleton de conexión
        public RolRepository(ConexionSingleton conexionSingleton)
        {
            _conexionSingleton = conexionSingleton;
        }

        // Método para obtener una lista de Rols
        public IEnumerable<Rol> ObtenerRolTodos()
        {
            var Rols = new List<Rol>();

            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                IEnumerable<Rol> lstFound = new List<Rol>();
                var query = "USP_GET_Rol_Todos";
                var param = new DynamicParameters();
                //param.Add("@nConstGrupo", nConstGrupo, dbType: DbType.Int32);
                lstFound = SqlMapper.Query<Rol>(connection, query, param, commandType: CommandType.StoredProcedure);
                return lstFound;

            }
        }

        public int InsertarRol(Rol oRol)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_InsertRol";
                var param = new DynamicParameters();
                param.Add("@cDescripcion", oRol.cDescripcion);

                //param.Add("@dFechaNacimiento", oRol.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }

        public int ActualizarRol(Rol oRol)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_UpdateRol";
                var param = new DynamicParameters();
                param.Add("@nIdRol", oRol.nIdRol);
                param.Add("@cDescripcion", oRol.cDescripcion);

                //param.Add("@dFechaNacimiento", oRol.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }
        public int EliminarRol(Rol oRol)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_DeleteRol";
                var param = new DynamicParameters();
                param.Add("@nIdRol", oRol.nIdRol);

                //param.Add("@dFechaNacimiento", oRol.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }
    }
}
