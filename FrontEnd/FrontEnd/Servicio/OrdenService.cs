using FrontEnd.Models;

namespace FrontEnd.Servicio
{
    public class OrdenService //: IOrdenService
    {

        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;
        string _baseURL = string.Empty;

        public OrdenService(HttpClient httpClient, IConfiguration configuration)
        {
            _httpClient = httpClient;
            _configuration = configuration;
            _baseURL = _configuration["UrlBaseAPIs"];
            _httpClient.BaseAddress = new Uri(_baseURL);
        }

        public async Task<IEnumerable<Orden>> GetOrdensAsync(string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.GetAsync("Orden/ObtenerOrdenTodos");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<Orden>>();
        }

        public async Task<bool> CreateOrdenAsync(Orden Orden, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PostAsJsonAsync("Orden/InsertarOrden", Orden);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> UpdateOrdenAsync(Orden Orden, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PutAsJsonAsync($"Orden/ActualizarOrden", Orden);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> DeleteOrdenAsync(int id, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.DeleteAsync($"Orden/EliminarOrden/{id}");
            return response.IsSuccessStatusCode;
        }


    }
}

