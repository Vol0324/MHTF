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
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "About"
        //tabBarHiddenOnScrolling still needs to be fixed - Lecture 6
        
        
//        tabBarController?.tabBar.isHidden = true
//        navigationController?.hidesBarsOnSwipe = true
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: callID)
    
        // Do any additional setup after loading the view.
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection :Int) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: callID, for: indexPath)
//        return cell
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
