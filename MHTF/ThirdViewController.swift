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

        let first = AboutInformationTab.text[0]
        let setparagraphStyle = NSMutableParagraphStyle()
        setparagraphStyle.alignment = .left
        var attributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .body), .paragraphStyle : setparagraphStyle]
        let attributedText = NSMutableAttributedString(string: first, attributes: attributes)
        attributedText.append(NSAttributedString(string: "\n\n", attributes: [.font: UIFont.systemFont(ofSize: 10)]))
        let second = "Credits"
        let setparagraphStyle2 = NSMutableParagraphStyle()
        setparagraphStyle2.alignment = .left
        attributes = [.font: UIFont.preferredFont(forTextStyle: .title1), .paragraphStyle : setparagraphStyle2]
        attributedText.append(NSMutableAttributedString(string: second, attributes: attributes))
        attributedText.append(NSAttributedString(string: "\n\n", attributes: [.font: UIFont.systemFont(ofSize: 10)]))
        let setparagraphStyle3 = NSMutableParagraphStyle()
        setparagraphStyle3.alignment = .left
        attributes = [.font: UIFont.preferredFont(forTextStyle: .body), .paragraphStyle : setparagraphStyle3]
        attributedText.append(NSMutableAttributedString(string: AboutInformationTab.text[1], attributes: attributes))
        attributedText.append(NSAttributedString(string: "\n\n", attributes: [.font: UIFont.systemFont(ofSize: 10)]))
        attributedText.append(NSMutableAttributedString(string: AboutInformationTab.text[2], attributes: attributes))
        attributedText.append(NSAttributedString(string: "\n\n", attributes: [.font: UIFont.systemFont(ofSize: 10)]))
        attributedText.append(NSMutableAttributedString(string: AboutInformationTab.text[3], attributes: attributes))
        attributedText.append(NSAttributedString(string: "\n\n", attributes: [.font: UIFont.systemFont(ofSize: 10)]))
        attributedText.append(NSMutableAttributedString(string: AboutInformationTab.text[4], attributes: attributes))
        textView.attributedText = attributedText
//        textView.scrollRangeToVisible(NSMakeRange(0, 0))
        //tabBarHiddenOnScrolling still needs to be fixed - Lecture 6
        
        
//        tabBarController?.tabBar.isHidden = true
//        navigationController?.hidesBarsOnSwipe = true
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: callID)
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        view.setContentOffset(CGPoint(x: 0, y: -1), animated: false)
        
    }
    

}
