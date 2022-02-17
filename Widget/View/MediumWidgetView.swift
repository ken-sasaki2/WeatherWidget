//
//  MediumWidgetView.swift
//  WidgetExtension
//
//  Created by sasaki.ken on 2022/01/29.
//

import WidgetKit
import SwiftUI

struct PressureGraphPoint: Identifiable {
    var id = UUID()
    var points: [CGPoint] = []
}

struct MediumWidgetView: View {
    @Environment(\.colorScheme) var colorScheme
    var entry: MediumWidgetProvider.Entry
    
    var body: some View {
        let currentDate = DateFormatHelper.shared.formatToHH(date: entry.date)
        let hourlyWeathers = entry.hourlyWeathers
        let timePeriodTexts = entry.timePeriodTexts
        let weatherIcons = entry.weatherIcons
        let temperatureTexts = entry.temperatureTexts
        let hourlyPressures = entry.hourlyPressures
        
        GeometryReader { geometry in
            let geometryWidth = geometry.size.width
            let geometryHeight = geometry.size.height
            let widthPerHour = (geometryWidth - 32) / 24 // 1時間あたりのwidth
            VStack {
                Spacer().frame(height: 16)
                VStack(spacing: 0) {
                    // 現在気温、地点名
                    HStack {
                        Spacer()
                        HStack(spacing: 0) {
                            HStack(spacing: 0) {
                                Text(String(format: "%0.0f", hourlyWeathers[0].temp))
                                    .foregroundColor(ColorManager.font)
                                    .font(.system(size: 30, weight: .semibold))
                                    .offset(x: 5)
                                    .fixedSize(horizontal: true, vertical: true)
                                Text("℃" + " \(currentDate):00" +  "現在")
                                    .foregroundColor(ColorManager.font)
                                    .font(.system(size: 14, weight: .medium))
                                    .offset(x: 5)
                                    .fixedSize(horizontal: true, vertical: true)
                                    .frame(height: geometryHeight / 6, alignment: .bottom)
                            }
                            .frame(width: (geometryWidth - 32) / 2, height: geometryHeight / 6, alignment: .leading)
                            if let location = entry.currentLocation {
                                Text(location)
                                    .foregroundColor(ColorManager.font)
                                    .font(.system(size: 14, weight: .medium))
                                    .offset(x: -5)
                                    .frame(width: (geometryWidth - 32) / 2, height: geometryHeight / 6, alignment: .bottomTrailing)
                            }
                        }
                        .frame(width: geometryWidth - 32, height: geometryHeight / 6)
                        Spacer()
                    }
                    // グラフ
                    HStack {
                        Spacer()
                        HStack {
                            GeometryReader { graphGeometry in
                                let graphGeometryWidth = graphGeometry.size.width
                                let graphGeometryHeight = graphGeometry.size.height
                                let graphBackLineStartPoint = (widthPerHour * 0.5)
                                let graphBackLineEndPoint = graphGeometryWidth - graphBackLineStartPoint
                                let pressureGraphPoints = getPressureGraphPoints(hourlyPressures: hourlyPressures, width: graphGeometryWidth, height: graphGeometryHeight)
                                ZStack {
                                    // 背景ライン
                                    Path { path in
                                        path.move(to: CGPoint(x: graphBackLineStartPoint, y:3))
                                        path.addLine(to: CGPoint(x: graphBackLineEndPoint, y: 3))
                                        path.move(to: CGPoint(x: graphBackLineStartPoint, y: graphGeometryHeight / 2))
                                        path.addLine(to: CGPoint(x: graphBackLineEndPoint, y: graphGeometryHeight / 2))
                                        path.move(to: CGPoint(x: graphBackLineStartPoint, y: graphGeometryHeight - 3))
                                        path.addLine(to: CGPoint(x: graphBackLineEndPoint, y: graphGeometryHeight - 3))
                                    }
                                    .stroke(ColorManager.graphBackground, lineWidth: 1)
                                    // 気圧グラフ
                                    ForEach(pressureGraphPoints) { pressureGraphPoint in
                                        Path { path in
                                            path.move(to: pressureGraphPoint.points[0])
                                            for index in 1..<pressureGraphPoint.points.count {
                                                path.addLine(to: pressureGraphPoint.points[index])
                                            }
                                        }
                                        .stroke(ColorManager.graph, lineWidth: 3)
                                        .offset(x: widthPerHour * 0.5) // timePeriodTextsのx軸と合わせて描画]
                                        .clipped()
                                    }
                                }
                            }
                        }
                        .frame(width: geometryWidth - 32, height: geometryHeight / 3)
                        Spacer()
                    }
                    // 時刻、天気アイコン、気温
                    HStack {
                        Spacer()
                        HStack(alignment: .top, spacing: 0) {
                            ForEach(0..<hourlyWeathers.count) { index in
                                VStack(alignment: .center, spacing: 0) {
                                    Text(timePeriodTexts[index])
                                        .foregroundColor(ColorManager.font)
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
                                            .foregroundColor(ColorManager.font)
                                            .font(.system(size: 12, weight: .medium))
                                            .fixedSize(horizontal: true, vertical: true)
                                            .frame(width: widthPerHour, alignment: .center)
                                    }
                                }
                            }
                        }
                        .frame(width: geometryWidth - 32, height: geometryHeight / 3)
                        Spacer()
                    }
                }
            }
        }
        .background(ColorManager.background)
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
    
    private func getPressureGraphPoints(hourlyPressures: [Double], width: CGFloat, height: CGFloat) -> [PressureGraphPoint] {
        let currentPressure = hourlyPressures[0]
        var pressureGraphPoints: [PressureGraphPoint] = []
        var tempPressurePoint = PressureGraphPoint()
        
        hourlyPressures.enumerated().forEach { index, hourlyPressure  in
            let pressureGraphPointWidth = (width / 24) * CGFloat(index) // 時刻ごとのグラフ描画のx軸を作る
            
            let heightPerHpa = height / 40 // 1hpaあたりのheight
            let maxHpa = currentPressure + 20 // グラフ描画の上限の基準値
            let diffPressure = maxHpa - hourlyPressure // 各時間の上限基準値からの差分
            let pressureGraphPointHeight = diffPressure * heightPerHpa// 時刻毎の気圧グラフ描画のy軸
            let points = CGPoint(x: pressureGraphPointWidth, y: pressureGraphPointHeight)
            
            tempPressurePoint.points.append(points)
        }
        
        pressureGraphPoints.append(tempPressurePoint)
        
        return pressureGraphPoints
    }
}

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
