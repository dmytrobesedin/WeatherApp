//
//  MainWeatherView.swift
//  WeatherSwiftUI
//
//  Created by Дмитрий Беседин on 30.07.2021.
//  Copyright © 2021 Dmytro Besedin. All rights reserved.
//

import SwiftUI

struct MainWeatherView: View {
    var imageName: String
    var temperature: String
    var desription:String
    //
    var body: some View {
        VStack(spacing: 10){
            //
            
            Text(desription)
                .font(.system(size:32, weight:.medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            
            Text(temperature)
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 45)
    }
}

