//
//  WeatherRepositoryInterface.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/01/29.
//

import Foundation

protocol WeatherRepositoryInterface {
    func fetchWeathers(requestModel: WeatherRequestModel) async throws -> WeatherResponseModel
}
