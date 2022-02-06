//
//  ReverseGeocodeDataStore.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/02/05.
//

import CoreLocation

class ReverseGeocodeDataStore {
    
    func fetchLocationFromLatLng(lat: Double, lng: Double, complication: @escaping(ReverseGeocodeResponce) -> Void) {
        var responce = ReverseGeocodeResponce()
        let location = CLLocation(latitude: lat, longitude: lng)
        
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print("Error fetch location from lat lng.")
                print("Error message:", error)
                print("Error locarized message:", error.localizedDescription)
                responce.error = error
                complication(responce)
            }
            
            guard let locality = placemarks?.first?.locality else {
                print("Error placemarks not found.")
                responce.error = error
                complication(responce)
                return
            }
            
            responce.location = locality
            complication(responce)
        }
    }
}
