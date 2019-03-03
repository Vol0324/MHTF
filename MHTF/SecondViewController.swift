//
//  SecondViewController.swift
//  MHTF
//
//  Created by Alex Zhou on 2/14/19.
//  Copyright © 2019 MHTF. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController {
    public var cellID : String = "ScheduleCell"
    lazy var schedules : [Schedule] = self.getSchedules()
    var indexSegue: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedules.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ScheduleTableViewCell
            cell.nameLabel.text = schedules[indexPath.row].name
            cell.timeLabel.text = schedules[indexPath.row].time
            indexSegue = indexPath.row
            performSegue(withIdentifier: "showDetailSegue", sender: nil)
            return cell
    }
    
    //prepare the data for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue" {
            let vc = segue.destination as! ScheduleDetailsViewController
            vc.index = 100
        }
    }
    
    //pull from server
    func getSchedules() -> [Schedule]{
        let s1 = Schedule(name: "t1", time: "4:00", category: .dance, date: "04/08")
        let s2 = Schedule(name: "t2", time: "5:00", category: .art, date: "04/09")
        let s3 = Schedule(name: "t3", time: "5:00", category: .art, date: "04/09")
        let s4 = Schedule(name: "t4", time: "5:00", category: .art, date: "04/10")
        return [s1, s2, s3, s4]
    }
    
    func getCellID() -> String{
        return self.cellID
    }
}

