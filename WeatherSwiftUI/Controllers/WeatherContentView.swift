//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by Дмитрий Беседин on 18.06.2021.
//  Copyright © 2021 Dmytro Besedin. All rights reserved.
//

import SwiftUI

struct WeatherContentView: View {
    
    @ObservedObject var currentWeatherViewModel : CurrentWeatherViewModel
    @ObservedObject var dailyWeatherViewModel : DailyWeatherViewModel
    @State private var isNight = false
    
    var body: some View {
        ZStack  {
            BackgroundView(isNight: $isNight)
            VStack{
                // city text
                CityTextView(cityName: currentWeatherViewModel.cityName)
    
                
                // current forecast
                MainWeatherView(imageName:currentWeatherViewModel.currentWeatherIcon , temperature: currentWeatherViewModel.temperature, desription: currentWeatherViewModel.currentWeatherDescription)
                
                // daily forecast
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(dailyWeatherViewModel.dailyWeatherList) { list in
                            WeatherDayView(dayOfweek:  getDayFromUnixTimeStamp(list.dt.timeStamp), imageName: list.weather.first?.icon ?? "01d", temperature:list.temp.day)
                        }
                        
                    }
                    .onAppear(perform: {
                        dailyWeatherViewModel.refresh()
                    })
                }
                Spacer()
                
                // change color background 
                Button(action: {
                    // action button
                    self.isNight.toggle()
                }) {
                    WeatherButton(title: "Change Background Color", textColor: .blue , backgroundColor: .white)
                }
                Spacer()
                
            }
            .onAppear(perform: currentWeatherViewModel.refresh)
            
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        WeatherContentView(currentWeatherViewModel: CurrentWeatherViewModel(weatherService: WeatherService()), dailyWeatherViewModel: DailyWeatherViewModel(weatherService: WeatherService()))   
    }
}





