//
//  WeatherInfoView.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//

//
//  WeatherInfoView.swift
//  WeatherHub
//
//  Created by Taoufiq El Moutaouakil on 12/13/24.
//

import SwiftUI

struct WeatherInfoView: View {
    var locationName: String
    var locationCountry: String
    var temperature: Double
    var conditionIcon: String
    
    var body: some View {
        VStack(spacing: 8) { 
            
            AsyncImage(url: URL(string: "https:" + conditionIcon)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 123, height: 123)
            } placeholder: {
                ProgressView()
            }
            HStack(alignment: .center, spacing: 4) {
                Text(locationName)
                    .font(.title2)
                    .fontWeight(.bold)
                    .lineLimit(1)
                Image(systemName: "location.fill")
                    .foregroundColor(.black)
                    .frame(width: 14, height: 14)
            }
            Text("\(Int(temperature))°")
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .center) 
        .padding()
    }
}
