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

        [HttpGet("ObtenerDetalleOrdenById/{nIdDetalleorden}")]
        public IActionResult ObtenerDetalleOrdenById(int nIdDetalleorden)
        {
            var DetalleOrdens = _DetalleOrdenDomain.ObtenerDetalleOrdenById(nIdDetalleorden);
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
        [HttpDelete("EliminarDetalleOrden/{nIdDetalleorden}")]
        public IActionResult EliminarDetalleOrden(int nIdDetalleorden)
        {
            DetalleOrden oDetalleOrden = new DetalleOrden() { nIdDetalleorden = nIdDetalleorden };

            var id = _DetalleOrdenDomain.EliminarDetalleOrden(oDetalleOrden);
            return Ok(id);
        }
    }
}
