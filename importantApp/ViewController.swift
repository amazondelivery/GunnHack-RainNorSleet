//
//  ViewController.swift
//  importantApp
//
//  Created by Vikram Balaji on 2/5/22.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    private let location =  CLLocationManager()
    private var userCoordinate: CLLocationCoordinate2D?
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationServices()
        // Do any additional setup after loading the view.
    }
    
    private func zoomToLatest(coordinate: CLLocationCoordinate2D){
        let zoomArea = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(zoomArea, animated: true)
        location.stopUpdatingLocation()
    }
    

    


}

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else {return}
        
        userCoordinate =  latestLocation.coordinate
        
        zoomToLatest(coordinate: userCoordinate ?? latestLocation.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("change in authorization ")
        locationServices()
    }
    
    private func locationUpdates(location: CLLocationManager) {
        location.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        location.startUpdatingLocation()
    }
    
    private func locationServices(){
        location.delegate = self
        
        switch location.authorizationStatus {
            case .restricted, .denied:
                location.requestWhenInUseAuthorization()
            case .authorizedWhenInUse:
                locationUpdates(location: location)
            case .authorizedAlways:
                location.requestWhenInUseAuthorization()
            default:
                location.requestWhenInUseAuthorization()
            
                
                        
        }
}
}
