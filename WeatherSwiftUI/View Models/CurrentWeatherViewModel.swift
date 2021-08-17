//
//  CurrentWeatherViewModel.swift
//  WeatherSwiftUI
//
//  Created by Дмитрий Беседин on 26.07.2021.
//  Copyright © 2021 Dmytro Besedin. All rights reserved.
//

import Foundation

private let defaultIcon = "cloud.heavyrain.fill"
private let iconMap = [
    
    "Drizzle": "cloud.heavyrain.fill",
    "Thunderstorm":"sun.max.fill",
    "Rain":"wind",
    "Snow":"cloud.sun.fill",
    "Clear":"sun.max.fill",
    "Clouds":"cloud.heavyrain.fill"
]

public class CurrentWeatherViewModel: ObservableObject {
    @Published var cityName: String = "cityName"
    @Published var currentWeatherDescription: String = "description"
    @Published var temperature: String = "___"
    @Published var currentWeatherIcon  = defaultIcon
    
    public let weatherService:WeatherService
    public init(weatherService:WeatherService) {
        self.weatherService = weatherService
    }
    
    public func refresh(){
        weatherService.loadCurrentWeatherData { currentWeather in
            DispatchQueue.main.async {
                self.cityName = currentWeather.city
                self.temperature = "\(currentWeather.temperature)°"
                self.currentWeatherDescription = currentWeather.description.capitalized
                self.currentWeatherIcon = iconMap[currentWeather.iconName] ?? defaultIcon
                
            }
        }
    }
}
