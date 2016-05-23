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
            ["name" : "โรงพยาบาลบางกรวย",
                "latitude" : 13.804707597,
                "longitude" : 100.47217239,
                "Address" : "44 ม.8 ถ.กรุงนนท์-วงถนอม ต.วัดชลอ อ.บางกรวย จ.นนทบุรี 11130"],
            ["name" : "ศูนย์การแพทย์กาญจนาภิเษก มหาวิทยาลัยมหิดล",
                "latitude" : 13.787048038,
                "longitude" : 100.32363154,
                "Address" : "999 ถ.บรมราชชนนี,นครปฐม"],
            ["name" : "สถานพยาบาลรวมแพทย์",
                "latitude" : 8.1016815222,
                "longitude" : 98.91107521,
                "Address" : "529 ถ.อุตรกิจ ต.กระบี่ใหญ่ อ.เมือง จ.กระบี่ 81000"],
            ["name" : "สถานพยาบาลปากช่องเมดิคอล",
                "latitude" : 14.668771887,
                "longitude" : 101.42021401,
                "Address" : "468-470 ถ.มิตรภาพ ต.ปากช่อง อ.ปากช่อง จ.นครราชสีมา 30130"],
            ["name" : "โรงพยาบาลนนทเวช",
                "latitude" : 13.856493853,
                "longitude" : 100.54132905,
                "Address" : "30/8 ม.2 ถ.งามวงศ์วาน ต.บางเขน อ.เมือง จ.นนทบุรี 11000"],
            ["name" : "โรงพยาบาลสมิติเวช",
                "latitude" : 13.734755,
                "longitude" : 100.576859,
                "Address" : "133 ซ.สุขุมวิท 49 แขวงคลองตันเหนือ เขตวัฒนา กทม. 10110"]
        ]
        
        var annotations = [MKPointAnnotation]()
        for dictionary in locations {
            let latitude = CLLocationDegrees(dictionary["latitude"] as! Double)
            let longitude = CLLocationDegrees(dictionary["longitude"] as! Double)
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let name = dictionary["name"] as! String
            let address = dictionary["Address"] as! String
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "\(name)"
            annotation.subtitle = address
            annotations.append(annotation)
        }
        mapView.addAnnotations(annotations)
        centerMapOnLocation(annotations[0], regionRadius: 1000000.0)
        
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
