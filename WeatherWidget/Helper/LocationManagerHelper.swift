//
//  LocationManagerHelper.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/01/29.
//

import CoreLocation

class LocationManagerHelper: NSObject, CLLocationManagerDelegate {
    private var userRepository: UserRepositoryInterface
    private var locationManager: CLLocationManager
    
    init(userRepository: UserRepositoryInterface) {
        self.userRepository = userRepository
        self.locationManager = CLLocationManager()
        super.init()
        self.locationManager.delegate = self
    }
    
    override convenience init() {
        self.init(userRepository: RepositoryRocator.getUserRepository())
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
        
        userRepository.lat = location.latitude
        userRepository.lng = location.longitude
        
        locationManager.stopUpdatingLocation()
    }
}
