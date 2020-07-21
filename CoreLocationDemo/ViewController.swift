//
//  ViewController.swift
//  CoreLocationDemo
//
//  Created by Jamario Davis on 7/21/20.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // distanceFilter controls how frequent you want updates to be.
        locationManager.distanceFilter = 0.0
        
        // For better energy efficient app add these two lines of code.
        // locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        // locationManager.distanceFilter = 5.0
        
        
        // Request permission for user's location
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first!
        print("location update latitude: \(location.coordinate.latitude) , longitude: \(location.coordinate.longitude)")
    }


}












































































