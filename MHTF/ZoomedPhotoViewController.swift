//
//  ZoomedPhotoViewController.swift
//  MHTF
//
//  Created by Alex Zhou on 3/31/19.
//  Copyright © 2019 MHTF. All rights reserved.
//

import UIKit

class ZoomedPhotoViewController: UIViewController, UIScrollViewDelegate {
    var index : Int? {
        get {
            return self.navigationController!.indexPicture
        }
    }
    
    lazy var viewHeight = self.navigationController!.view!.frame.height
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: String(index!))
        imageView.image = image
        imageView.frame = CGRect(x: 0, y: 0, width: image!.size.width, height: image!.size.height);
        scrollView.clipsToBounds = false
        scrollView.contentSize = imageView.frame.size
        navigationController?.navigationBar.barTintColor = UIColor.clear
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        //        print(view.frame.height / 2 - (viewHeight - view!.frame.height) / 2)
//        if view.bounds.width == 414 {
//            if view.bounds.height == 896 {
//                scrollView.frame = CGRect(x: 0, y: 0, width: 414, height: 808) //
//            } else{
//                scrollView.frame = CGRect(x: 0, y: 0, width: 414, height: 672)
//            }
//        }
//        else if view.bounds.width == 375 {
//            if view.bounds.height == 812 {
//                scrollView.frame = CGRect(x: 0, y: 0, width: 375, height: 724)
//            } else{
//                scrollView.frame = CGRect(x: 0, y: 0, width: 375, height: 603)
//            }
//        }
//        else if view.bounds.width == 320, view.bounds.height == 568 {
//            scrollView.frame = CGRect(x: 0, y: 0, width: 320, height: 504)
//        }
        
    }
    
    @IBAction func done(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScaleForSize(view.frame.size)
    }
    
    fileprivate func updateMinZoomScaleForSize(_ size: CGSize) {
//        print("updateMinZoomScaleForSize")
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minScale
        scrollView.zoomScale = minScale

    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateConstraintsForSize(scrollView.bounds.size)
    }
    
    fileprivate func updateConstraintsForSize(_ size: CGSize) {

        let yOffset = max(0, (size.height - imageView.frame.height) / 2)
        imageViewTopConstraint.constant = yOffset
        imageViewBottomConstraint.constant = yOffset
        
        let xOffset = max(0, (size.width - imageView.frame.width) / 2)
        imageViewLeadingConstraint.constant = xOffset
        imageViewTrailingConstraint.constant = xOffset
        view.layoutIfNeeded()
        if(yOffset != 0) {
        imageView.center = CGPoint(x: imageView.center.x, y: view.frame.height / 2 - (viewHeight - view!.frame.height) / 2)
        }
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }

}


