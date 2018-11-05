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
}
