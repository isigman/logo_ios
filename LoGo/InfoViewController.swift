//
//  InfoViewController.swift
//  LoGo
//
//  Created by Ira Sigman on 3/3/18.
//  Copyright © 2018 Ira Sigman. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class InfoViewController: UIViewController, CLLocationManagerDelegate {

    let defaults:UserDefaults = UserDefaults.standard
    
    //MARK: Attributes

    @IBOutlet weak var keyLabel: UILabel!
    
    //location manager
    var locationManager:CLLocationManager!
    
    //map view manager
    @IBOutlet weak var mapView: GMSMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //get vars from UserDefaults
        let key = defaults.string(forKey: "key")
        
        //set the labels
        keyLabel.text = key
        
        sleep(1)
        
        //send location every 10 seconds
        //http://api.logoauthentication.com/insertlocation.php?hex={KEY}&lat={LAT}&lon={LON}
        
        determineMyCurrentLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        
        //get
        //read response from the server
        
        let key = defaults.string(forKey: "key")
        let lat = userLocation.coordinate.latitude
        let lon = userLocation.coordinate.longitude
        let url_str = ("http://api.logoauthentication.com/insertlocation.php?hex=\(key ?? "0")&lat=\(lat)&lon=\(lon)")
        print(url_str)
        do {
            let res = try String(contentsOf:URL(string: url_str)!)
            print(res)
        } catch let error {
            print("Error: \(error)")
        }

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    

}
