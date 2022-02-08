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
        
        GeometryReader { geometry in
            let geometryWidth = geometry.size.width
            let geometryHeight = geometry.size.height
            let widthPerHour = (geometryWidth - 32) / 24 // 1時間あたりのwidth
            VStack {
                HStack(alignment: .center, spacing: 0) {
                    ForEach(timePeriodTexts, id: \.self) { timePeriodText in
                        Text(timePeriodText)
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                            .fixedSize(horizontal: true, vertical: true)
                            .frame(width: widthPerHour, alignment: .center)
                    }
                }
                .frame(width: geometryWidth - 32, height: geometryHeight - 32)
                .clipped()
            }
            .frame(width: geometryWidth, height: geometryHeight)
        }
        .background(backgroundColor)
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
