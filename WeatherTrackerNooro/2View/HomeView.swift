//
//  ContentView.swift
//  WeatherTrackerNooro
//
//  Created by Kyron Weaver on 1/17/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search Location", text: $viewModel.searchText)
                Button {
                    viewModel.searchCity()
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Color.secondary.opacity(0.8))
                }
            }
            .padding()
            .background(Color.secondary.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding()
            
            Spacer()

            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if !viewModel.searchResults.isEmpty {
                ScrollView {
                    ForEach(viewModel.searchResults, id: \.location.name) { result in
                        SearchResultView(
                            cityName: result.location.name,
                            temperature: "\(Int(result.current.temperature))",
                            weatherCondition: result.current.weatherCondition,
                            iconURL: "https:\(result.current.iconURL)"
                        )
                        .onTapGesture {
                            viewModel.selectCity(result)
                        }
                    }
                }
            } else if let city = viewModel.selectedCity {
                CityView(
                    cityName: city.location.name,
                    temperature: "\(Int(city.current.temperature))",
                    weatherCondition: city.current.weatherCondition,
                    iconURL: "https:\(city.current.iconURL)",
                    humidity: "\(Int(city.current.humidity))%",
                    uvIndex: "\(Int(city.current.uvIndex))",
                    feelsLike: "\(Int(city.current.feelsLike))"
                )
            } else if !viewModel.persistedCities.isEmpty {
                ScrollView {

                        ForEach(viewModel.persistedCities, id: \.location.name) { city in
                            Button {
                                viewModel.selectCity(city)
                            } label: {
                                SearchResultView(
                                    cityName: city.location.name,
                                    temperature: "\(Int(city.current.temperature))",
                                    weatherCondition: city.current.weatherCondition,
                                    iconURL: "https:\(city.current.iconURL)"
                                )
                            }
                            .foregroundStyle(Color.black)
                        }
                }
            } else {
                VStack {
                    Text("No City Selected")
                        .font(.system(size: 34, weight: .bold))
                    Text("Please search for a city")
                        .foregroundStyle(.secondary)
                }
            }
            Spacer()
        }
        .padding()
        
    }
}

#Preview {
    HomeView()
}
