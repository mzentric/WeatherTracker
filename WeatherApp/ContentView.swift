//
//  ContentView.swift
//  WeatherApp
//
//  Created by maria on 12/27/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            // Search bar
            HStack {
                TextField("Search Location", text: $viewModel.searchText)
                    .textFieldStyle(.plain)
                    .padding(10)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                    .overlay(
                        HStack {
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 8)
                        }
                    )
                    .onSubmit {
                        viewModel.searchCity()
                    }
            }
            .padding(.horizontal)
            .padding(.top)
            
            Spacer()
            
            if viewModel.isLoading {
                ProgressView()
            } else if let weather = viewModel.weather {
                // Weather information
                VStack(spacing: 20) {
                    Image(systemName: weather.iconName)
                        .font(.system(size: 100))
                        .symbolRenderingMode(.multicolor)
                    
                    Text(weather.cityName)
                        .font(.title)
                        .fontWeight(.medium)
                    
                    Text("\(Int(round(weather.temperature)))")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                    
                    // Weather details section
                    HStack(spacing: 20) {
                        WeatherDataItem(title: "Humidity", value: "\(weather.humidity)%")
                        
                        WeatherDataItem(title: "UV Index", value: "\(weather.uvIndex)")
                        
                        WeatherDataItem(title: "Feels Like", value: "\(Int(round(weather.feelsLike)))°")
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                }
            } else {
                // No city selected state
                VStack(spacing: 10) {
                    Text("No City Selected")
                        .font(.title)
                        .fontWeight(.medium)
                    Text("Please Search For A City")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
