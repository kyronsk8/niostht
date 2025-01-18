//
//  CityView.swift
//  WeatherTrackerNooro
//
//  Created by Kyron Weaver on 1/17/25.
//

import SwiftUI

struct CityView: View {
    
    let cityName: String
    let temperature: String
    let weatherCondition: String
    let iconURL: String
    let humidity: String
    let uvIndex: String
    let feelsLike: String

    var body: some View {
        VStack(spacing: 16) {
            
            HStack(spacing: 8) {
                AsyncImage(url: URL(string: iconURL)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                } placeholder: {
                    ProgressView()
                        .frame(width: 64, height: 64)
                }
                
                Text(weatherCondition) //placeholder
                    .font(.title2)
            }
            
            HStack {
                
                Text(cityName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Image(systemName: "location.fill")
            }
            
            Text(temperature) // Temperature
                .font(.system(size: 74))
                .bold()
                .background(
                    Image(systemName: "circle")
                        .font(.system(size: 10))
                        .bold()
                        .offset(x: 64, y: -24)
                )
            
            
            
            HStack {
                
                VStack(alignment: .center, spacing: 10) {
                    Text("Humidity")
                        .font(.caption)
                    
                    Text("\(humidity)")
                        .bold()
                }
                .padding()
                
                VStack(alignment: .center, spacing: 10) {
                    Text("UV")
                        .font(.caption)
                    
                    Text("\(uvIndex)")
                        .bold()
                }
                .padding()
                
                VStack(alignment: .center, spacing: 10) {
                    Text("Feels Like")
                        .font(.caption)
                    
                    Text("\(feelsLike)")
                        .bold()
                }
                .padding()
                
            }
            .foregroundStyle(.secondary)
            .padding(.horizontal)
            .background(Color(.label).opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .padding()
    }
}

#Preview {
    CityView(cityName: "Hyperabad", temperature: "31", weatherCondition: "Sunny", iconURL: "Sunnt", humidity: "20%", uvIndex: "4", feelsLike: "38")
}
