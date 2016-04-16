//
//  ConfirmedCell.swift
//  Askari
//
//  Created by vic on 16/04/2016.
//  Copyright © 2016 Pk Heng. All rights reserved.
//

import UIKit

class ConfirmedCell: UITableViewCell {

  @IBOutlet weak var profilePic: UIImageView!
  @IBOutlet weak var infoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
