//
//  WeatherViewModel.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/01/29.
//

import Foundation

class WeatherViewModel: NSObject, ObservableObject {
    @Published var hourlyWeather: [Hourly] = []
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
            let hourlyWeather = try await weatherRepository.fetchWeathers()
            self.hourlyWeather = hourlyWeather
        }
        catch {
            self.error = error
        }
    }
}
