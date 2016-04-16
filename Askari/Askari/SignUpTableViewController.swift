//
//  SignUpTableViewController.swift
//  Askari
//
//  Created by Pk Heng on 16/04/2016.
//  Copyright © 2016 Pk Heng. All rights reserved.
//

import UIKit

class SignUpTableViewController: UITableViewController {

  
  @IBOutlet weak var nameTxtField: UITextField!
  @IBOutlet weak var professionTxtField: UITextField!
  @IBOutlet weak var cityTxtField: UITextField!
  @IBOutlet weak var stateTxtField: UITextField!
  
  @IBOutlet weak var industryPickerView: UIPickerView!
  
  @IBOutlet weak var lookingForTxtField: UITextView!
  @IBOutlet weak var bioTxtField: UITextView!
  @IBOutlet weak var emailTxtField: UITextField!
  @IBOutlet weak var pwdTxtField: UITextField!
  
  
  
  
  override func viewDidLoad() {
      super.viewDidLoad()

      // Uncomment the following line to preserve selection between presentations
      // self.clearsSelectionOnViewWillAppear = false

      // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
      // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }

  @IBAction func didSelectSignUp(sender: AnyObject) {
    self.dismissViewControllerAnimated(true) { 
      
      
      if let user = EntityManager.shareInstance.entity {
        
        
        
      }
    }
  }



}
