//
//  ZoomedPhotoViewController.swift
//  MHTF
//
//  Created by Alex Zhou on 3/31/19.
//  Copyright © 2019 MHTF. All rights reserved.
//

import UIKit

class ZoomedPhotoViewController: UIViewController, UIScrollViewDelegate {
    var index : Int?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: String(index!))!
        imageView.image = image
        imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size:image.size)
        scrollView.clipsToBounds = true
        scrollView.contentSize = image.size
        
        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight);
        scrollView.minimumZoomScale = minScale;

        scrollView.zoomScale = minScale;
        
        centerScrollViewContents()
//        navigationController?.hidesBarsOnTap = true
//        navigationController?.hidesBarsOnSwipe = true
//        navigationController?.hidesBarontou
    }
    
    func updateMinZoomScale(_ size: CGSize) {
        let minScale = min(size.width / imageView.image!.size.width, size.height / imageView.image!.size.height)
        scrollView.minimumZoomScale = minScale
        scrollView.zoomScale = minScale
//        print(imageView.frame)
//        print(minScale)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScale(view.bounds.size)
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerScrollViewContents()
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        print(1)
        return imageView
    }
    
    func centerScrollViewContents() {
        let size = scrollView.bounds.size
        //        let minScale = min(size.width / imageView.image!.size.width, size.height / imageView.image!.size.height)
        var contentsFrame = imageView.frame
        
        print(imageView.frame.height)
        let yOffset = max(0, (size.height - imageView.frame.height) / 2)
        imageViewTopConstraint.constant = yOffset
        imageViewBottomConstraint.constant = yOffset
        contentsFrame.origin.y = yOffset
        
        let xOffset = max(0, (size.width - imageView.frame.width) / 2)
        imageViewLeadingConstraint.constant = xOffset
        imageViewTrailingConstraint.constant = xOffset
        contentsFrame.origin.x = xOffset
        imageView.frame = contentsFrame
        view.layoutIfNeeded()
    }
    



}
