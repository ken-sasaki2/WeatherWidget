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
            dt: 1644048000,
            temp: 5.77,
            pressure: 1005.0,
            weather: [Weather(main: "Clouds")]
        ),
        Hourly(
            dt: 1644051600, // 18:00
            temp: 5.49,
            pressure: 1007,
            weather: [Weather(main: "Clear")]
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
            pressure: 1011,
            weather: [Weather(main: "Clear")]
        ),
        Hourly(
            dt: 1644062400, // 21:00
            temp: 3.53,
            pressure: 1013,
            weather: [Weather(main: "Clouds")]
        ),
        Hourly(
            dt: 1644066000,
            temp: 3.23,
            pressure: 1015,
            weather: [Weather(main: "Rain")]
        ),
        Hourly(
            dt: 1644069600,
            temp: 2.82,
            pressure: 1017,
            weather: [Weather(main: "Snow")]
        ),
        Hourly(
            dt: 1644073200, // 00:00
            temp: 2.61,
            pressure: 1019,
            weather: [Weather(main: "Rain")]
        ),
        Hourly(
            dt: 1644076800,
            temp: 2.49,
            pressure: 1021,
            weather: [Weather(main: "Clouds")]
        ),
        Hourly(
            dt: 1644080400,
            temp: 2.35,
            pressure: 1019,
            weather: [Weather(main: "Rain")]
        ),
        Hourly(
            dt: 1644084000, // 03:00
            temp: -2.06,
            pressure: 1017,
            weather: [Weather(main: "Snow")]
        ),
        Hourly(
            dt: 1644087600,
            temp: 1.92,
            pressure: 1015,
            weather: [Weather(main: "Clear")]
        ),
        Hourly(
            dt: 1644091200,
            temp: 1.82,
            pressure: 1013,
            weather: [Weather(main: "Clouds")]
        ),
        Hourly(
            dt: 1644094800, // 06:00
            temp: 1.81,
            pressure: 1000,
            weather: [Weather(main: "Clear")]
        ),
        Hourly(
            dt: 1644098400,
            temp: 2.15,
            pressure: 1013,
            weather: [Weather(main: "Snow")]
        ),
        Hourly(
            dt: 1644102000,
            temp: 2.56,
            pressure: 1011,
            weather: [Weather(main: "Snow")]
        ),
        Hourly(
            dt: 1644105600, // 09:00
            temp: 2.85,
            pressure: 1009,
            weather: [Weather(main: "Clouds")]
        ),
        Hourly(
            dt: 1644109200,
            temp: 3.82,
            pressure: 1007,
            weather: [Weather(main: "Clouds")]
        ),
        Hourly(
            dt: 1644112800,
            temp: 4.77,
            pressure: 1005,
            weather: [Weather(main: "Snow")]
        ),
        Hourly(
            dt: 1644116400, // 12:00
            temp: 5.35,
            pressure: 1003,
            weather: [Weather(main: "Clear")]
        ),
        Hourly(
            dt: 1644120000,
            temp: 5.75,
            pressure: 1001,
            weather: [Weather(main: "Rain")]
        ),
        Hourly(
            dt: 1644123600,
            temp: 5.85,
            pressure: 999,
            weather: [Weather(main: "Rain")]
        ),
        Hourly(
            dt: 1644127200, // 15:00
            temp: 6.21,
            pressure: 997,
            weather: [Weather(main: "Snow")]
        ),
        Hourly(
            dt: 1644130800,
            temp: 6.25,
            pressure: 995,
            weather: [Weather(main: "Snow")]
        ),
        Hourly(
            dt: 1644134400,
            temp: 5.55,
            pressure: 1005,
            weather: [Weather(main: "Rain")]
        ),
        Hourly(
            dt: 1644138000, // 18:00
            temp: 4.98,
            pressure: 1000,
            weather: [Weather(main: "Snow")]
        ),
        Hourly(
            dt: 1644141600,
            temp: 5.22,
            pressure: 1002,
            weather: [Weather(main: "Snow")]
        ),
        Hourly(
            dt: 1644145200,
            temp: 5.44,
            pressure: 1004,
            weather: [Weather(main: "Snow")]
        ),
        Hourly(
            dt: 1644148800, // 21:00
            temp: 5.55,
            pressure: 1006,
            weather: [Weather(main: "Snow")]
        ),
        Hourly(
            dt: 1644152400,
            temp: 4.88,
            pressure: 1008,
            weather: [Weather(main: "Snow")]
        )
    ]
}
