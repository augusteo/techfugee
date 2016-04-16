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
      
      let mentee = EntityModel(entityType: EntityModel.MType.Mentor, id: "23123131", name: "Askari", title: "Technology", city: "Melbourne", state: "VIC", industry: "Technology", lookingFor: "Web Development", phone: "04321122322", bio: "4 years experience in web dev", email: "", password: "")
      
      EntityManager.shareInstance.entity = mentee
      
    }
  }

}
