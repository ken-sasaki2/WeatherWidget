//
//  DateFormatHelperTests.swift
//  WeatherWidgetTests
//
//  Created by sasaki.ken on 2022/02/17.
//

import XCTest

class DateFormatHelperTests: XCTestCase {
    private let morningTime = Date(timeIntervalSince1970: 1645056000) // 2022年2月17日 木曜日 09:00:00
    private let nightTime = Date(timeIntervalSince1970: 1645099200) // 2022年2月17日 木曜日 21:00:00

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFormatToHHmm() throws {
        XCTContext.runActivity(named: "時刻が09:00の場合") { _ in
            let result = DateFormatHelper.shared.formatToHHmm(date: morningTime)
            XCTAssertEqual("09:00", result)
        }
        XCTContext.runActivity(named: "時刻が21:00の場合") { _ in
            let result = DateFormatHelper.shared.formatToHHmm(date: nightTime)
            XCTAssertEqual("21:00", result)
        }
    }
    
    func testFormatToHH() throws {
        XCTContext.runActivity(named: "時刻が09:00の場合") { _ in
            let result = DateFormatHelper.shared.formatToHH(date: morningTime)
            XCTAssertEqual("09", result)
        }
        XCTContext.runActivity(named: "時刻が21:00の場合") { _ in
            let result = DateFormatHelper.shared.formatToHH(date: nightTime)
            XCTAssertEqual("21", result)
        }
    }
}
