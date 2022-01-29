//
//  RepositoryRocator.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/01/29.
//

import Foundation

class RepositoryRocator {
    
    static func getWeatherRepository() -> WeatherRepositoryInterface {
        WeatherRepository()
    }
    
    static func getUserRepository() -> UserRepositoryInterface {
        UserRepository()
    }
}
