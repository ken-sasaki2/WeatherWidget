//
//  WeatherTypeTranslatorTests.swift
//  WeatherWidgetTests
//
//  Created by sasaki.ken on 2022/02/08.
//

import XCTest

class WeatherTypeTranslatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWeatherTypeTranslator() throws {
        let inputs: [WeatherType] = [.Clear, .Clouds, .Rain, .Snow]
        let expects = ["hare_noon", "cloudy", "rain", "snow"]
        
        for (index, input) in inputs.enumerated() {
            let expect = expects[index]
            let result = WeatherTypeTranslator.translate(type: input)
            XCTAssertEqual(expect, result)
        }
    }
}
                            
