//
//  ReverseGeocodeDataStore.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/02/05.
//

import CoreLocation

class ReverseGeocodeDataStore {
    
    func fetchLocationFromLatLng(requestModel: ReverseGeocodeRequestModel) async throws -> ReverseGeocodeResponceModel {
        let location = CLLocation(latitude: requestModel.lat, longitude: requestModel.lng)
        
        return try await withCheckedThrowingContinuation { continuation in
            CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
                if let error = error {
                    print("Error fetch location from lat lng.")
                    print("Error message:", error)
                    print("Error locarized message:", error.localizedDescription)
                    continuation.resume(throwing: error)
                }
                
                if let locality = placemarks?.first?.locality {
                    let responce = ReverseGeocodeResponceModel(location: locality)
                    continuation.resume(returning: responce)
                } else {
                    continuation.resume(throwing: NSError(domain: "Error locality not found.", code: -2))
                }
            }
        }
    }
}
