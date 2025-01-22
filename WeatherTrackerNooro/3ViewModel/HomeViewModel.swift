//
//  HomeViewModel.swift
//  WeatherTrackerNooro
//
//  Created by Kyron Weaver on 1/17/25.
//


import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchResults: [WeatherResponse] = []
    @Published var selectedCity: WeatherResponse?
    @Published var persistedCities: [WeatherResponse] = []
    @Published var isLoading: Bool = false

    private var cancellables = Set<AnyCancellable>()
    private let weatherAPIKey = ""
    private let baseURL = "https://api.weatherapi.com/v1"
    
    private let userDefaultsKey = "PersistedCities"

    init() {
        loadPersistedCities()
    }

    private func saveCity(_ city: WeatherResponse) {
        persistedCities.append(city)
        if let data = try? JSONEncoder().encode(persistedCities) {
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        }
    }

    private func loadPersistedCities() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let savedCities = try? JSONDecoder().decode([WeatherResponse].self, from: data) {
            persistedCities = savedCities
        }
    }

    func searchCity() {
        guard !searchText.isEmpty else { return }
        
        isLoading = true
        
        let endpoint = "\(baseURL)/current.json?key=\(weatherAPIKey)&q=\(searchText)"
        guard let url = URL(string: endpoint) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    print("Error fetching city data: \(error)")
                case .finished:
                    break
                }
            } receiveValue: { [weak self] response in
                self?.searchResults = [response]
            }
            .store(in: &cancellables)
    }
    
    func selectCity(_ city: WeatherResponse) {
        selectedCity = city
        searchResults.removeAll()
        saveCity(city)
    }
}
