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
    var category : category
    var date : String
    enum category {
        case dance
        case speech
        case art
    }
    
    init (name : String, time : String, category : Schedule.category, date : String) {
        self.name = name
        self.time = time
        self.category = category
        self.date = date
    }
}
