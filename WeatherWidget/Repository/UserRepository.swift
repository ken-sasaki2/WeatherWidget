//
//  UserRepository.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/01/29.
//

import Foundation

class UserRepository: UserRepositoryInterface {
    private let userDefaultsDataStore = UserDefaultsDataStore()
    
    var lat: Double {
        get {
            userDefaultsDataStore.lat
        }
        set(newValue) {
            userDefaultsDataStore.lat = newValue
        }
    }
    
    var lng: Double {
        get {
            userDefaultsDataStore.lng
        }
        set(newValue) {
            userDefaultsDataStore.lng = newValue
        }
    }
}
