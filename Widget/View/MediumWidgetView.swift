//
//  MediumWidgetView.swift
//  WidgetExtension
//
//  Created by sasaki.ken on 2022/01/29.
//

import WidgetKit
import SwiftUI

struct MediumWidgetView: View {
    @Environment(\.colorScheme) var colorScheme
    var entry: MediumWidgetProvider.Entry
    
    var body: some View {
        let backgroundColor = colorScheme == .dark ? Color.black : Color.white
        let hourlyWeathers = entry.hourlyWeathers
        let timePeriodTexts = entry.timePeriodTexts
        let weatherIcons = entry.weatherIcons
        let temperatureTexts = entry.temperatureTexts
        
        GeometryReader { geometry in
            let geometryWidth = geometry.size.width
            let geometryHeight = geometry.size.height
            let widthPerHour = (geometryWidth - 32) / 24 // 1時間あたりのwidth
            VStack {
                Spacer().frame(height: 16)
                VStack(spacing: 0) {
                    // 赤
                    HStack {
                        Spacer()
                        HStack(spacing: 0) {
                            HStack(spacing: 0) {
                                Text("24")
                                    .foregroundColor(.black)
                                    .font(.system(size: 30, weight: .semibold))
                                    .offset(x: 5)
                                    .fixedSize(horizontal: true, vertical: true)
                                Text("℃")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .offset(x: 5)
                                    .fixedSize(horizontal: true, vertical: true)
                                    .frame(height: geometryHeight / 6, alignment: .bottom)
                            }
                            .frame(width: (geometryWidth - 32) / 2, height: geometryHeight / 6, alignment: .leading)
                            if let location = entry.currentLocation {
                                Text(location)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .medium))
                                    .offset(x: -5)
                                    .frame(width: (geometryWidth - 32) / 2, height: geometryHeight / 6, alignment: .trailing)
                            }
                        }
                        .frame(width: geometryWidth - 32, height: geometryHeight / 6)
                        .background(Color.red)
                        Spacer()
                    }
                    // 緑
                    HStack {
                        Spacer()
                        HStack {
                            
                        }
                        .frame(width: geometryWidth - 32, height: geometryHeight / 3)
                        .background(Color.green)
                        Spacer()
                    }
                    // 青
                    HStack {
                        Spacer()
                        HStack(alignment: .top, spacing: 0) {
                            ForEach(0..<hourlyWeathers.count) { index in
                                VStack(alignment: .center, spacing: 0) {
                                    Text(timePeriodTexts[index])
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .medium))
                                        .fixedSize(horizontal: true, vertical: true)
                                        .frame(width: widthPerHour, alignment: .center)
                                    if isMultipleOfThree(hourlyWeather: hourlyWeathers[index]) {
                                        Image(weatherIcons[index])
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: widthPerHour, height: 27)
                                            .fixedSize(horizontal: true, vertical: true)
                                        Text("\(temperatureTexts[index])℃")
                                            .foregroundColor(.black)
                                            .font(.system(size: 12, weight: .regular))
                                            .fixedSize(horizontal: true, vertical: true)
                                            .frame(width: widthPerHour, alignment: .center)
                                    }
                                }
                            }
                        }
                        .frame(width: geometryWidth - 32, height: geometryHeight / 3)
                        .background(Color.blue)
                        Spacer()
                    }
                }
            }
        }
        .background(backgroundColor)
    }
    
    private func isMultipleOfThree(hourlyWeather: Hourly) -> Bool {
        let hourDate = hourlyWeather.dt
        let date = Date(timeIntervalSince1970: hourDate)
        guard let dateInt = Int(DateFormatHelper.shared.formatToHH(date: date)) else {
            return false
        }
        
        if dateInt % 3 == 0 {
            return true
        } else {
            return false
        }
    }
}

//Path { path in
//    path.move(to: CGPoint(x: 16, y: geometryHeight / 2))
//    path.addLine(to: CGPoint(x: geometryWidth - 16, y: geometryHeight / 2))
//    path.move(to: CGPoint(x: 16, y: (geometryHeight / 2) - 22.5))
//    path.addLine(to: CGPoint(x: geometryWidth - 16, y: (geometryHeight / 2) - 22.5))
//    path.move(to: CGPoint(x: 16, y: (geometryHeight / 2) - 45))
//    path.addLine(to: CGPoint(x: geometryWidth - 16, y: (geometryHeight / 2) - 45))
//
//    path.move(to: CGPoint(x: 16, y: 20))
//    path.addLine(to: CGPoint(x: widthPerHour * 2, y: 10))
//}
//.stroke(.gray, lineWidth: 2)

struct MediumWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        let entry = MediumWidgetEntryModel(
            currentDate: Date(timeIntervalSince1970: 1644048000),
            hourlyWeathers: MockHourly.data,
            currentLocation: "世田谷区"
        )
        
        Group {
            MediumWidgetView(entry: entry)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
                .environment(\.colorScheme, .light)
            MediumWidgetView(entry: entry)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
                .environment(\.colorScheme, .dark)
        }
    }
}
