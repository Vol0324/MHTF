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
    var cellHeight : CGFloat?
    //    var cellID : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        navigationItem.largeTitleDisplayMode = .never
        self.tableView.register(ArtworkTableViewCell.self, forCellReuseIdentifier: "pictureCell")
    

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            if(indexPath.row == 0) {
                cellID = "pictureCell"
                let cell = tableView.dequeueReusableCell(withIdentifier: cellID!, for: indexPath) as! ArtworkTableViewCell
                cell.mainImageView.image = UIImage(named: "IMG_3552")
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                return cell
            }
            else {
                cellID = "textCell"
                let cell = tableView.dequeueReusableCell(withIdentifier: cellID!, for: indexPath) as! TextTableViewCell
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                return cell
            }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            let currentImage = UIImage(named: "IMG_3552")
            let imageCrop = currentImage?.getCropRatio()
            return tableView.frame.width / imageCrop!
    }
        else {
            return UITableView.automaticDimension
        }
}
}

extension UIImage {
    func getCropRatio() -> CGFloat {
        let widthRatio = CGFloat(self.size.width / self.size.height)
        return widthRatio
    }
}

