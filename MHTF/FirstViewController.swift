//
//  FirstViewController.swift
//  MHTF
//
//  Created by Alex Zhou on 2/14/19.
//  Copyright © 2019 MHTF. All rights reserved.
//

import UIKit

class FirstViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    let cellID: String = "ArtworkCell"
    //Adapt the size to the image
    let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    let itemsPerRow: CGFloat = 2
    var indexSegue: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")

//        navigationController?.hides
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
//
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ArtworksCollectionViewCell
        let temp : Int = 1 + indexPath.item
        let tempString = String(temp)
        let image = UIImage(named: tempString)!
        cell.artworkView.image = image
        cell.backgroundColor = .white
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexSegue = indexPath.item
        performSegue(withIdentifier: "showArtSegue", sender: indexSegue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showArtSegue" {
            let destination = segue.destination as! ArtworksDetailsController
            destination.index = sender as? Int
        }
    }
    


}

extension ArtworksCollectionViewCell {
    private struct temp {
        static var index : Int = 0
    }
    var position: Int {
        get {
            return temp.index
        }
        set {
            temp.index = newValue
        }
    }
}
