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
    
    func placeholder(in context: Context) -> MediumWidgetEntryModel {
        MediumWidgetEntryModel(
            date: Date(),
            hourlyWeathers: MockHourly.data
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (MediumWidgetEntryModel) -> ()) {
        let entry = MediumWidgetEntryModel(
            date: Date(),
            hourlyWeathers: MockHourly.data
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
        // 緯度経度取得（UserDefaultsから取得）✔︎
        // 更新時刻設定（1時間に一回）✔︎
        // MediumWidgetEntryModelにresponseを追加（entryDateは必須で未来数時間分も用意してもいいかも）
        // entriesに値を追加 ✔︎
        
        let entries = Entries()
        let currentDate = Date()
        let currentEpoch = Int(currentDate.timeIntervalSince1970) // 現在時刻のepoch
        let justCurrentEpoch = Double(currentEpoch - (currentEpoch % 3600)) // 現在時のepoch xx:00
        let justCurrentHourDate = Date(timeIntervalSince1970: justCurrentEpoch)
        
        Task {
            let requestModel = WeatherRequestModel(lat: userRepository.lat, lng: userRepository.lng)
            let response = try await weatherRepository.fetchWeathers(requestModel: requestModel)
            let hourlyWeathers = response.hourly
            
            // 未来5時間分Model作る
            for index in 0..<5 {
                let entryModel = MediumWidgetEntryModel(
                    date: justCurrentHourDate + Double((index * 3600)),
                    hourlyWeathers: hourlyWeathers
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
