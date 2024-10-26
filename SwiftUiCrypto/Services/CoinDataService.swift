import Foundation

class CoinDataService {
    
    @Published var allCoins: [Coin] = []
    
    init() {
        Task { await fetchAllCoins() }
    }
    
    private func fetchAllCoins() async {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&sparkline=true&price_change_percentage=24h") else {
            return
        }
        
        // Create a URLRequest and add headers
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("CG-WK3RypBRuiKdHasUk1SPvmKG", forHTTPHeaderField: "x-cg-demo-api-key")
        
        do {
            // Use the URLRequest with async data task
            let (data, response) = try await URLSession.shared.data(for: request)
            
            // Ensure we received a 200 OK response
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }

            
            
            // Decode the JSON data
            let decodedData = try JSONDecoder().decode([Coin].self, from: data)
            
            // Update the published property
            DispatchQueue.main.async { [weak self] in
                self?.allCoins = decodedData
            }
            
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
