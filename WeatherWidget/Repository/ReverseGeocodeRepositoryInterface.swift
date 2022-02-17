//
//  ReverseGeocodeRepositoryInterface.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/02/06.
//

import Foundation

protocol ReverseGeocodeRepositoryInterface {
    func fetchLocationFromLatLng(requestModel: ReverseGeocodeRequestModel) async throws -> ReverseGeocodeResponceModel
}
