using FrontEnd.Models;

namespace FrontEnd.Servicio
{
    public class KardexService //: IKardexService
    {

        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;
        string _baseURL = string.Empty;

        public KardexService(HttpClient httpClient, IConfiguration configuration)
        {
            _httpClient = httpClient;
            _configuration = configuration;
            _baseURL = _configuration["UrlBaseAPIs"];
            _httpClient.BaseAddress = new Uri(_baseURL);
        }

        public async Task<IEnumerable<Kardex>> GetKardexsAsync(string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.GetAsync("Kardex/ObtenerKardexTodos");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<Kardex>>();
        }

        public async Task<bool> CreateKardexAsync(Kardex Kardex, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PostAsJsonAsync("Kardex/InsertarKardex", Kardex);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> UpdateKardexAsync(Kardex Kardex, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PutAsJsonAsync($"Kardex/ActualizarKardex", Kardex);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> DeleteKardexAsync(int id, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.DeleteAsync($"Kardex/EliminarKardex/{id}");
            return response.IsSuccessStatusCode;
        }


    }
}
