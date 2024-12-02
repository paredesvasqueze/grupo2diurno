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
    public class UsuarioController : Controller
    {
        private readonly UsuarioService _UsuarioService;
        private readonly RolService _RolService;
        private string _token;

        public UsuarioController(RolService rolService, UsuarioService usuarioService)
        {
            _RolService = rolService;
            _UsuarioService = usuarioService;

            //_token = context.HttpContext.Request.Cookies["AuthToken"];
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            var rol = await _RolService.GetRolsAsync(_token);
            ViewBag.Rol = rol;
            var usuarios = await _UsuarioService.GetUsuariosAsync(_token);
            return View(usuarios);
        }

        [HttpPost()]
        public async Task<IActionResult> Create([FromBody] Usuario Usuario)
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            if (ModelState.IsValid)
            {
                var result = await _UsuarioService.CreateUsuarioAsync(Usuario, _token);
                if (result)
                {
                    return Ok();
                }
            }
            return BadRequest();
        }

        [HttpPut]
        public async Task<IActionResult> Update([FromBody] Usuario Usuario)
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            if (ModelState.IsValid)
            {
                var result = await _UsuarioService.UpdateUsuarioAsync(Usuario, _token);
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
            var result = await _UsuarioService.DeleteUsuarioAsync(id, _token);
            if (result)
            {
                return Ok();
            }
            return BadRequest();
        }
    }
}

