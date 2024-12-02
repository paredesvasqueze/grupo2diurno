using Microsoft.AspNetCore.Mvc;
using CapaDomain;
using CapaEntidad;
using Microsoft.AspNetCore.Authorization;

namespace WebApi.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]")]
    public class ProductoController : ControllerBase
    {
        private readonly ProductoDomain _ProductoDomain;

        public ProductoController(ProductoDomain ProductoDomain)
        {
            _ProductoDomain = ProductoDomain;
        }

        [HttpGet("ObtenerProductoTodos")]
        public IActionResult ObtenerProductoTodos()
        {
            var Productos = _ProductoDomain.ObtenerProductoTodos();
            return Ok(Productos);
        }


        [HttpPost("InsertarProducto")]
        public IActionResult InsertarProducto(Producto oProducto)
        {
            var id = _ProductoDomain.InsertarProducto(oProducto);
            return Ok(id);
        }
        [HttpPut("ActualizarProducto")]
        public IActionResult ActualizarProducto(Producto oProducto)
        {
            var id = _ProductoDomain.ActualizarProducto(oProducto);
            return Ok(id);
        }

        [HttpDelete("EliminarCategoria/{nIdCategoria}")]
       

        [HttpDelete("EliminarProducto/{nIdProducto}")]
        public IActionResult EliminarProducto(Int32 nIdProducto)
        {
            Producto producto = new Producto() { nIdProducto = nIdProducto };
            var id = _ProductoDomain.EliminarProducto(producto);
            return Ok(id);
        }





        [HttpGet("GetProductoId/{nIdProducto}")]
        public IActionResult GetProductoId(int nIdProducto)
        {
            var ordenesCompra = _ProductoDomain.GetProductoId(nIdProducto);
            return Ok(ordenesCompra);
        }
    }
}
