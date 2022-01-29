//
//  WeatherWidgetApp.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/01/29.
//

import SwiftUI

@main
struct WeatherWidgetApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
