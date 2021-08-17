//
//  CurrentWeather.swift
//  WeatherSwiftUI
//
//  Created by Дмитрий Беседин on 26.07.2021.
//  Copyright © 2021 Dmytro Besedin. All rights reserved.
//

import Foundation
public struct CurrentWeather {
    let city:String
    let temperature:String
    let description:String
    let iconName:String
    
    init(response: APICurrentWeatherResponse) {
        self.city = response.name
        self.temperature = "\(Int(response.main.temp))"
        self.description = response.weather.first?.description ?? ""
        self.iconName = response.weather.first?.iconName ?? ""
    }
    
}


struct APICurrentWeatherResponse: Decodable {
    let name:String
    let main:APICurrentMain
    let weather:[APICurrentWeather]
}

struct APICurrentMain: Decodable{
    let temp: Double
}
struct APICurrentWeather: Decodable {
    let description: String
    let iconName: String
    
    enum CodingKeys: String, CodingKey {
        case  description
        case iconName = "main"
    }
}




