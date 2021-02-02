//
//  ReceipeTableViewCell.swift
//  Mey Food
//
//  Created by IndratS on 01/02/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import UIKit

class ReceipeTableViewCell: UITableViewCell {
    @IBOutlet weak var receipeImage: UIImageView!
    @IBOutlet weak var receipeNameLabel: UILabel!
    
    static let identifier = "receipeCellIdentifier"
    static let heightCell = 173
    
    
    var didSetReceipe: FoodModel? {
        didSet{
            receipeNameLabel.text = didSetReceipe?.results[0].title
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
