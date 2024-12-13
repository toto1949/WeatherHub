//
//  SearchBarView.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//
import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField(UIString.searching.rawValue, text: $searchText)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .overlay(
                    HStack {
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.trailing, 12)
                    }
                )
        }
        .padding(.horizontal)
    }
}
