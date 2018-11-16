//
//  ImageTableViewCell.swift
//  Camera
//
//  Created by Omer Winrauke on 11/3/18.
//  Copyright © 2018 Rizwan. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet var imageTextLabel: UILabel?
    @IBOutlet var pictureView: UIImageView!
    @IBOutlet var pictureView2: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
