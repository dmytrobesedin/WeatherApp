//
//  CityTextView.swift
//  WeatherSwiftUI
//
//  Created by Дмитрий Беседин on 30.07.2021.
//  Copyright © 2021 Dmytro Besedin. All rights reserved.
//

import SwiftUI

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 50, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

