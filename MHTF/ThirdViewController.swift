//
//  ThirdViewController.swift
//  MHTF
//
//  Created by Alex Zhou on 2/21/19.
//  Copyright © 2019 MHTF. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    let callID : String = "text"
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "About"
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
//        textView.scrollRangeToVisible(NSMakeRange(0, 0))
        //tabBarHiddenOnScrolling still needs to be fixed - Lecture 6
        
        
//        tabBarController?.tabBar.isHidden = true
//        navigationController?.hidesBarsOnSwipe = true
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: callID)
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textView.setContentOffset(CGPoint.zero, animated: false)
    }
    

}
