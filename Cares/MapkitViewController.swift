//
//  MapkitViewController.swift
//  Cares
//
//  Created by DE DPU on 4/28/2559 BE.
//  Copyright © 2559 MyApplication. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapkitViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
        let locations = [
            ["name" : "Apple Inc.",
                "latitude" : 37.33187,
                "longitude" : -122.02951,
                "mediaURL" : "http://www.apple.com"],
            ["name" : "BJ's Restaurant & Brewhouse",
                "latitude" : 37.33131,
                "longitude" : -122.03175,
                "mediaURL" : "http://www.bjsrestaurants.com"]
        ]
        
        var annotations = [MKPointAnnotation]()
        for dictionary in locations {
            let latitude = CLLocationDegrees(dictionary["latitude"] as! Double)
            let longitude = CLLocationDegrees(dictionary["longitude"] as! Double)
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let name = dictionary["name"] as! String
            let mediaURL = dictionary["mediaURL"] as! String
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "\(name)"
            annotation.subtitle = mediaURL
            annotations.append(annotation)
        }
        mapView.addAnnotations(annotations)
        centerMapOnLocation(annotations[0], regionRadius: 1000.0)
        
        //location
        /*self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func centerMapOnLocation(location: MKPointAnnotation, regionRadius: Double) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "pin"
        var pin = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseIdentifier) as? MKPinAnnotationView
        if pin == nil {
            pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            pin!.pinColor = .Red
            pin!.canShowCallout = true
            pin!.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
        } else {
            pin!.annotation = annotation
        }
        return pin
    }
    
    func mapView(mapView: MKMapView, annotationView: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == annotationView.rightCalloutAccessoryView {
            let app = UIApplication.sharedApplication()
            app.openURL(NSURL(string: (annotationView.annotation!.subtitle!)!)!)
        }
    }
    
    
    //MARK: Location Delegate Method
    
    /*func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
        self.mapView.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
        
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors: " + error.localizedDescription)
        
    }*/
    
    
    
    
    
    
    
    
}
