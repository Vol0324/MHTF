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
//        self.tableView.register(TextTableViewCell.self, forCellReuseIdentifier: "textCell")
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(index != 3) {
            return 2
        } else {
            return 22
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            if(index != 3){
                return prepare2Cells(cellForRowAt: indexPath)
            }
            else {
                return prepare11Cells(cellForRowAt: indexPath)
            }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row % 2 == 0) {
            let currentImage = UIImage(named: String(index! + 1))
            let imageCrop = currentImage?.getCropRatio()
            return tableView.frame.width / imageCrop!
    }
        else {
            return UITableView.automaticDimension
        }
}
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var toSend = index! + 1
        print(toSend)
        if(toSend == 4) {
            toSend = 4 + indexPath.row / 2
        }
        performSegue(withIdentifier: "showZoomedSegue", sender: toSend)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showZoomedSegue" {
            let destination = segue.destination as! UINavigationController
            destination.indexPicture = sender as? Int
        }
    }
    
    func prepare2Cells(cellForRowAt indexPath : IndexPath) -> UITableViewCell{
        if(indexPath.row == 0) {
            cellID = "pictureCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID!, for: indexPath) as! ArtworkTableViewCell
            cell.mainImageView.image = UIImage(named: String(index! + 1))
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }
        else {
            cellID = "textCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID!, for: indexPath) as! TextTableViewCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            let title = ArtworkInfoModel.content[3 * index!]
            let author = ArtworkInfoModel.content[3 * index! + 1]
            let content = ArtworkInfoModel.content[3 * index! + 2]
            let setparagraphStyle = NSMutableParagraphStyle()
            setparagraphStyle.alignment = .left
            var attributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1), .paragraphStyle : setparagraphStyle]
            let attributedText = NSMutableAttributedString(string: title!, attributes: attributes)
            attributedText.append(NSAttributedString(string: "\n", attributes: attributes))
            let setparagraphStyle2 = NSMutableParagraphStyle()
            setparagraphStyle2.alignment = .right
            attributes = [.font: UIFont.preferredFont(forTextStyle: .caption1), .paragraphStyle : setparagraphStyle2]
            attributedText.append(NSMutableAttributedString(string: "By \(author!)", attributes: attributes))
            attributedText.append(NSAttributedString(string: "\n\n", attributes: [.font: UIFont.systemFont(ofSize: 5)]))
            let setparagraphStyle3 = NSMutableParagraphStyle()
            setparagraphStyle3.alignment = .left
            attributes = [.font: UIFont.preferredFont(forTextStyle: .body), .paragraphStyle : setparagraphStyle3]
            attributedText.append(NSMutableAttributedString(string: content!, attributes: attributes))
            
            cell.introdunctionText.attributedText = attributedText
            return cell
        }
    }
    
    func prepare11Cells(cellForRowAt indexPath : IndexPath) -> UITableViewCell{
        let atRow = indexPath.row
        if(atRow % 2 == 0) {
            cellID = "pictureCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID!, for: indexPath) as! ArtworkTableViewCell
            cell.mainImageView.image = UIImage(named: String(4 + atRow / 2))
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }
        else {
//            cellID = "textCell"
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellID!, for: indexPath) as! TextTableViewCell
//            cell.selectionStyle = UITableViewCell.SelectionStyle.none
//
//            let title = ArtworkInfoModel.content[3 * index!]
//            let author = ArtworkInfoModel.content[3 * index! + 1]
//            let content = ArtworkInfoModel.content[3 * index! + 2]
//            let setparagraphStyle = NSMutableParagraphStyle()
//            setparagraphStyle.alignment = .left
//            var attributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1), .paragraphStyle : setparagraphStyle]
//            let attributedText = NSMutableAttributedString(string: title!, attributes: attributes)
//            attributedText.append(NSAttributedString(string: "\n", attributes: attributes))
//            let setparagraphStyle2 = NSMutableParagraphStyle()
//            setparagraphStyle2.alignment = .right
//            attributes = [.font: UIFont.preferredFont(forTextStyle: .title2), .paragraphStyle : setparagraphStyle2]
//            attributedText.append(NSMutableAttributedString(string: "By \(author!)", attributes: attributes))
//            attributedText.append(NSAttributedString(string: "\n\n", attributes: [.font: UIFont.systemFont(ofSize: 5)]))
//            let setparagraphStyle3 = NSMutableParagraphStyle()
//            setparagraphStyle3.alignment = .left
//            attributes = [.font: UIFont.preferredFont(forTextStyle: .body), .paragraphStyle : setparagraphStyle3]
//            attributedText.append(NSMutableAttributedString(string: content!, attributes: attributes))
//
//            cell.introdunctionText.attributedText = attributedText
//            return cell
            cellID = "textCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID!, for: indexPath) as! TextTableViewCell
            cell.introdunctionText.attributedText = ArtworkInfoModelGroup.content[(atRow - 1) / 2]
            return cell
        }
    }
}

extension UIImage {
    func getCropRatio() -> CGFloat {
        let widthRatio = CGFloat(self.size.width / self.size.height)
        return widthRatio
    }
}

extension UINavigationController {
    struct Holder {
        static var intermediate: Int?
    }
    var indexPicture : Int? {
        get {
            return Holder.intermediate
        }
        set {
            Holder.intermediate = newValue
        }
    }
    
    var index : Int? {
        get {
             return Holder.intermediate
        }
        set {
            Holder.intermediate = newValue
        }
    }
    
    
}
