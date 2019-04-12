//
//  ScheduleViewController.swift
//  MHTF
//
//  Created by Alex Zhou on 2/27/19.
//  Copyright © 2019 MHTF. All rights reserved.
//

import UIKit
import MapKit
import EventKit
import EventKitUI
import Contacts
//MapKit annotation
class ScheduleDetailsViewController: UIViewController, MKMapViewDelegate, EKEventEditViewDelegate {
    @IBOutlet weak var mapDisplay: MKMapView!
    @IBOutlet weak var textView: UITextView!
    var mkViewID: String = ""
    var index : Int? {
        get {
            return self.navigationController!.index
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapDisplay.delegate = self
        navigationItem.largeTitleDisplayMode = .never
        mapDisplay.showsBuildings = true
        mapDisplay.showsScale = true
        mapDisplay.showsUserLocation = true
        let coordinates = CLLocationCoordinate2D(latitude: EventDetails.events[index!]!.latitude, longitude: EventDetails.events[index!]!.longitude)
        let temp = EventAnnotation(coordinate: coordinates, title: EventDetails.events[index!]!.location)
        mapDisplay.addAnnotation(temp)
        mapDisplay.setRegion(getMapLocation(coordinates: coordinates), animated: true)
        
        let title = EventDetails.events[index!]!.name
        let time = EventDetails.events[index!]!.time + " on " + EventDetails.events[index!]!.date
        let content = EventDetails.details[index!]!
        let setparagraphStyle = NSMutableParagraphStyle()
        setparagraphStyle.alignment = .left
        var attributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1), .paragraphStyle : setparagraphStyle]
        let attributedText = NSMutableAttributedString(string: title, attributes: attributes)
        attributedText.append(NSAttributedString(string: "\n\n", attributes: [.font: UIFont.systemFont(ofSize: 10)]))
        let setparagraphStyle2 = NSMutableParagraphStyle()
        setparagraphStyle2.alignment = .center
        attributes = [.font: UIFont.preferredFont(forTextStyle: .subheadline), .paragraphStyle : setparagraphStyle2]
        attributedText.append(NSMutableAttributedString(string: time, attributes: attributes))
        attributedText.append(NSAttributedString(string: "\n\n", attributes: [.font: UIFont.systemFont(ofSize: 10)]))
        let setparagraphStyle3 = NSMutableParagraphStyle()
        setparagraphStyle3.alignment = .left
        attributes = [.font: UIFont.preferredFont(forTextStyle: .body), .paragraphStyle : setparagraphStyle3]
        attributedText.append(NSMutableAttributedString(string: content, attributes: attributes))
        textView.attributedText = attributedText
    }
    
    
    @IBAction func done(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addEvent(_ sender: Any) {
        let eventStore = EKEventStore()
//        let contact = CNContactStore()
    
        if EKEventStore.authorizationStatus(for: .event) != .authorized {
            eventStore.requestAccess(to: .event, completion: {granted, error in
                if(!granted) {
                 HelperMethodClass.showAlertMessage(message: "It is recommended to do so before continuing.", viewController: self)
                }
                })
//            contact.requestAccess(for: .contacts, completionHandler: {granted, error in
//                if(!granted) {
//                    if(EKEventStore.authorizationStatus(for: .event) != .authorized) {
//                        return
//                    }
//                     HelperMethodClass.showAlertMessage(message: "It is recommended to do so before continuing.", viewController: self)
//
//                }
//            })
            
        } else {
            let date = EventDetails.date[index!]!
            let schedule = EventDetails.events[index!]!
            let details = EventDetails.details[index!]!
            createEvent(eventStore: eventStore, eventSchedule: schedule, start: date.0, end: date.1, eventDetails: details)
        }
    }
    
    func createEvent(eventStore : EKEventStore, eventSchedule : Schedule, start : String, end : String, eventDetails : String) {
        let event = EKEvent(eventStore: eventStore)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        
        event.title = eventSchedule.name
        event.startDate = dateFormatter.date(from: start)
        event.endDate = dateFormatter.date(from: end)
        event.notes = eventDetails
        event.location = eventSchedule.location
        event.calendar = eventStore.defaultCalendarForNewEvents
        
//        let controller = EKEventEditViewController()
//        controller.event = event
//        controller.eventStore = eventStore
//        controller.editViewDelegate = self
//        present(controller, animated: true)
//        print(event.startDate)
        do {
            try eventStore.save(event, span: .thisEvent)
        } catch {
            print("\(error)")
        }
         HelperMethodClass.showSuccessMessage(message: "", viewController: self)
    }
  
    
    func getMapLocation(coordinates : CLLocationCoordinate2D) -> MKCoordinateRegion{

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
    
    override func viewDidLayoutSubviews() {
        textView.setContentOffset(.zero, animated: false)
    }
    
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        controller.dismiss(animated: true)
    }

}

class EventAnnotation : NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
//    let subtitle: String?
    init(coordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate = coordinate
        self.title = title
//        self.subtitle = subtitle
    }
}
//get the data from previous cells
extension UINavigationController {
    func previousViewController() -> UIViewController?{
        
        let length = self.viewControllers.count
        
        let previousViewController: SecondViewController! = self.viewControllers[length - 2] as? SecondViewController
//        print(previousViewController!.cellID)
        return previousViewController
    }
    
}

class HelperMethodClass: NSObject {
    
    class func showAlertMessage(message: String, viewController: UIViewController) {
        DispatchQueue.main.async {
            let alertMessage = UIAlertController(title: "Please turn on Calendar permission in the Settings app", message: message, preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .cancel)
            
            alertMessage.addAction(cancelAction)
            viewController.present(alertMessage, animated: true, completion: nil)
        }
    }
    
    class func showSuccessMessage(message: String, viewController: UIViewController) {
        DispatchQueue.main.async {
            let alertMessage = UIAlertController(title: "Successfully created an event in the Calendar", message: message, preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .cancel)
            
            alertMessage.addAction(cancelAction)
            viewController.present(alertMessage, animated: true, completion: nil)
        }
    }
}
