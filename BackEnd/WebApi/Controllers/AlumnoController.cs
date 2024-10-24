using Microsoft.AspNetCore.Mvc;
using CapaDomain;
using CapaEntidad;
using Microsoft.AspNetCore.Authorization;

namespace WebApi.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]")]
    public class AlumnoController : ControllerBase
    {
        private readonly AlumnoDomain _alumnoDomain;

        public AlumnoController(AlumnoDomain alumnoDomain)
        {
            _alumnoDomain = alumnoDomain;
        }

        [HttpGet("ObtenerAlumnoTodos")]
        public IActionResult ObtenerAlumnoTodos()
        {
            var alumnos = _alumnoDomain.ObtenerAlumnoTodos();
            return Ok(alumnos);
        }

        [HttpPost("InsertarAlumno")]
        public IActionResult InsertarAlumno(Alumno oAlumno)
        {
            var id = _alumnoDomain.InsertarAlumno(oAlumno);
            return Ok(id);
        }
    }
}
