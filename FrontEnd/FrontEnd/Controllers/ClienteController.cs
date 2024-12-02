using FrontEnd.Filter;
using FrontEnd.Models;
using FrontEnd.Servicio;
using Microsoft.AspNetCore.Mvc;

namespace FrontEnd.Controllers
{
    [TypeFilter(typeof(TokenAuthorizationFilter))]
    [ApiController]
    [Route("[controller]")]
    public class ClienteController : Controller
    {

        private readonly ClienteService _ClienteService;
        private readonly CategoriaService _CategoriaService;
        private string _token;

        public ClienteController(CategoriaService categoriaService, ClienteService ClienteService)
        {
            _CategoriaService = categoriaService;
            _ClienteService = ClienteService;

            //_token = context.HttpContext.Request.Cookies["AuthToken"];
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            var categorias = await _CategoriaService.GetCategoriasAsync(_token);
            ViewBag.Categorias = categorias;
            var Clientes = await _ClienteService.GetClientesAsync(_token);
            return View(Clientes);
        }

        [HttpGet("GetClienteById/{nIdCliente}")]
        public async Task<IActionResult> GetClienteById(Int32 nIdCliente)
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            var Cliente = await _ClienteService.GetClienteAsync(nIdCliente, _token);
            return Ok(Cliente);
            //return View(Clientes);
        }

        [HttpPost()]
        public async Task<IActionResult> Create([FromBody] Cliente Cliente)
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            if (ModelState.IsValid)
            {
                var result = await _ClienteService.CreateClienteAsync(Cliente, _token);
                if (result)
                {
                    return Ok();
                }
            }
            return BadRequest();
        }

        [HttpPut]
        public async Task<IActionResult> Update([FromBody] Cliente Cliente)
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            if (ModelState.IsValid)
            {
                var result = await _ClienteService.UpdateClienteAsync(Cliente, _token);
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
            var result = await _ClienteService.DeleteClienteAsync(id, _token);
            if (result)
            {
                return Ok();
            }
            return BadRequest();
        }
    }
}
