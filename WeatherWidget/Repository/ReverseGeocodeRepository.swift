//
//  ReverseGeocodeRepository.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/02/06.
//

import Foundation

class ReverseGeocodeRepository: ReverseGeocodeRepositoryInterface {
    private let reverseGeocodeDataStore = ReverseGeocodeDataStore()
    
    func fetchLocationFromLatLng(requestModel: ReverseGeocodeRequestModel) async throws -> ReverseGeocodeResponceModel {
        do {
            let responce = try await reverseGeocodeDataStore.fetchLocationFromLatLng(requestModel: requestModel)
            return responce
        }
        catch {
            throw error
        }
    }
}
