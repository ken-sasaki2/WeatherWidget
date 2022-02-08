//
//  MockHourly.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/02/05.
//

import Foundation

struct MockHourly {
    static let data: [Hourly] = [
        Hourly(
            dt: 1644044400,
            temp: 5.87,
            pressure: 1007,
            weather: [Weather(main: "Clear")]
        ),
        Hourly(
            dt: 1644048000,
            temp: 5.77,
            pressure: 1007,
            weather: [Weather(main: "Clouds")]
        ),
        Hourly(
            dt: 1644051600,
            temp: 5.49,
            pressure: 1008,
            weather: [Weather(main: "Rain")]
        ),
        Hourly(
            dt: 1644055200,
            temp: 4.85,
            pressure: 1009,
            weather: [Weather(main: "Snow")]
        ),
        Hourly(
            dt: 1644058800,
            temp: 4.13,
            pressure: 1010,
            weather: [Weather(main: "Clear")]
        )
        ,
        Hourly(
            dt: 1644062400,
            temp: 3.53,
            pressure: 1011,
            weather: [Weather(main: "Clouds")]
        )
        ,
        Hourly(
            dt: 1644066000,
            temp: 3.23,
            pressure: 1011,
            weather: [Weather(main: "Rain")]
        )
        ,
        Hourly(
            dt: 1644069600,
            temp: 2.82,
            pressure: 1012,
            weather: [Weather(main: "Snow")]
        )
    ]
}
