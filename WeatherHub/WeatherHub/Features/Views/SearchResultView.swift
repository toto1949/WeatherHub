//
//  SearchResultView.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//

import SwiftUI

struct SearchResultView: View {
    let city: String
    let temperature: Double
    let iconURL: String
    var onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                VStack(alignment: .leading) {
                    Text(city)
                        .font(.headline)
                    Text("\(Int(temperature))°")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                AsyncImage(url: URL(string: iconURL)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                } placeholder: {
                    ProgressView()
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
