//
//  ArtworksDetailsController.swift
//  MHTF
//
//  Created by Alex Zhou on 3/5/19.
//  Copyright © 2019 MHTF. All rights reserved.
//

import UIKit

class ArtworksDetailsController: UITableViewController{
    var index : Int?
    var cellID : String?
    //    var cellID : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell : UITableViewCell
            if(indexPath.row == 0) {
                cellID = "pictureCell"
                cell = tableView.dequeueReusableCell(withIdentifier: cellID!, for: indexPath) as! ArtworkTableViewCell
                cell.imageView!.image = UIImage(named: "IMG_3552")
            }
            else {
                cellID = "textCell"
                cell = tableView.dequeueReusableCell(withIdentifier: cellID!, for: indexPath) as! TextTableViewCell
            }
            
            
            return cell
    }


   
}
