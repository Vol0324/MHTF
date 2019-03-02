//
//  ScheduleViewController.swift
//  MHTF
//
//  Created by Alex Zhou on 2/27/19.
//  Copyright © 2019 MHTF. All rights reserved.
//

import UIKit
import MapKit
//MapKit annotation
class ScheduleDetailsViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapDisplay: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        mapDisplay.showsBuildings = true
        mapDisplay.showsScale = true
        mapDisplay.showsUserLocation = true
        mapDisplay.setRegion(getMapLocation(), animated: true)
        
        let coordinates = CLLocationCoordinate2D(latitude: 35.910527, longitude: -79.047666)
        let temp = EventAnnotation(coordinate: coordinates, title: "Carolina Students Union")
        mapDisplay.addAnnotation(temp)
    }
    
    func getMapLocation() -> MKCoordinateRegion{
        //schedule.coordinates
        let coordinates = CLLocationCoordinate2D(latitude: 35.910527, longitude: -79.047666)
        let radius : CLLocationDistance = 500
        let region = MKCoordinateRegion(center: coordinates, latitudinalMeters: radius, longitudinalMeters: radius)
        return region
        
    }
}

class EventAnnotation : NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    init(coordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate = coordinate
        self.title = title
    }
}
