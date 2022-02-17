//
//  MediumWidgetEntryModelTests.swift
//  WeatherWidgetTests
//
//  Created by sasaki.ken on 2022/02/17.
//

import XCTest

class MediumWidgetEntryModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetTimePeriodText() throws {
        let entryModel = MediumWidgetEntryModel(currentDate: Date(), hourlyWeathers: MockHourly.data, currentLocation: "世田谷区")
        let hourlyWeathers = entryModel.hourlyWeathers
        
        let expects = [
            "･", "18", "･",
            "･", "21", "･",
            "･", "0", "･",
            "･", "3", "･",
            "･", "6", "･",
            "･", "9", "･",
            "･", "12", "･",
            "･", "15", "･",
            "･", "18", "･",
            "･", "21", "･"
        ]
        
        hourlyWeathers.enumerated().forEach { index, input in
            let expect = expects[index]
            let result = entryModel.getTimePeriodText(hourlyWeather: input)
            XCTAssertEqual(expect, result)
        }
    }
}
