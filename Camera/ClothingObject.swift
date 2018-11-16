//
//  ClothingObject.swift
//  Camera
//
//  Created by Omer Winrauke on 11/16/18.
//  Copyright © 2018 Rizwan. All rights reserved.
//

import UIKit

class ClothingObject: NSObject {
    var image:UIImage?
    var weatherTag:String?
    var clothingTag:String?
    
    init(image:UIImage, weatherTag:String, clothingTag:String) {
        self.image = image
        self.weatherTag = weatherTag
        self.clothingTag = clothingTag
    }

}
