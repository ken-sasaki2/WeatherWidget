//
//  AppDelegate.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/01/29.
//

import SwiftUI

class AppDelegate: UIResponder, UIApplicationDelegate {
    private let locationManagerHelper = LocationManagerHelper()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        locationManagerHelper.callLocationManager()
        
        return true
    }
}
