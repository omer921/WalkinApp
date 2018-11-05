//
//  ClosetViewController.swift
//  Camera
//
//  Created by Omer Winrauke on 11/3/18.
//  Copyright © 2018 Rizwan. All rights reserved.
//

import UIKit

class ClosetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var imageTable:UITableView!

    override func viewDidLoad() {
        imageTable!.delegate = self
        imageTable!.dataSource = self
        imageTable!.rowHeight = 100
        // Do any additional setup after loading the view.
            super.viewDidLoad()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let array = Singletons.getLocalImages()
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let array = Singletons.getLocalImages()

        let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath) as! ImageTableViewCell

        cell.imageTextLabel!.text = Singletons.getLocalImages()[indexPath.row].1
        
        let dataDecoded : Data = Data(base64Encoded: Singletons.getLocalImages()[indexPath.row].0, options: .ignoreUnknownCharacters)!
        
        let image = UIImage(data: dataDecoded)
        
        cell.pictureView.image = image

        return cell
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
