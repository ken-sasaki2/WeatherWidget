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
    
    init(weatherRepository: WeatherRepositoryInterface) {
        self.weatherRepository = weatherRepository
        super.init()
    }
    
    override convenience init() {
        self.init(weatherRepository: RepositoryRocator.getWeatherRepository())
    }
    
    func fetchWeather() async {
        do {
            let response = try await weatherRepository.fetchWeathers()
            self.hourlyWeathers = response.hourly
            print("hourlyWeathers:", hourlyWeathers)
        }
        catch {
            self.error = error
        }
    }
}
