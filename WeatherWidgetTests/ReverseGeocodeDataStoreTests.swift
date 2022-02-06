//
//  ReverseGeocodeDataStoreTests.swift
//  WeatherWidgetTests
//
//  Created by sasaki.ken on 2022/02/05.
//

import XCTest

class ReverseGeocodeDataStoreTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchLocationFromLatLng() async throws {
        let dataStore = ReverseGeocodeDataStore()
        let requestModel = ReverseGeocodeRequestModel(lat: TestHelper.lat, lng: TestHelper.lng)
        let responce = try await dataStore.fetchLocationFromLatLng(requestModel: requestModel)
        
        print("Success test fetch location from lat lng.")
        print("responce:", responce)
        
        XCTAssertEqual("世田谷区", responce.location)
    }
}
