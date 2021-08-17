//
//  BackgroundView.swift
//  WeatherSwiftUI
//
//  Created by Дмитрий Беседин on 30.07.2021.
//  Copyright © 2021 Dmytro Besedin. All rights reserved.
//

import SwiftUI

struct BackgroundView: View {

    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors:  [isNight ? .black :.blue, isNight ? .gray : Color("lightBlue") ]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
