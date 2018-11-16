//
//  StyleMeViewController.swift
//  Camera
//
//  Created by Omer Winrauke on 11/16/18.
//  Copyright © 2018 Rizwan. All rights reserved.
//

import UIKit

class StyleMeViewController: UIViewController {
    @IBOutlet var topImage:UIImageView!
    @IBOutlet var bottomImage:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Singletons.loadTops()
        Singletons.loadBottoms()
        let number = Int.random(in: 0 ..< Singletons.tops.count)
        let otherNumber = Int.random(in: 0..<2)
        if (otherNumber == 0) {
            topImage.image = Singletons.tops[number].0.image
        } else {
            topImage.image = Singletons.tops[number].1.image
        }
        
        let pantNumber = Int.random(in: 0 ..< Singletons.bottoms.count)
        bottomImage.image = Singletons.bottoms[pantNumber].image
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getNewSuggestionClicked(_ sender: UIButton) {
        let number = Int.random(in: 0 ..< Singletons.tops.count)
        let otherNumber = Int.random(in: 0..<2)
        if (otherNumber == 0) {
            topImage.image = Singletons.tops[number].0.image
        } else {
            topImage.image = Singletons.tops[number].1.image
        }
        
        let pantNumber = Int.random(in: 0 ..< Singletons.bottoms.count)
        bottomImage.image = Singletons.bottoms[pantNumber].image
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
