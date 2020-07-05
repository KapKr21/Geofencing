//
//  ViewController.swift
//  GeofencingSample
//
//  Created by Kap's on 30/06/20.
//  Copyright © 2020 Kapil. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    let locationManager : CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startUpdatingLocation()
        
        locationManager.distanceFilter = 100
        
        //locationManager.stopUpdatingLocation()
        
        //Making a region
        let geoFenceRegion : CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(43.61871, -116.241607), radius: 100, identifier: "Village")
        locationManager.startMonitoring(for: geoFenceRegion)
    }
}

extension ViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        for currentLocation in locations {
            print("\(String(describing: index)) : \(currentLocation)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("You entered in the region : \(region.identifier)")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("You exited from the region : \(region.identifier)")
    }
}

