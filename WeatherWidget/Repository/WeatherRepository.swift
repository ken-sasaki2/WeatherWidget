//
//  WeatherRepository.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/01/29.
//

import Foundation

class WeatherRepository: WeatherRepositoryInterface {
    private let weatherDataStore = WeatherDataStore()
    
    func fetchWeathers(requestModel: WeatherRequestModel) async throws -> WeatherResponseModel {
        do {
            let response = try await weatherDataStore.fetchWeathers(requestModel: requestModel)
            return response
        }
        catch {
            throw error
        }
    }
}
