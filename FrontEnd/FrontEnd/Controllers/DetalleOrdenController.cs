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
    public class DetalleOrdenController : Controller
    {
        private readonly DetalleOrdenService _DetalleOrdenService;
        private readonly OrdenService _OrdenService;
        private readonly ProductoService _ProductoService;
        private string _token;

        public DetalleOrdenController(DetalleOrdenService DetalleOrdenService, ProductoService ProductoService, OrdenService oOrdenService)
        {
            _DetalleOrdenService = DetalleOrdenService;
            _ProductoService = ProductoService;
            _OrdenService = oOrdenService;

            //_token = context.HttpContext.Request.Cookies["AuthToken"];
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            var DetalleOrdens = await _DetalleOrdenService.GetDetalleOrdensAsync(_token);
            var productos = await _ProductoService.GetProductosAsync(_token);
            var ordenes = await _OrdenService.GetOrdensAsync(_token);

            ViewBag.Productos = productos;
            ViewBag.Ordenes = ordenes;

            return View(DetalleOrdens);
        }

        [HttpPost()]
        public async Task<IActionResult> Create([FromBody] DetalleOrden DetalleOrden)
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            if (ModelState.IsValid)
            {
                var result = await _DetalleOrdenService.CreateDetalleOrdenAsync(DetalleOrden, _token);
                if (result)
                {
                    return Ok();
                }
            }
            return BadRequest();
        }

        [HttpPut]
        public async Task<IActionResult> Update([FromBody] DetalleOrden DetalleOrden)
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            if (ModelState.IsValid)
            {
                var result = await _DetalleOrdenService.UpdateDetalleOrdenAsync(DetalleOrden, _token);
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
            var result = await _DetalleOrdenService.DeleteDetalleOrdenAsync(id, _token);
            if (result)
            {
                return Ok();
            }
            return BadRequest();
        }
    }
}
