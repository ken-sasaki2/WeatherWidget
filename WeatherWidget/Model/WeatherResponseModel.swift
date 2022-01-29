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
    var pressure: Double
    var weather: [Weather]
}

struct Weather: Decodable {
    var main: String
}
