//
//  LocationService.swift
//  PlateTracker
//
//  Created by Jose on 21/07/2025.
//

import Foundation
import CoreLocation
import Combine

final class LocationService: NSObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    private let locationSubject = PassthroughSubject<CLLocationCoordinate2D, Never>()
    
    var currentLocationPublisher: AnyPublisher<CLLocationCoordinate2D, Never> {
        locationSubject.eraseToAnyPublisher()
    }
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else { return }
        locationSubject.send(coordinate)
    }
}
