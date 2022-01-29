//
//  WeatherDataStore.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/01/29.
//

import Foundation

final class WeatherDataStore {
    private let baseUrl = "https://api.openweathermap.org/data/2.5/"
    private let shared = URLSession.shared
    private let decoder = JSONDecoder()
    
    func fetchWeathers(params: String) async throws -> WeatherResponseModel {
        let urlString = baseUrl + "onecall?lat=35.65146&lon=139.63678&exclude=current,minutely,daily,alerts&lang=ja&appid=\(API_KEY)"
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Error fetch weathers.", code: -1)
        }
        let request = URLRequest(url: url)
        let (data, _) = try await shared.data(for: request)
        let response = try decoder.decode(WeatherResponseModel.self, from: data)
        return response
    }
}
