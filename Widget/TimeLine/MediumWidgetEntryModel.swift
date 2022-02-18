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
    var timePeriodTexts: [String]
    var temperatureTexts: [String]
    var hourlyPressures: [Double]
    
    init(currentDate: Date, hourlyWeathers: [Hourly], currentLocation: String?) {
        self.date = currentDate
        self.currentLocation = currentLocation
        
        self.hourlyWeathers = []
        self.weatherIcons = []
        self.timePeriodTexts = []
        self.temperatureTexts = []
        self.hourlyPressures = []
        
        // 現在時刻から24時間分にhourlyWeathersを絞る
        for index in 0..<24 {
            self.hourlyWeathers.append(hourlyWeathers[index])
            self.hourlyPressures.append(hourlyWeathers[index].pressure)
            
            let timePeriodText = getTimePeriodText(hourlyWeather: hourlyWeathers[index])
            self.timePeriodTexts.append(timePeriodText)
            
            let weather = hourlyWeathers[index].weather[0]
            if let weatherIconName = getWeatherIconName(weather: weather) {
                self.weatherIcons.append(weatherIconName)
            }
            
            let temp = String(format: "%0.0f", hourlyWeathers[index].temp)
            self.temperatureTexts.append(temp)
        }
    }
    
    func getTimePeriodText(hourlyWeather: Hourly) -> String {
        let date = Date(timeIntervalSince1970: hourlyWeather.dt)
        let dateString = DateFormatHelper.shared.formatToHHmm(date: date)
        var timePeriodText: String
        
        if dateString == "00:00" {
            timePeriodText = "0"
        } else if dateString == "03:00" {
            timePeriodText = "3"
        } else if dateString == "06:00" {
            timePeriodText = "6"
        } else if dateString == "09:00" {
            timePeriodText = "9"
        } else if dateString == "12:00" {
            timePeriodText = "12"
        } else if dateString == "15:00" {
            timePeriodText = "15"
        } else if dateString == "18:00" {
            timePeriodText = "18"
        } else if dateString == "21:00" {
            timePeriodText = "21"
        } else {
            timePeriodText = "･"
        }
        
        return timePeriodText
    }
    
    private func getWeatherIconName(weather: Weather) -> String? {
        var wetherName: String
        
        switch weather.main {
        case "Clear":
            wetherName = WeatherTypeTranslator.translate(type: .clear)
        case "Clouds":
            wetherName = WeatherTypeTranslator.translate(type: .clouds)
        case "Rain":
            wetherName = WeatherTypeTranslator.translate(type: .rain)
        case "Snow":
            wetherName = WeatherTypeTranslator.translate(type: .snow)
        default:
            return nil
        }
        
        return wetherName
    }    
}
