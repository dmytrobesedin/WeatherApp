//
//  WeatherDayView.swift
//  WeatherSwiftUI
//
//  Created by Дмитрий Беседин on 30.07.2021.
//  Copyright © 2021 Dmytro Besedin. All rights reserved.
//


import SwiftUI


struct WeatherDayView: View {
    
    var dayOfweek: String
    var imageName: String
    var temperature: Double
    
    var body: some View {
        VStack {
            Text(dayOfweek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
  
            Image(imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            
            Text("\(temperature.toInt)°")
                .font(.system(size: 29, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}
