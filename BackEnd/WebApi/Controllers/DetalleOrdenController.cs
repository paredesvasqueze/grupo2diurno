using Microsoft.AspNetCore.Mvc;
using CapaDomain;
using CapaEntidad;
using Microsoft.AspNetCore.Authorization;

namespace WebApi.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]")]
    public class DetalleOrdenController : ControllerBase
    {
        private readonly DetalleOrdenDomain _DetalleOrdenDomain;

        public DetalleOrdenController(DetalleOrdenDomain DetalleOrdenDomain)
        {
            _DetalleOrdenDomain = DetalleOrdenDomain;
        }

        [HttpGet("ObtenerDetalleOrdenTodos")]
        public IActionResult ObtenerDetalleOrdenTodos()
        {
            var DetalleOrdens = _DetalleOrdenDomain.ObtenerDetalleOrdenTodos();
            return Ok(DetalleOrdens);
        }


        [HttpPost("InsertarDetalleOrden")]
        public IActionResult InsertarDetalleOrden(DetalleOrden oDetalleOrden)
        {
            var id = _DetalleOrdenDomain.InsertarDetalleOrden(oDetalleOrden);
            return Ok(id);
        }
        [HttpPut("ActualizarDetalleOrden")]
        public IActionResult ActualizarDetalleOrden(DetalleOrden oDetalleOrden)
        {
            var id = _DetalleOrdenDomain.ActualizarDetalleOrden(oDetalleOrden);
            return Ok(id);
        }
        [HttpDelete("EliminarDetalleOrden")]
        public IActionResult EliminarDetalleOrden(DetalleOrden oDetalleOrden)
        {
            var id = _DetalleOrdenDomain.EliminarDetalleOrden(oDetalleOrden);
            return Ok(id);
        }
    }
}
