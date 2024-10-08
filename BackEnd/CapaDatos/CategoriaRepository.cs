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
    public class CategoriaRepository
    {
        private readonly ConexionSingleton _conexionSingleton;

        // Constructor que recibe el singleton de conexión
        public CategoriaRepository(ConexionSingleton conexionSingleton)
        {
            _conexionSingleton = conexionSingleton;
        }

        // Método para obtener una lista de Categorias
        public IEnumerable<Categoria> ObtenerCategoriaTodos()
        {
            var Categorias = new List<Categoria>();

            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                IEnumerable<Categoria> lstFound = new List<Categoria>();
                var query = "USP_GET_Categoria_Todos";
                var param = new DynamicParameters();
                //param.Add("@nConstGrupo", nConstGrupo, dbType: DbType.Int32);
                lstFound = SqlMapper.Query<Categoria>(connection, query, param, commandType: CommandType.StoredProcedure);
                return lstFound;

            }
        }

        public int InsertarCategoria(Categoria oCategoria)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_InsertCategoria";
                var param = new DynamicParameters();
                param.Add("@cNombre", oCategoria.cNombre);
                
                //param.Add("@dFechaNacimiento", oCategoria.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }

        public int ActualizarCategoria(Categoria oCategoria)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_UpdateCategoria";
                var param = new DynamicParameters();
                param.Add("@nIdCategoria", oCategoria.nIdCategoria);
                param.Add("@cNombre", oCategoria.cNombre);
                
                //param.Add("@dFechaNacimiento", oCategoria.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }
        public int EliminarCategoria(Categoria oCategoria)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "sp_DeleteCategoria";
                var param = new DynamicParameters();
                param.Add("@nIdCategoria", oCategoria.nIdCategoria);
                
                //param.Add("@dFechaNacimiento", oCategoria.dFechaNacimiento);                
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }


        }
    }
}
