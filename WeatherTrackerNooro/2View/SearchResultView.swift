//
//  SearchResultView.swift
//  WeatherTrackerNooro
//
//  Created by Kyron Weaver on 1/17/25.
//

import SwiftUI

struct SearchResultView: View {
    
    let cityName: String
    let temperature: String
    let weatherCondition: String
    let iconURL: String
    
    var body: some View {
        HStack(spacing: 16) {
            
            VStack(alignment: .center) {
                
                Text(cityName)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(temperature)
                    .font(.system(size: 64))
                    .bold()
                    .background(
                        Image(systemName: "circle")
                            .font(.system(size: 10))
                            .bold()
                            .offset(x: 64, y: -24)
                    )
            }
            .padding()
            
            Spacer()
            
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
        }
        .padding(.horizontal)
        .background(Color(.label).opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .padding()
    }

}

#Preview {
    SearchResultView(cityName: "Mumbai", temperature: "20", weatherCondition: "Cloudy", iconURL: "Cloudy")
}
