//
//  Schedule.swift
//  MHTF
//
//  Created by Alex Zhou on 2/25/19.
//  Copyright © 2019 MHTF. All rights reserved.
//

//A struct that holds information about Schedules. Probably will be pulled from web server?
struct Schedule {
    var name : String
    var time : String
    var date : String
    var location : String
    var longitude : Double
    var latitude : Double
//    var location2 : String
    //CLLocationCoordinate2D of the places
    
    
    init (name : String, time : String, date : String, location: String, latitude: Double, longitude: Double) {
        self.name = name
        self.time = time
        self.date = date
        self.location = location
//        self.location2 = location2
        self.longitude = longitude
        self.latitude = latitude
    }

    
}
