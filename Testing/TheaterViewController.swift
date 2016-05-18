//
//  TheaterViewController.swift
//  Testing
//
//  Created by Paul Benbrook on 5/18/16.
//  Copyright © 2016 Team IPC. All rights reserved.
//

import UIKit
import MapKit

class TheaterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func GetDirections(sender: AnyObject) {
		
		let latitude:CLLocationDegrees =  theaterLatitude
		let longitute:CLLocationDegrees =  theaterLongitude
		
		let coordinate = CLLocationCoordinate2DMake(latitude, longitute)
		
		let placemark : MKPlacemark = MKPlacemark(coordinate: coordinate, addressDictionary:nil)
		
		let mapItem:MKMapItem = MKMapItem(placemark: placemark)
		
		mapItem.name = "Hollywood Blvd Cinema"
		
		let launchOptions:NSDictionary = NSDictionary(object: MKLaunchOptionsDirectionsModeDriving, forKey: MKLaunchOptionsDirectionsModeKey)
		
		let currentLocationMapItem:MKMapItem = MKMapItem.mapItemForCurrentLocation()
		
		MKMapItem.openMapsWithItems([currentLocationMapItem, mapItem], launchOptions: launchOptions as? [String : AnyObject])
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
