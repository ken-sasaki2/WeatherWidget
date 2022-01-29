//
//  LocationManagerHelper.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/01/29.
//

import CoreLocation

final class LocationManagerHelper: NSObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        self.locationManager.delegate = self
    }
    
    func callLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else {
            return
        }
        
        let location = CLLocationCoordinate2D(
            latitude: newLocation.coordinate.latitude,
            longitude: newLocation.coordinate.longitude
        )
        
        print("緯度:", location.latitude, "経度:", location.longitude)
        locationManager.stopUpdatingLocation()
    }
}
