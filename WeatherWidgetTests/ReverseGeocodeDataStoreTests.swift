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

    func testFetchLocationFromLatLng() throws {
        let dataStore = ReverseGeocodeDataStore()
        let exp = expectation(description: "wait async.")
        
        dataStore.fetchLocationFromLatLng(lat: TestHelper.lat, lng: TestHelper.lng) { location in
            print("Success fetch location from lat lng.")
            print("location:", location)
            XCTAssertEqual("世田谷区", location)
            exp.fulfill()
        } onFailure: {
            XCTFail("Error fetch location from lat lng.")
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
}
