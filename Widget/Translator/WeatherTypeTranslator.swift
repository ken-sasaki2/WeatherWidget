//
//  WeatherTypeTranslator.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/02/05.
//

import Foundation

final class WeatherTypeTranslator {
    static func translate(type: WeatherType) -> String {
        switch type {
        case .clear:
            return "hare_noon"
        case .clouds:
            return "cloudy"
        case .rain:
            return "rain"
        case .snow:
            return "snow"
        }
    }
}
