//
//  WeatherRepositoryInterface.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/01/29.
//

import Foundation

protocol WeatherRepositoryInterface {
    func fetchWeathers() async throws -> [Hourly]
}
