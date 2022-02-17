//
//  WeatherDataStore.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/01/29.
//

import Foundation

final class WeatherDataStore {
    private let baseUrl = "https://api.openweathermap.org/data/2.5/onecall"
    private let shared = URLSession.shared
    private let decoder = JSONDecoder()
    
    func fetchWeathers(requestModel: WeatherRequestModel) async throws -> WeatherResponseModel {
        let params = "lat=\(requestModel.lat)&lon=\(requestModel.lng)&units=metric&exclude=current,minutely,daily,alerts&lang=ja&appid=\(API_KEY)"
        let urlString = baseUrl + "?" + params
        print("urlString:", urlString)
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Error fetch weathers.", code: -1)
        }
        let request = URLRequest(url: url)
        let (data, _) = try await shared.data(for: request)
        let response = try decoder.decode(WeatherResponseModel.self, from: data)
        return response
    }
}
