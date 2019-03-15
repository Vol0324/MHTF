//
//  TextTableViewCell.swift
//  MHTF
//
//  Created by Alex Zhou on 3/15/19.
//  Copyright © 2019 MHTF. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    @IBOutlet weak var introdunctionText: UITextView! {
        didSet {
            introdunctionText.frame = self.frame
            introdunctionText.translatesAutoresizingMaskIntoConstraints = false
            introdunctionText.sizeToFit()
            introdunctionText.isScrollEnabled = false
            introdunctionText.layoutIfNeeded()
            introdunctionText.isEditable = false
            introdunctionText.isSelectable = false
        }
    }
    
    
}
