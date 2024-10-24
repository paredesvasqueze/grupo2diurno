using Microsoft.AspNetCore.Mvc;
using CapaDomain;
using CapaEntidad;
using Microsoft.AspNetCore.Authorization;

namespace WebApi.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]")]
    public class ClienteController : ControllerBase
    {
        private readonly ClienteDomain _ClienteDomain;

        public ClienteController(ClienteDomain ClienteDomain)
        {
            _ClienteDomain = ClienteDomain;
        }

        [HttpGet("ObtenerClienteTodos")]
        public IActionResult ObtenerClienteTodos()
        {
            var Clientes = _ClienteDomain.ObtenerClienteTodos();
            return Ok(Clientes);
        }


        [HttpPost("InsertarCliente")]
        public IActionResult InsertarCliente(Cliente oCliente)
        {
            var id = _ClienteDomain.InsertarCliente(oCliente);
            return Ok(id);
        }
        [HttpPut("ActualizarCliente")]
        public IActionResult ActualizarCliente(Cliente oCliente)
        {
            var id = _ClienteDomain.ActualizarCliente(oCliente);
            return Ok(id);
        }
        [HttpDelete("EliminarCliente")]
        public IActionResult EliminarCliente(Cliente oCliente)
        {
            var id = _ClienteDomain.EliminarCliente(oCliente);
            return Ok(id);
        }
    }
}
