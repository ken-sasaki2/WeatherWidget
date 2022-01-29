//
//  MediumWidgetProvider.swift
//  WidgetExtension
//
//  Created by sasaki.ken on 2022/01/29.
//

import WidgetKit
import SwiftUI

struct MediumWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> MediumWidgetEntryModel {
        MediumWidgetEntryModel(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (MediumWidgetEntryModel) -> ()) {
        let entry = MediumWidgetEntryModel(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<MediumWidgetEntryModel>) -> ()) {
        var entries: [MediumWidgetEntryModel] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = MediumWidgetEntryModel(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
