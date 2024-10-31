using CapaDatos;
using CapaDomain;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(options =>
{
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = builder.Configuration["Jwt:Issuer"],
        ValidAudience = builder.Configuration["Jwt:Audience"],
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))
    };
});

// Cargar la configuración desde appsettings.json
builder.Configuration
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true);

// Registrar el patrón Singleton para la conexión a la base de datos
builder.Services.AddSingleton(provider =>
    ConexionSingleton.GetInstance(provider.GetRequiredService<IConfiguration>()));

// Registrar el repositorio y la capa de dominio
builder.Services.AddScoped<AlumnoRepository>();
builder.Services.AddScoped<AlumnoDomain>();

builder.Services.AddScoped<ClienteRepository>();
builder.Services.AddScoped<ClienteDomain>();

builder.Services.AddScoped<CategoriaRepository>();
builder.Services.AddScoped<CategoriaDomain>();

builder.Services.AddScoped<ProductoRepository>();
builder.Services.AddScoped<ProductoDomain>();

builder.Services.AddScoped<RolRepository>();
builder.Services.AddScoped<RolDomain>();

builder.Services.AddScoped<UsuarioRepository>();
builder.Services.AddScoped<UsuarioDomain>();

builder.Services.AddScoped<OrdenRepository>();
builder.Services.AddScoped<OrdenDomain>();

builder.Services.AddScoped<DetalleOrdenRepository>();
builder.Services.AddScoped<DetalleOrdenDomain>();

builder.Services.AddScoped<KardexRepository>();
builder.Services.AddScoped<KardexDomain>();
// Registrar los controladores
builder.Services.AddControllers();

// Configurar Swagger
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configurar Swagger UI
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
    app.UseSwagger();
    app.UseSwaggerUI();

app.UseHttpsRedirection();
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();
app.Run();

