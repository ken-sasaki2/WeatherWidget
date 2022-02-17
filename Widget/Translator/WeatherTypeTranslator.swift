//
//  WeatherTypeTranslator.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/02/05.
//

import Foundation

class WeatherTypeTranslator {
    static func translate(type: WeatherType) -> String {
        switch type {
        case .Clear:
            return "hare_noon"
        case .Clouds:
            return "cloudy"
        case .Rain:
            return "rain"
        case .Snow:
            return "snow"
        }
    }
}
