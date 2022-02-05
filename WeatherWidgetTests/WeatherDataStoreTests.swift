//
//  WeatherDataStoreTests.swift
//  WeatherWidgetTests
//
//  Created by sasaki.ken on 2022/01/29.
//

import XCTest

class WeatherDataStoreTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchWeathers() async throws {
        let dataStore = WeatherDataStore()
        let request = WeatherRequestModel(lat: 35.65146, lng: 139.63678) // 世田谷区経堂
        let response = try await dataStore.fetchWeathers(requestModel: request)
        
        print("Success fetch weathers.")
        print("Response hourly:", response.hourly)
        
        XCTAssert(response.hourly.count > 0)
    }
}
