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
    public class OrdenController : Controller
    {
        private readonly OrdenService _OrdenService;
        private readonly UsuarioService _UsuarioService;
        private readonly ClienteService _ClienteService;
        private string _token;

        public OrdenController(OrdenService OrdenService, UsuarioService UsuarioService, ClienteService ClienteService)
        {
            _OrdenService = OrdenService;
            _UsuarioService = UsuarioService;
            _ClienteService = ClienteService;

            //_token = context.HttpContext.Request.Cookies["AuthToken"];
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            var Ordens = await _OrdenService.GetOrdensAsync(_token);
            var Usuarios = await _UsuarioService.GetUsuariosAsync(_token);
            ViewBag.Usuarios = Usuarios;
            var Clientes = await _ClienteService.GetClientesAsync(_token);
            ViewBag.Clientes = Clientes;
            return View(Ordens);
        }

        [HttpPost()]
        public async Task<IActionResult> Create([FromBody] Orden Orden)
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            if (ModelState.IsValid)
            {
                var result = await _OrdenService.CreateOrdenAsync(Orden, _token);
                if (result)
                {
                    return Ok();
                }
            }
            return BadRequest();
        }

        [HttpPut]
        public async Task<IActionResult> Update([FromBody] Orden Orden)
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            if (ModelState.IsValid)
            {
                var result = await _OrdenService.UpdateOrdenAsync(Orden, _token);
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
            var result = await _OrdenService.DeleteOrdenAsync(id, _token);
            if (result)
            {
                return Ok();
            }
            return BadRequest();
        }
    }
}
