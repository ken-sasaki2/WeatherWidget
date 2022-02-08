//
//  MediumWidgetEntryModel.swift
//  WidgetExtension
//
//  Created by sasaki.ken on 2022/01/29.
//

import WidgetKit
import SwiftUI

struct MediumWidgetEntryModel: TimelineEntry {
    let date: Date
    var hourlyWeathers: [Hourly]
    var currentLocation: String?
    var weatherIcons: [String]
    
    init(currentDate: Date, hourlyWeathers: [Hourly], currentLocation: String?) {
        self.date = currentDate
        self.currentLocation = currentLocation
        
        self.hourlyWeathers = []
        self.weatherIcons = []
        
        // 現在時刻から8時間分にhourlyWeathersを絞る
        for index in 0..<8 {
            self.hourlyWeathers.append(hourlyWeathers[index])
            
            let weather = self.hourlyWeathers[index].weather[index]
            if let weatherName = getWeatherName(weather: weather) {
                self.weatherIcons.append(weatherName)
            }
        }
    }
    
    private func getWeatherName(weather: Weather) -> String? {
        var wetherName: String
        
        switch weather.main {
        case "Clear":
            wetherName = WeatherTypeTranslator.translate(type: .Clear)
        case "Clouds":
            wetherName = WeatherTypeTranslator.translate(type: .Clouds)
        case "Rain":
            wetherName = WeatherTypeTranslator.translate(type: .Rain)
        case "Snow":
            wetherName = WeatherTypeTranslator.translate(type: .Snow)
        default:
            return nil
        }
        
        return wetherName
    }
}
