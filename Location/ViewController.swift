//
//  ViewController.swift
//  Location
//
//  Created by AlexanderYakovenko on 8/15/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var locationManager: CLLocationManager?
    var startLocation: CLLocation?
    
    @IBOutlet weak var textLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
        
        
        
        
    }

    
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if startLocation == nil {
            startLocation = locations.first
        } else {
            guard let latest = locations.first else {
                return
            }
            let distanceInMeters = startLocation?.distance(from: latest)
            print("distance in meterc: \(String(describing: distanceInMeters))")
            textLabel.text = String(describing: distanceInMeters)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager?.startUpdatingLocation()
        }
    }
    
    
}
