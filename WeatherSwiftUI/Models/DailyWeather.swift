//
//  DailyWeather.swift
//  WeatherSwiftUI
//
//  Created by Дмитрий Беседин on 29.07.2021.
//  Copyright © 2021 Dmytro Besedin. All rights reserved.
//

import Foundation

public struct DailyWeather {
    
    var temperature: Double = 0.0
    var day:Int = 0
    var icon:String = ""
    let list: [DailyWeatherList]
    

    init(response: APIDailyWeatherResponse) {

        self.list = response.daily
        for i in response.daily {
           self.temperature = i.temp.day
            self.day = i.dt
            for y in i.weather {
                self.icon = y.icon
            }
        }
    }
}





struct APIDailyWeatherResponse: Decodable {
    let daily: [DailyWeatherList]
}


struct DailyWeatherList: Decodable, Identifiable {
    let id = UUID()
    let dt: Int
    let temp:APITemp
    let weather:[DailyWeatherArray]
}

struct APITemp: Decodable {
    let day:Double
}
struct DailyWeatherArray: Decodable {
    let icon:String
    
    //    enum CodingKeys: String,CodingKey {
    //
    //        case icon
    //
    //    }
}
