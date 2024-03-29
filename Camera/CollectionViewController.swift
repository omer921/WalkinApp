//
//  CollectionViewController.swift
//  Camera
//
//  Created by Omer Winrauke on 11/15/18.
//  Copyright © 2018 Rizwan. All rights reserved.
//

import UIKit
//import UPCarouselFlowLayout

private let reuseIdentifier = "cell"

class CollectionViewController:  UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet var dotImages:UIImageView!
    @IBOutlet var collection:UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell classes
        self.collection.delegate = self
        self.collection.dataSource = self
        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize(width: 375, height: 500)
        layout.scrollDirection = .horizontal
//        layo
        self.collection.collectionViewLayout = layout

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        if (indexPath.row == 0) {
            cell.imageView!.image = UIImage(named:"carousel1-1.png")!
            dotImages!.image = UIImage(named:"dot1-1.png")
        } else if (indexPath.row == 1) {
            cell.imageView!.image = UIImage(named:"carousel2-1.png")!
            dotImages!.image = UIImage(named:"dot2-1.png")
        } else {
            cell.imageView!.image = UIImage(named:"carousel3-1.png")!
            dotImages!.image = UIImage(named:"dot3-1.png")
        }
        


        // Configure the cell

        return cell
    }

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

//    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
