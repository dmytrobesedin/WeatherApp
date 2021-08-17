//
//  WeatherService.swift
//  WeatherSwiftUI
//
//  Created by Дмитрий Беседин on 29.07.2021.
//  Copyright © 2021 Dmytro Besedin. All rights reserved.
//

import Foundation


import Foundation
import CoreLocation

public final class WeatherService: NSObject {

    private let locationManager = CLLocationManager()
    private let API_KEY = "e4629b80dc78c43173de46a49ba8ad0e"
    private var currentWeatherCompletionHandler: ((CurrentWeather) -> Void)?
    private var dailyWeatherCompletionHandler: ((DailyWeather) -> Void)?
    
    
    
    public override init() {
        super.init()
        locationManager.delegate = self
    }
    
    
    public func loadCurrentWeatherData(_ completionHandler: @escaping((CurrentWeather) -> Void))  {
        self.currentWeatherCompletionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    public func loadDailyWeatherData(_ completionHandler: @escaping((DailyWeather) -> Void))  {
        self.dailyWeatherCompletionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    private func makeCurrentWeatherDataRequest(forCoordinates coordinates:CLLocationCoordinate2D) {
        guard let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(API_KEY)&units=metric".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string:  urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {return}
            if let response = try? JSONDecoder().decode(APICurrentWeatherResponse.self, from: data) {
                
                self.currentWeatherCompletionHandler?(CurrentWeather(response: response))
                
                
            }
        }.resume()
    }
    
    
    private func makeDailyWeatherDataRequest(forCoordinates coordinates:CLLocationCoordinate2D) {
        
        //https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}
        guard let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&exclude=current,minutely,hourly,alerts&appid=\(API_KEY)&units=metric".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        
        guard let url = URL(string:  urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil, let dailyData = data else {return}
            if let dailyResponse = try? JSONDecoder().decode(APIDailyWeatherResponse.self, from: dailyData) {
                self.dailyWeatherCompletionHandler?(DailyWeather(response: dailyResponse))
            }
        }.resume()
    }
}



extension WeatherService: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return}
        makeCurrentWeatherDataRequest(forCoordinates: location.coordinate)
        makeDailyWeatherDataRequest(forCoordinates: location.coordinate)
        
    }
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("smth went wrong \(error.localizedDescription)")
    }
}









