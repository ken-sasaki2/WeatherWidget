//
//  WeatherRepository.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/01/29.
//

import Foundation

class WeatherRepository: WeatherRepositoryInterface {
    private let weatherDataStore = WeatherDataStore()
    
    func fetchWeathers() async throws -> WeatherResponseModel {
        do {
            let response = try await weatherDataStore.fetchWeathers(params: "")
            return response
        }
        catch {
            throw error
        }
    }
}
