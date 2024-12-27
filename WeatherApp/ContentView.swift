//
//  ContentView.swift
//  WeatherApp
//
//  Created by maria on 12/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search Location", text: $searchText)
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
            }
            .padding(.horizontal)
            .padding(.top)
            
            Spacer()
            
            VStack(spacing: 10) {
                Text("No City Selected")
                    .font(.title)
                    .fontWeight(.medium)
                Text("Please Search For A City")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
