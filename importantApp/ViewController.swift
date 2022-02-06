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
    
    public let location =  CLLocationManager()

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationServices()
        // Do any additional setup after loading the view.
    }
    

    


}

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {

    }
    
    private func locationServices(){
        location.delegate = self
        
        if location.authorizationStatus == .notDetermined{
            location.requestAlwaysAuthorization()
        } else{
            
        }
}
}
