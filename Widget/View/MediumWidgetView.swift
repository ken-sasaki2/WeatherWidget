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
    // var entry: MediumWidgetProvider.Entry
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MediumWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MediumWidgetView()
                .previewContext(WidgetPreviewContext(family: .systemMedium))
                .environment(\.colorScheme, .light)
            MediumWidgetView()
                .previewContext(WidgetPreviewContext(family: .systemMedium))
                .environment(\.colorScheme, .dark)
        }
    }
}
