//
//  ArtworksDetailsController.swift
//  MHTF
//
//  Created by Alex Zhou on 3/5/19.
//  Copyright © 2019 MHTF. All rights reserved.
//

import UIKit

class ArtworksDetailsController: UIViewController {
    var index : Int?
    @IBOutlet weak var detailTextView: UITextView!
    let textAttachment = NSTextAttachment()
    //    var cellID : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTextView.textAlignment = .center
        navigationItem.largeTitleDisplayMode = .never
        print(index!)
        
        let tempString = "IMG_" + String(3552 + index!)
        detailTextView.isEditable = false
        detailTextView.isSelectable = false
        textAttachment.image = UIImage(named: tempString)
        let oldWidth = textAttachment.image!.size.width;
//        print(detailTextView.frame.size.width)
//        print(oldWidth)
        let scaleFactor = oldWidth / (detailTextView.frame.size.width * 2.0/3.0);
        print(detailTextView.frame.size.width)
        print(scaleFactor) //for the padding inside the textView
        textAttachment.image = UIImage(cgImage: textAttachment.image!.cgImage!, scale: scaleFactor, orientation: .up)
//        let paragraph = NSMutableParagraphStyle()
//        paragraph.alignment = .left
//        let attributes: [String : Any] = [NSAttributedString.Key.paragraphStyle.rawValue: paragraph]
        let attrStringWithImage = NSAttributedString(attachment: textAttachment)
        let attributedString = NSMutableAttributedString(string: "\n \n before after ever shdfhalksjhdfl alskdhfalksdfh aklsdjhfalsjhdf aslkjdhfladfs lajksdhf asdlfkjhas ldfja lkshdf asdkhfalskdjhf alksjdhflasjdhfa slkdjfha lsdkjfha lsdfhja lskdjfha lsjdhfaljsfh a")
        attributedString.replaceCharacters(in: NSMakeRange(0, 0), with: attrStringWithImage)
        detailTextView.attributedText = attributedString;
        
        
    }


   
}
