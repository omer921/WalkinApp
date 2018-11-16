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
    
    @IBOutlet var shirtButton:UIButton!
    @IBOutlet var pantsButton:UIButton!
    @IBOutlet var hatButton:UIButton!
    @IBOutlet var dressButton:UIButton!
    @IBOutlet var shoeButton:UIButton!
    @IBOutlet var jacketButton:UIButton!
    
    @IBOutlet var sunButton:UIButton!
    @IBOutlet var snowButton:UIButton!

    
    var encodedImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        encodedImage = Singletons.getEncodedImage()
        
        do {
            let dataDecoded : Data = Data(base64Encoded: encodedImage, options: .ignoreUnknownCharacters)!

            let image = UIImage(data: dataDecoded)
            
            imageView.image = image
        } catch {
            NSLog("we errored out")
        }
    }
    
    
    func resetButtons() {
        shirtButton.setImage(UIImage(named: "buttons_small_tops.png"), for: .normal)
        pantsButton.setImage(UIImage(named: "buttons_small_bottoms.png"), for: .normal)
        hatButton.setImage(UIImage(named: "buttons_smalls_accessories.png"), for:.normal)
        dressButton.setImage(UIImage(named: "buttons_small_dress.png"), for:.normal)
        jacketButton.setImage(UIImage(named: "buttons_small_outerwear.png"), for: .normal)
        shoeButton.setImage(UIImage(named: "buttons_small_shoes.png"), for: .normal)
    }
    
    
    @IBAction func shirtButtonPressed(_ sender: UIButton) {
        resetButtons()
        print("here")
        shirtButton.setImage(UIImage(named: "buttons_tops_selected.png"), for: .normal)
    }
    
    @IBAction func pantsButtonPressed(_ sender: UIButton) {
        resetButtons()
        pantsButton.setImage(UIImage(named: "buttons_bottoms_selected.png"), for: .normal)
    }
    
    @IBAction func hatButtonPressed(_ sender: UIButton) {
        resetButtons()
        hatButton.setImage(UIImage(named: "buttons_accessories_selected.png"), for: .normal)
    }
    
    @IBAction func dressButtonPressed(_ sender: UIButton) {
        resetButtons()
        dressButton.setImage(UIImage(named: "buttons_dress_selected.png"), for: .normal)
    }
    
    @IBAction func jacketButtonPressed(_ sender: UIButton) {
        resetButtons()
        jacketButton.setImage(UIImage(named: "buttons_outerwear_selected.png"), for: .normal)
    }
    
    @IBAction func shoesButtonPressed(_ sender: UIButton) {
        resetButtons()
        shoeButton.setImage(UIImage(named: "buttons_shoes_selected.png"), for: .normal)

    }
    
    @IBAction func sunButtonPressed(_ sender: UIButton) {
        sunButton.setImage(UIImage(named: "buttons_warm_selected.png"), for: .normal)
        snowButton.setImage(UIImage(named: "buttons_small_cold.png"), for: .normal)
    }
    
    @IBAction func snowButtonPressed(_ sender: UIButton) {
        sunButton.setImage(UIImage(named: "buttons_small_warm.png"), for: .normal)
        snowButton.setImage(UIImage(named: "buttons_cold_selected.png"), for: .normal)
    }
    
    @IBAction func retakePhotoClicked() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PhotoViewController")
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func addPhotoClicked() {
        var encode = Singletons.getEncodedImage() //.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        NSLog(encode)
        Singletons.addLocalImages(item: (encode), tag: "")
        var piece = ClothingObject(image: imageView.image!, weatherTag: "something", clothingTag: "")
        Singletons.loadTops()
        Singletons.tops.append((Singletons.tops[0].0, piece))
        if (Singletons.getEncodedImage() == encode.removingPercentEncoding){
            NSLog("Success!")
        }
//
//        let urlString = "http://walkin.us-west-2.elasticbeanstalk.com/add/omer/"
////        let urlString = "http://192.168.1.242:8081/add/omer/"
//        let url = URL(string: urlString)
//        var request = URLRequest(url: url!)
//        request.setValue("application/json", forHTTPHeaderField:"Content-Type")
//        request.httpMethod = "POST"
//        let postString = "{\"fid\":\"\(encode)\"}"
//        request.httpBody = postString.data(using: .utf8)
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//        if error != nil {
//            NSLog(error!.localizedDescription)
//        }
//        guard data != nil else { return }
//        NSLog("executing call")
//        }.resume()
//        Singletons.loadCloset()
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
