//
//  ContentView.swift
//  WeatherTrackerNooro
//
//  Created by Kyron Weaver on 1/17/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            
            ZStack {
                HStack {
                    TextField("Search Location", text: $searchText)
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.placeholder)
                }
            }
            .padding()
            .background(Color(.label).opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 8))

            Spacer()
            
            
            VStack {
                Text("No City Seleceted")
                    .font(.system(size: 34, weight: .bold))
                Text("Please search for a city")
            }
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
