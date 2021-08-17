//
//  DailyWeatherViewModel.swift
//  WeatherSwiftUI
//
//  Created by Дмитрий Беседин on 29.07.2021.
//  Copyright © 2021 Dmytro Besedin. All rights reserved.
//

import Foundation



private let defaultIcon = "cloud.sun.fill"
private let iconMap = [
    "Drizzle": "cloud.heavyrain.fill",
    "Thunderstorm":"sun.max.fill",
    "Rain":"cloud.rain.fill",
    "Snow":"cloud.sun.fill",
    "Clear":"sun.max.fill",
    "Clouds":"cloud.heavyrain.fill"
]

public class DailyWeatherViewModel:  ObservableObject {
    @Published var temperature:Double = 0.0
    @Published var dailyWeatherIcon:String = "01d"
    @Published var dailyWeatherDay: Int = 0
    @Published var dailyWeatherList = [DailyWeatherList]()
    
    public let weatherService: WeatherService
    
    public init(weatherService: WeatherService){
        self.weatherService = weatherService
        
    }
    
    
    public func refresh(){
        weatherService.loadDailyWeatherData{ dailyWeather in
            DispatchQueue.main.async {
                self.temperature = dailyWeather.temperature
                self.dailyWeatherList = dailyWeather.list
                self.dailyWeatherDay = dailyWeather.day
                self.dailyWeatherIcon = dailyWeather.icon
                
                
                
            }
        }
    }
    
}


