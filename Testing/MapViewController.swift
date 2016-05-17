//
//  SecondViewController.swift
//  Testing
//
//  Created by Paul Benbrook on 4/4/16.
//  Copyright © 2016 Team IPC. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController, CLLocationManagerDelegate {
    
    var manager:CLLocationManager!
    
    @IBOutlet var map: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
            
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        let latitude = theaterLatitude
        let longitude = theaterLongitude
        
        let latDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
    
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
        
        self.map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        annotation.title = "Hollywood Blvd"
        
        self.map.addAnnotation(annotation)
            
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation:CLLocation = locations[0] as CLLocation
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        let latDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
        
        self.map.setRegion(region, animated: true)
    }
    
    @IBAction func NavButton(sender: AnyObject) {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}