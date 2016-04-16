//
//  SelectTypeViewController.swift
//  Askari
//
//  Created by Pk Heng on 16/04/2016.
//  Copyright © 2016 Pk Heng. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

  override func viewDidLoad() {
      super.viewDidLoad()

    self.title = "Select Type"
      // Do any additional setup after loading the view.
  }
  
  //MARK : Nav
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    EntityManager.shareInstance.entity = EntityModel(entityType: EntityModel.MType.Mentee, id: "", name: "Jack Jong", title: "Senior Pastry Chef", city: "Melbourne", state: "Victoria", industry: "Hospitality", lookingFor: "", language: "", phone: "", bio: "", email: "", password: "", photo: "http://aspireid.com/wp/wp-content/uploads/sample-customer-photo2.jpg")
    
    if segue.identifier == "mentorSignUp" {
      EntityManager.shareInstance.entity?.entityType = EntityModel.MType.Mentor
    } else if segue.identifier == "menteeSignUp" {
      EntityManager.shareInstance.entity?.entityType = EntityModel.MType.Mentee
    }
    
  }
  
  
}
