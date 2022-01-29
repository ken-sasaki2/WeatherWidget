//
//  WeatherViewModel.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/01/29.
//

import Foundation

class WeatherViewModel: NSObject, ObservableObject {
    @Published var hourlyWeathers: [Hourly] = []
    @Published var error: Error = NSError()
    private let weatherRepository: WeatherRepositoryInterface
    private let userRepository: UserRepositoryInterface
    
    init(weatherRepository: WeatherRepositoryInterface, userRepository: UserRepositoryInterface) {
        self.weatherRepository = weatherRepository
        self.userRepository = userRepository
        super.init()
    }
    
    override convenience init() {
        self.init(weatherRepository: RepositoryRocator.getWeatherRepository(), userRepository: RepositoryRocator.getUserRepository())
    }
    
    func createRequestModel() -> WeatherRequestModel {
        let requestModel = WeatherRequestModel(
            lat: userRepository.lat,
            lng: userRepository.lng
        )
        
        return requestModel
    }
    
    func fetchWeathers() async {
        do {
            let response = try await weatherRepository.fetchWeathers(requestModel: createRequestModel())
            self.hourlyWeathers = response.hourly
            print("hourlyWeathers:", hourlyWeathers)
        }
        catch {
            self.error = error
        }
    }
}
