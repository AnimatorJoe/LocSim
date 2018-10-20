//
//  ViewController.swift
//  Loc-Sim
//
//  Created by Joseph Jin on 6/29/18.
//  Copyright © 2018 AnimatorJoe. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    // Extracting Location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let loc = locations[0]
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(10, 10) // Zoom
        let currLoc: CLLocationCoordinate2D = CLLocationCoordinate2DMake(loc.coordinate.latitude, loc.coordinate.longitude) // Location
        let region: MKCoordinateRegion = MKCoordinateRegionMake(currLoc, span) // Set region
        map.setRegion(region, animated: true) // Update map
        
        self.map.showsUserLocation = true // Show blue dot
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

