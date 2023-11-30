//
//  ViewController.swift
//  dlewis_MapGPS
//
//  Created by Derwin Alex-Lanier Lewis on 11/28/23.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var mapSwitch: UISwitch!
    @IBOutlet weak var zoomSlider: UISlider!
    let myAnnotation = MKPointAnnotation() // a marker
    let locationManager = CLLocationManager() // manage GPS
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup the map
        myMap.delegate = self
        myMap.mapType = .hybrid //.standard
        myMap.isZoomEnabled = true
        myMap.isScrollEnabled = true
        myMap.addAnnotation(myAnnotation)
        
        let tmpRegion = MKCoordinateRegion(center:CLLocationCoordinate2D(latitude: 37.33, longitude: -122.032), latitudinalMeters: 500, longitudinalMeters: 500)
        
        myMap.setRegion(tmpRegion, animated: true)
        
        // Setup GPS
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // asking for permission to use GPS
        
        // setup the switch
        mapSwitch.setOn(true, animated: true)
        
        // setup the slider
        zoomSlider.maximumValue = 3.0
        zoomSlider.minimumValue = 0.0
        zoomSlider.setValue(1.05, animated: true)
    }
    
    // when GPS use permission changes, call this function
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Restricted")
        case .denied:
            print("Not allowed to use")
        case .authorizedWhenInUse, .authorizedAlways: // allow to use GPS
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        default:
            break
        }
    }
//function to be called when there is a location update
    func locationManager(_ manager: CLLocationManager, didUpdateLocations location: [CLLocation]) {
        let locValue: CLLocationCoordinate2D = manager.location!.coordinate
        let myLocation = CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude)
        myMap.setCenter(myLocation, animated: true)
        
        myAnnotation.coordinate = myLocation
    }

    @IBAction func changeMapType(_ sender: Any) {
        if mapSwitch.isOn {
            myMap.mapType = .hybrid
        } else {
            myMap.mapType = .standard
        }
    }
    
    @IBAction func zoomInOutMap(_ sender: Any) {
        let miles = Double(zoomSlider.value)
        let delta = miles / 69.0
        
        var currentRegion = myMap.region
        currentRegion.span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        myMap.region = currentRegion
    }
    
}

