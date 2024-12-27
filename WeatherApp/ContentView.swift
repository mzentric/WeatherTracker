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
        VStack(spacing: 0) {
            // Search bar
            HStack {
                TextField("Search Location", text: $viewModel.searchText)
                    .textFieldStyle(.plain)
                    .font(.custom("Poppins-Regular", size: 15))
                    .tint(.grayLight)
                    .accentColor(.grayLight)
                    .padding(10)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                    .overlay(
                        HStack {
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.grayLight)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 8)
                        }
                    )
                    .onChange(of: viewModel.searchText, initial: false) { oldValue, newValue in
                        viewModel.searchCity()
                    }
            }
            .padding(.horizontal)
            .padding(.top)
            
            // Search Results
            if !viewModel.searchResults.isEmpty {
                List(viewModel.searchResults) { result in
                    WeatherSearchResultRow(result: result)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectCity(result)
                        }
                }
                .listStyle(.plain)
                .padding(.top, 10)
            } else {
                Spacer()
                
                if viewModel.isLoading {
                    ProgressView()
                } else if let weather = viewModel.weather {
                    WeatherView(weather: weather)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                } else {
                    // No city selected state
                    VStack(spacing: 10) {
                        Text("No City Selected")
                            .font(.custom("Poppins-SemiBold", size: 30))
                            .foregroundColor(.blackMountain)
                        Text("Please Search For A City")
                            .font(.custom("Poppins-SemiBold", size: 15))
                            .foregroundColor(.blackMountain)
                    }
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
