//
//  DateFormatHelper.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/02/08.
//

import Foundation

class DateFormatHelper {
    static let shared = DateFormatHelper()
    
    private let hourAndMinutesFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "Asia/Tokyo")
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    func formatToHHmm(date: Date) -> String {
        return hourAndMinutesFormatter.string(from: date)
    }
}
