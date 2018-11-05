//
//  SomeOtherViewController.swift
//  Camera
//
//  Created by Omer Winrauke on 11/2/18.
//  Copyright © 2018 Rizwan. All rights reserved.
//

import UIKit

class SomeOtherViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var retakeButton: UIButton!
    @IBOutlet var hashtagTextField: UITextField!
    
    var encodedImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        encodedImage = Singletons.getEncodedImage()
    
//        NSLog(encodedImage)
//        let data = Data(base64Encoded: encodedImage)
//        let imageData = NSData(base64Encoded: encodedImage, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
//        let image = UIImage(data: imageData as! Data)
//        println(image)
        
        do {
            let dataDecoded : Data = Data(base64Encoded: encodedImage, options: .ignoreUnknownCharacters)!

            let image = UIImage(data: dataDecoded)
            
            imageView.image = image
        } catch {
            NSLog("we errored out")
        }
    }
    
    
    @IBAction func retakePhotoClicked() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PhotoViewController")
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func addPhotoClicked() {
        var encode = Singletons.getEncodedImage() //.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        NSLog(encode)
        Singletons.addLocalImages(item: (encode), tag: hashtagTextField.text!)
        if (Singletons.getEncodedImage() == encode.removingPercentEncoding){
            NSLog("Success!")
        }
        
        let urlString = "http://walkin.us-west-2.elasticbeanstalk.com/add/omer/"
//        let urlString = "http://192.168.1.242:8081/add/omer/"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")
        request.httpMethod = "POST"
        let postString = "{\"fid\":\"\(encode)\"}"
        request.httpBody = postString.data(using: .utf8)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
        if error != nil {
            NSLog(error!.localizedDescription)
        }
        guard data != nil else { return }
        NSLog("executing call")
        }.resume()
        Singletons.loadCloset()
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
