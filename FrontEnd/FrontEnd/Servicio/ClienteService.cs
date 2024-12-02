using FrontEnd.Models;
using Newtonsoft.Json.Linq;
using NuGet.Common;
using System.Configuration;


namespace FrontEnd.Servicio
{
    public class ClienteService
    {
        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;
        string _baseURL = string.Empty;

        public ClienteService(HttpClient httpClient, IConfiguration configuration)
        {
            _httpClient = httpClient;
            _configuration = configuration;
            _baseURL = _configuration["UrlBaseAPIs"];
            _httpClient.BaseAddress = new Uri(_baseURL);
        }

        // Obtener la lista de Clientes
        public async Task<IEnumerable<Cliente>> GetClientesAsync(string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.GetAsync("Cliente/ObtenerClienteTodos");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<Cliente>>();
        }

        // Obtener Cliente
        public async Task<Cliente> GetClienteAsync(Int32 nIdCliente, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.GetAsync($"Cliente/GetClienteId/{nIdCliente}");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<Cliente>();
        }


        // Crear un nuevo Cliente
        public async Task<bool> CreateClienteAsync(Cliente Cliente, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PostAsJsonAsync("Cliente/InsertarCliente", Cliente);
            return response.IsSuccessStatusCode;
        }

        // Actualizar un Cliente existente
        public async Task<bool> UpdateClienteAsync(Cliente Cliente, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PutAsJsonAsync($"Cliente/ActualizarCliente", Cliente);
            return response.IsSuccessStatusCode;
        }

        // Eliminar un Cliente
        public async Task<bool> DeleteClienteAsync(int nIdCliente, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.DeleteAsync($"Cliente/EliminarCliente/{nIdCliente}");
            return response.IsSuccessStatusCode;
        }
    }


}
