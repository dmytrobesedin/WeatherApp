//
//  Extension.swift
//  WeatherSwiftUI
//
//  Created by Дмитрий Беседин on 27.07.2021.
//  Copyright © 2021 Dmytro Besedin. All rights reserved.
//

import Foundation

extension Double {
    public var toInt:Int{
        return Int(self)
    }
}

extension Int {
    public  var timeStamp: TimeInterval {
        return TimeInterval(self)
    }
    public var toString:String {
        return String(self)
    }
}

extension DateFormatter {
    convenience init(dateFormat:String) {
        self.init()
        self.dateFormat = dateFormat
    }
}

extension Date {
    static func getDayFromUnixTimeInterval(_ timeStamp: TimeInterval) ->Date{
        return Date(timeIntervalSince1970: timeStamp)
    }
    public var day: String {
        let dateFormatter = DateFormatter(dateFormat: "EEEE")
        return dateFormatter.string(from: self)
    }
}
func getDayFromUnixTimeStamp(_ timeStamp:TimeInterval) -> String {
    let date = Date.getDayFromUnixTimeInterval(timeStamp)
    return date.day
}
