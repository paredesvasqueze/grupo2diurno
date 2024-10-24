using Microsoft.AspNetCore.Mvc;
using CapaDomain;
using CapaEntidad;
using Microsoft.AspNetCore.Authorization;

namespace WebApi.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]")]
    public class UsuarioController : ControllerBase
    {
        private readonly UsuarioDomain _UsuarioDomain;

        public UsuarioController(UsuarioDomain UsuarioDomain)
        {
            _UsuarioDomain = UsuarioDomain;
        }

        [HttpGet("ObtenerUsuarioTodos")]
        public IActionResult ObtenerUsuarioTodos()
        {
            var Usuarios = _UsuarioDomain.ObtenerUsuarioTodos();
            return Ok(Usuarios);
        }


        [HttpPost("InsertarUsuario")]
        public IActionResult InsertarUsuario(Usuario oUsuario)
        {
            var id = _UsuarioDomain.InsertarUsuario(oUsuario);
            return Ok(id);
        }
        [HttpPut("ActualizarUsuario")]
        public IActionResult ActualizarUsuario(Usuario oUsuario)
        {
            var id = _UsuarioDomain.ActualizarUsuario(oUsuario);
            return Ok(id);
        }
        [HttpDelete("EliminarUsuario")]
        public IActionResult EliminarUsuario(Usuario oUsuario)
        {
            var id = _UsuarioDomain.EliminarUsuario(oUsuario);
            return Ok(id);
        }
    }
}
