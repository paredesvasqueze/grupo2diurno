using Microsoft.AspNetCore.Mvc;
using CapaDomain;
using CapaEntidad;
using Microsoft.AspNetCore.Authorization;

namespace WebApi.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]")]
    public class KardexController : ControllerBase
    {
        private readonly KardexDomain _KardexDomain;

        public KardexController(KardexDomain KardexDomain)
        {
            _KardexDomain = KardexDomain;
        }

        [HttpGet("ObtenerKardexTodos")]
        public IActionResult ObtenerKardexTodos()
        {
            var Kardexs = _KardexDomain.ObtenerKardexTodos();
            return Ok(Kardexs);
        }


        [HttpPost("InsertarKardex")]
        public IActionResult InsertarKardex(Kardex oKardex)
        {
            var id = _KardexDomain.InsertarKardex(oKardex);
            return Ok(id);
        }
        [HttpPut("ActualizarKardex")]
        public IActionResult ActualizarKardex(Kardex oKardex)
        {
            var id = _KardexDomain.ActualizarKardex(oKardex);
            return Ok(id);
        }
        [HttpDelete("EliminarKardex/{nIdKardex}")]
        public IActionResult EliminarKardex(int nIdKardex)
        {
            Kardex oKardex = new Kardex() { nIdKardex = nIdKardex };
            var id = _KardexDomain.EliminarKardex(oKardex);
            return Ok(id);
        }
    }
}