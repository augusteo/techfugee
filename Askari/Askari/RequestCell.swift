//
//  RequestCell.swift
//  Askari
//
//  Created by vic on 16/04/2016.
//  Copyright © 2016 Pk Heng. All rights reserved.
//

import UIKit
import SCLAlertView

class RequestCell: UITableViewCell {
  @IBOutlet weak var profilePic: UIImageView!
  @IBOutlet weak var infoLabel: UILabel!
  
  @IBAction func ignoreAction(sender: AnyObject) {
    SCLAlertView().showNotice("Notice", subTitle: "you have ignored this person")
  }
  
  @IBAction func confirmAction(sender: AnyObject) {
    SCLAlertView().showInfo("Confirmed", subTitle: "You have confirmed this connection")
    
  }
}
