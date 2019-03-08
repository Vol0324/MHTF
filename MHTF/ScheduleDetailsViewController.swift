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
    var mkViewID: String = ""
    var index : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let indexUnwrapped = index {
            print(indexUnwrapped)
        }
        mapDisplay.delegate = self
        navigationItem.largeTitleDisplayMode = .never
        mapDisplay.showsBuildings = true
        mapDisplay.showsScale = true
        mapDisplay.showsUserLocation = true
        mapDisplay.setRegion(getMapLocation(), animated: true)
        let coordinates = CLLocationCoordinate2D(latitude: 35.910527, longitude: -79.047666)
        let temp = EventAnnotation(coordinate: coordinates, title: "t1", subtitle: "Carolina Students Union")
        mapDisplay.addAnnotation(temp)
    }
    
    func getMapLocation() -> MKCoordinateRegion{
        //schedule.coordinates
        let coordinates = CLLocationCoordinate2D(latitude: 35.910527, longitude: -79.047666)
        let radius : CLLocationDistance = 500
        let region = MKCoordinateRegion(center: coordinates, latitudinalMeters: radius, longitudinalMeters: radius)
        return region
        
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        //schedules' enum here as ID
//        mkViewID = "art"
//        var view: MKMarkerAnnotationView
//        let ann = annotation as? EventAnnotation
//        if let temp = mapView.dequeueReusableAnnotationView(withIdentifier: mkViewID) as? MKMarkerAnnotationView {
//            view = temp
//            view.annotation = ann
//        }
//        else {
//            view = MKMarkerAnnotationView(annotation: ann, reuseIdentifier: mkViewID)
//            //change here
//            view.canShowCallout = true
//            view.calloutOffset = CGPoint(x: -5, y: 5)
//            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//        }
//        return view
//    }
}

class EventAnnotation : NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
//get the data from previous cells
extension UINavigationController {
    func previousViewController() -> UIViewController?{
        
        let length = self.viewControllers.count
        
        let previousViewController: SecondViewController! = self.viewControllers[length - 2] as? SecondViewController
        print(previousViewController!.cellID)
        return previousViewController
    }
    
}
