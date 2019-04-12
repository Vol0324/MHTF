//
//  File.swift
//  MHTF
//
//  Created by Alex Zhou on 4/8/19.
//  Copyright © 2019 MHTF. All rights reserved.
//

import Foundation

struct EventDetails {
    static let events = [0: Schedule(name: "Mental Health Organization Fair", time: "11:00 AM - 1:00 PM", date: "April 8th", location : "The Pit", latitude: 35.910158, longitude: -79.048583),
                         1: Schedule(name: "Careers in Mental Health", time: "5:30 PM", date: "Tuesday, April 9th", location: "Davie Hall Room 112", latitude: 35.912897, longitude: -79.049469),
                         2: Schedule(name: "Doggies and Dialogue", time: "11:30 AM", date: "Tuesday, April 9th", location : "The Pit", latitude: 35.910158, longitude: -79.048583),
                         3: Schedule(name: "Student Recreation Center (SRC) Tabling", time: "12:00 PM - 3:00 PM", date: "Friday, April 12th", location : "SRC", latitude: 35.909261, longitude: -79.047498),
                         4: Schedule(name: "Mental Health and the Arts", time: "6:00 PM - 8:00 PM", date: "Friday, April 12th", location: "Campus Y Anne Queen Lounge", latitude: 35.911368, longitude: -79.051216),
                         5: Schedule(name: "NEDA walk (in Raleigh)", time: "10:00 AM - 12:00 PM", date: "Sunday, April 14th", location: "520 Ashe Ave, Raleigh", latitude: 35.779313, longitude : -78.663028)]
    
    static let details = [0: "Many of the Mental Health Coalition’s organizations will be in the pit from 11:00 AM to 1:00 PM, so come out and meet the compassionate and dedicated students who make their work possible! UNC has so many wonderful organizations, but we need to increase visibility and we want to let the student body know we as organizations are here for them. All of these groups are also knowledgeable about university resources, so please come see us!",
                          1: "Helping Give Away Psychological Science (HGAPS) is putting on this informative panel at 5:30 PM in Davie 112. Come listen to passionate mental health professionals talk about their careers, and enjoy some pizza on us!",
                          2: "The Buddy Project is putting on this event in the pit starting at 11:30 AM. What could be better than getting to hang out with dogs while having an important conversation about mental health?",
                          3: "Come see the SRC and the Mental Health Task Force to pick up resources for working out and mental health in the pit from 12:00 PM to 3:00 PM. There will be other free swag, as well as lots of kind bars for anyone to grab!",
                          4: "From 6:00 PM-8:00 PM, talented Carolina students will be performing in the Anne Queen Lounge in the Campus Y. There is also an art gallery near the Wendy’s in the bottom of the union that will showcase the work of incredible Carolina artists. Pieces will go up periodically throughout the week, and the top three submissions will receive a prize!",
                          5: "The School of Social Work's Mental Health Caucus will be participating in the NEDA Walk. All are welcome to participate and join our team! Here is the link to our team's page. Donations are optional. We will contact team members about carpooling the week of the walk."]
    
    static let date = [0: ("2019-04-08T11:00:00-0400", "2019-04-08T13:00:00-0400"),
                       1: ("2019-04-09T17:30:00-0400", "2019-04-09T18:30:00-0400"),
                         2: ("2019-04-09T11:30:00-0400", "2019-04-09T12:30:00-0400"),
                         3: ("2019-04-12T12:00:00-0400", "2019-04-12T15:00:00-0400"),
                         4: ("2019-04-12T18:00:00-0400", "2019-04-12T20:00:00-0400"),
                         5: ("2019-04-14T10:00:00-0400", "2019-04-14T12:00:00-0400")]
}
