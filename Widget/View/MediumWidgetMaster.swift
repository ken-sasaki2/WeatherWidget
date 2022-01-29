//
//  MediumWidgetMaster.swift
//  WidgetExtension
//
//  Created by sasaki.ken on 2022/01/29.
//

import WidgetKit
import SwiftUI

struct MediumWidgetMaster: Widget {
    let kind: String = "MediumWidgetMaster"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: MediumWidgetProvider()) { entry in
            MediumWidgetView()
        }
        .configurationDisplayName("天気予報ウィジェット")
        .description("現在時刻から未来の天気、気温、気圧グラフを確認できます")
        .supportedFamilies([.systemMedium])
    }
}
