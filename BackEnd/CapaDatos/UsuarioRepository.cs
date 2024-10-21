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
    public class UsuarioRepository
    {
        private readonly ConexionSingleton _conexionSingleton;

        // Constructor que recibe el singleton de conexión
        public UsuarioRepository(ConexionSingleton conexionSingleton)
        {
            _conexionSingleton = conexionSingleton;
        }

        // Método para obtener una lista de Usuarios
        public IEnumerable<Usuario> ObtenerUsuarioTodos()
        {
            var Usuarios = new List<Usuario>();

            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                IEnumerable<Usuario> lstFound = new List<Usuario>();
                var query = "USP_GET_Usuario_Todos";
                var param = new DynamicParameters();
                //param.Add("@nConstGrupo", nConstGrupo, dbType: DbType.Int32);
                lstFound = SqlMapper.Query<Usuario>(connection, query, param, commandType: CommandType.StoredProcedure);
                return lstFound;

            }
        }

        public int InsertarUsuario(Usuario oUsuario)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_InsertUsuario";
                var param = new DynamicParameters();
                param.Add("@cNombreUsuario", oUsuario.cNombreUsuario);
                param.Add("@cContrasenaHash", oUsuario.cContrasenaHash);
                param.Add("@cNombreCompleto", oUsuario.cNombreCompleto);
                param.Add("@dtFechaCreacion", oUsuario.dtFechaCreacion);
                param.Add("@dtUltimoAcceso", oUsuario.dtUltimoAcceso);
                param.Add("@bActivo", oUsuario.bActivo);
                param.Add("@nIdRol", oUsuario.nIdRol);
                //param.Add("@dFechaNacimiento", oUsuario.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }

        public int ActualizarUsuario(Usuario oUsuario)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_UpdateUsuario";
                var param = new DynamicParameters();
                param.Add("@nIdUsuario", oUsuario.nIdUsuario);
                param.Add("@cNombreUsuario", oUsuario.cNombreUsuario);
                param.Add("@cContrasenaHash", oUsuario.cContrasenaHash);
                param.Add("@cNombreCompleto", oUsuario.cNombreCompleto);
                param.Add("@dtFechaCreacion", oUsuario.dtFechaCreacion);
                param.Add("@dtUltimoAcceso", oUsuario.dtUltimoAcceso);
                param.Add("@bActivo", oUsuario.bActivo);
                param.Add("@nIdRol", oUsuario.nIdRol);
                //param.Add("@dFechaNacimiento", oUsuario.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }
        public int EliminarUsuario(Usuario oUsuario)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_DeleteUsuario";
                var param = new DynamicParameters();
                param.Add("@nIdUsuario", oUsuario.nIdUsuario);

                //param.Add("@dFechaNacimiento", oUsuario.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }
    }
}
