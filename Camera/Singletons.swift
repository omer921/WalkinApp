//
//  Singletons.swift
//  Camera
//
//  Created by Omer Winrauke on 11/2/18.
//  Copyright © 2018 Rizwan. All rights reserved.
//

import UIKit

class Singletons: NSObject {
    
    private static var encodedImage = String()
    private static var jsonObject:NSDictionary? = nil
    private static var encodedImages = Array<(String, String)>()
    static var tops = Array<(ClothingObject, ClothingObject)>()
    static var bottoms = Array<ClothingObject>()
    static func setEncodedImage(encodedStrings: String) {
        encodedImage = encodedStrings
    }
    
    static func getEncodedImage() -> String {
        return encodedImage
    }

    static func loadCloset() {
        
        let picturesUrlString = "http://192.168.1.242:8081/getFriends/omer/"
        let urlNew = URL(string: picturesUrlString)
        var requestNew = URLRequest(url: urlNew!)
        //        request.setValue("application/json", forHTTPHeaderField:"Content-Type")
        requestNew.httpMethod = "GET"
        URLSession.shared.dataTask(with: requestNew) { (data, response, error) in
            if error != nil {
                NSLog(error!.localizedDescription)
            }
            //            NSLog(response.)
            guard data != nil else { return }
            
            //        let decoder = JSONDecoder()
            do{
                self.jsonObject = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! NSDictionary
                //                let unParsedArray =
                
                //                NSLog("\(unParsedArray)")
            }
            catch{}
            
            
            NSLog("executing call 2")
            //            NSLog(urlString)
            }.resume()
        
    }
    
    static func getCloset() -> [String] {
        NSLog("closet size: \((self.jsonObject!["Friends"] as! [String]).count)")
        return self.jsonObject!["Friends"] as! [String]
    }
    
    static func addLocalImages(item: String, tag: String) {
        encodedImages.append((item, tag))
    }
    
    static func getLocalImages() -> Array<(String, String)> {
        return encodedImages
    }
    
    static func loadTops() -> Array<(ClothingObject, ClothingObject)> {
        if tops.count == 0 {
            var listOfNames = ["blouse_1.png", "chiffon_1.png", "cowl_1.png", "gray_1.png", "green_1.png", "maroon_1.png", "stussy_1.png", "sweater_1.png"]
            for i in 0...(listOfNames.count/2) {
                print("here", listOfNames[i])
                let object = ClothingObject(image: UIImage(named: listOfNames[i])! , weatherTag: "Cold", clothingTag: "Top")
//                let object2 = ClothingObject(image: UIImage(named: listOfNames[i*2])! , weatherTag: "Cold", clothingTag: "Top")
                
                tops.append((object, object))
            }
            var count = 0
            for i in (listOfNames.count/2)...(listOfNames.count-1) {
                print((listOfNames.count/2), (listOfNames.count-1))
                let object = ClothingObject(image: UIImage(named: listOfNames[i])! , weatherTag: "Cold", clothingTag: "Top")
                tops[count].1 = object
                count += 1
            }
        }
        return tops
    }
    
    static func loadBottoms() {
        if bottoms.count == 0 {
            var listOfNames = ["jeans_1.png", "pants.jpg"]
            for item in listOfNames {
                let object = ClothingObject(image: UIImage(named: item)! , weatherTag: "Cold", clothingTag: "Bottom")
                bottoms.append(object)
            }
        }
    }
}
