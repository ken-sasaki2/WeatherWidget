//
//  WeatherWidgetTests.swift
//  WeatherWidgetTests
//
//  Created by sasaki.ken on 2022/01/29.
//

import XCTest

class WeatherWidgetTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWeatherDataStore() async throws {
        let dataStore = WeatherDataStore()
        let response = try await dataStore.fetchWeathers(params: "")
        
        print("Success fetch weathers.")
        print("Response hourly:", response.hourly)
        
        XCTAssert(response.hourly.count > 0)
    }
}
