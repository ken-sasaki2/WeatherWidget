//
//  MediumWidgetProvider.swift
//  WidgetExtension
//
//  Created by sasaki.ken on 2022/01/29.
//

import WidgetKit
import SwiftUI

struct MediumWidgetProvider: TimelineProvider {
    private let weatherRepository = RepositoryRocator.getWeatherRepository()
    private let userRepository = RepositoryRocator.getUserRepository()
    private let reverseGeocodeRepository = RepositoryRocator.getReverseGeocodeRepository()
    
    func placeholder(in context: Context) -> MediumWidgetEntryModel {
        MediumWidgetEntryModel(
            currentDate: Date(),
            hourlyWeathers: MockHourly.data,
            currentLocation: "サンプル"
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (MediumWidgetEntryModel) -> ()) {
        let entry = MediumWidgetEntryModel(
            currentDate: Date(),
            hourlyWeathers: MockHourly.data,
            currentLocation: "サンプル"
        )
        completion(entry)
    }
    
    actor Entries {
        var entries: [MediumWidgetEntryModel] = []
        
        func append(model: MediumWidgetEntryModel) {
            entries.append(model)
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<MediumWidgetEntryModel>) -> ()) {
        let entries = Entries()
        let currentDate = Date()
        let currentEpoch = Int(currentDate.timeIntervalSince1970) // 現在時刻のepoch
        let justCurrentEpoch = Double(currentEpoch - (currentEpoch % 3600)) // 現在時のepoch xx:00
        let justCurrentHourDate = Date(timeIntervalSince1970: justCurrentEpoch)
        
        Task {
            let reverseGeocodeRequest = ReverseGeocodeRequestModel(lat: userRepository.lat, lng: userRepository.lng)
            let reversGeocodeResponce = try await reverseGeocodeRepository.fetchLocationFromLatLng(requestModel: reverseGeocodeRequest)
            
            let weatherRequest = WeatherRequestModel(lat: userRepository.lat, lng: userRepository.lng)
            let weatherResponse = try await weatherRepository.fetchWeathers(requestModel: weatherRequest)
            let hourlyWeathers = weatherResponse.hourly
            
            // 未来5時間分Model作る
            for index in 0..<5 {
                let entryModel = MediumWidgetEntryModel(
                    currentDate: justCurrentHourDate + Double((index * 3600)),
                    hourlyWeathers: hourlyWeathers,
                    currentLocation: reversGeocodeResponce.location
                )
                await entries.append(model: entryModel)
            }
            let entries = await entries.entries
            
            if let nextAttemptDate = Calendar.current.date(byAdding: DateComponents(hour: 1, minute: 5), to: justCurrentHourDate) {
                let timeline = Timeline(entries: entries, policy: .after(nextAttemptDate))
                completion(timeline)
            }
        }
    }
}
