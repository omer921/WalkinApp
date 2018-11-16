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
        imageTable!.separatorStyle = UITableViewCell.SeparatorStyle.none
        imageTable!.rowHeight = 175
        Singletons.loadTops()
        // Do any additional setup after loading the view.
            super.viewDidLoad()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let array = Singletons.getLocalImages()
        return (Singletons.tops.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath) as! ImageTableViewCell
        
       
        let image =  Singletons.tops[indexPath.row].0.image
        let image2 =  Singletons.tops[indexPath.row].1.image
        cell.pictureView.image = image
        cell.pictureView2.image = image2
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
