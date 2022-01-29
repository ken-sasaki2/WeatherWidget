//
//  UserDefaultsDataStore.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/01/29.
//

import Foundation

final class UserDefaultsDataStore {
    
    private enum DefaultsKey: String {
        case lat
        case lng
    }
    
    private var defaults: UserDefaults {
        UserDefaults.standard
    }
    
    var lat: Double {
        get {
            defaults.double(forKey: DefaultsKey.lat.rawValue)
        }
        set(newValue) {
            defaults.set(newValue, forKey: DefaultsKey.lat.rawValue)
        }
    }
    
    var lng: Double {
        get {
            defaults.double(forKey: DefaultsKey.lng.rawValue)
        }
        set(newValue) {
            defaults.set(newValue, forKey: DefaultsKey.lng.rawValue)
        }
    }
}
