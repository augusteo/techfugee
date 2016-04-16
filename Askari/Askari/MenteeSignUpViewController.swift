//
//  MenteeSignUpViewController.swift
//  Askari
//
//  Created by Pk Heng on 16/04/2016.
//  Copyright © 2016 Pk Heng. All rights reserved.
//

import UIKit

class MenteeSignUpViewController: UIViewController {

  override func viewDidLoad() {
      super.viewDidLoad()
    self.title = "Mentee Signup"
      // Do any additional setup after loading the view.
  }
  
  @IBAction func menteeDidSignUp(sender: AnyObject) {
    
    self.dismissViewControllerAnimated(true) { 
      
      print("Mentee did signup")
      
      let mentee = EntityModel(entityType: EntityModel.MType.Mentee, name: "Askari", industry: "Multimedia", location: "Melbourne", company: nil, position: nil, email: "askari@gmail.com", phone: "0421213212")
      
      EntityManager.shareInstance.entity = mentee
      
    }
  }

}
