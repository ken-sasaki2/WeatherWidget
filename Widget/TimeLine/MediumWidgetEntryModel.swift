//
//  MediumWidgetEntryModel.swift
//  WidgetExtension
//
//  Created by sasaki.ken on 2022/01/29.
//

import WidgetKit
import SwiftUI

struct MediumWidgetEntryModel: TimelineEntry {
    let date: Date
    var hourlyWeathers: [Hourly]
    
    init(currentDate: Date, hourlyWeathers: [Hourly]) {
        self.date = currentDate
        self.hourlyWeathers = hourlyWeathers
    }
}
