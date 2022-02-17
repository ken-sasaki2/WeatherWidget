//
//  WidgetBundle.swift
//  WidgetExtension
//
//  Created by sasaki.ken on 2022/01/29.
//

import WidgetKit
import SwiftUI

@main
struct WidgetBundle: SwiftUI.WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        MediumWidgetMaster()
    }
}
