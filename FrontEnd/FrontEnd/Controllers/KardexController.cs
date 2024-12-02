using FrontEnd.Filter;
using FrontEnd.Models;
using FrontEnd.Servicio;
using Microsoft.AspNetCore.Mvc;
using NuGet.Common;

namespace FrontEnd.Controllers
{
    [TypeFilter(typeof(TokenAuthorizationFilter))]
    [ApiController]
    [Route("[controller]")]
    public class KardexController : Controller
    {
        private readonly KardexService _KardexService;
        private readonly ProductoService _ProductoService;
        private readonly UsuarioService _UsuarioService;
        private string _token;

        public KardexController(KardexService KardexService, ProductoService ProductoService,UsuarioService UsuarioService)
        {
            _KardexService = KardexService;
            _ProductoService = ProductoService;
            _UsuarioService = UsuarioService;

            //_token = context.HttpContext.Request.Cookies["AuthToken"];
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            var Kardexs = await _KardexService.GetKardexsAsync(_token);
            var Productos = await _ProductoService.GetProductosAsync(_token);
            ViewBag.Productos = Productos;
            var Usuarios = await _UsuarioService.GetUsuariosAsync(_token);
            ViewBag.Usuarios = Usuarios;
            return View(Kardexs);
        }

        [HttpPost()]
        public async Task<IActionResult> Create([FromBody] Kardex Kardex)
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            if (ModelState.IsValid)
            {
                var result = await _KardexService.CreateKardexAsync(Kardex, _token);
                if (result)
                {
                    return Ok();
                }
            }
            return BadRequest();
        }

        [HttpPut]
        public async Task<IActionResult> Update([FromBody] Kardex Kardex)
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            if (ModelState.IsValid)
            {
                var result = await _KardexService.UpdateKardexAsync(Kardex, _token);
                if (result)
                {
                    return Ok();
                }
            }
            return BadRequest();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            var result = await _KardexService.DeleteKardexAsync(id, _token);
            if (result)
            {
                return Ok();
            }
            return BadRequest();
        }
    }
}

