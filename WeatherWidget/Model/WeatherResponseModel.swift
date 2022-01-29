//
//  WeatherResponseModel.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/01/29.
//

import Foundation

struct WeatherResponseModel: Decodable {
    var hourly: [Hourly]
}

struct Hourly: Decodable {
    var dt: Double
    var temp: Double
    var feels_like: Double
    var pressure: Double
    var humidity: Double
    var dew_point: Double
    var uvi: Double
    var clouds: Double
    var visibility: Double
    var wind_speed: Double
    var wind_deg: Double
    var wind_gust: Double
    var weather: [Weather]
    var pop: Double
}

struct Weather: Decodable {
    var id: Double
    var main: String
    var description: String
    var icon: String
}
