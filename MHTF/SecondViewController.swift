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
    var schedulesCount = EventDetails.events.count
    var indexSegue: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
//        tableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: cellID)
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedulesCount;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ScheduleTableViewCell
            cell.nameLabel.text = EventDetails.events[indexPath.row]!.name
            cell.timeLabel.text = EventDetails.events[indexPath.row]!.time + " on " + EventDetails.events[indexPath.row]!.date
            cell.position = indexPath.row
            return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            indexSegue = indexPath.row
            performSegue(withIdentifier: "showDetailSegue", sender: indexPath.row)
    }
    
    //prepare the data for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue" {
            let destination = segue.destination as! UINavigationController
            destination.index = sender as? Int
        }
    }
    
    
    func getCellID() -> String{
        return self.cellID
    }
}

extension ScheduleTableViewCell {
    private struct temp {
        static var index : Int = 0
    }
    var position: Int {
        get {
            return temp.index
        }
        set {
            temp.index = newValue
        }
    }
}
