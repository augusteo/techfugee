//
//  MentorSignUpViewController.swift
//  Askari
//
//  Created by Pk Heng on 16/04/2016.
//  Copyright © 2016 Pk Heng. All rights reserved.
//

import UIKit

class MentorSignUpViewController: UIViewController {

  override func viewDidLoad() {
      super.viewDidLoad()
    self.title = "Mentor Signup"
      // Do any additional setup after loading the view.
  }

  
  @IBAction func didSelectSignUp(sender: AnyObject) {
    
    self.dismissViewControllerAnimated(true) { 
      print("signed up as mentor")
      
      let mentor = EntityModel(entityType: EntityModel.MType.Mentor, id: "123123", name: "Victor", title: "Technology", city: "Melbourne", state: "VIC", industry: "Technology", lookingFor: "Technology", phone: "04412322032", bio: "I like Reactive Cocoa", email: "", password: "")
      
      EntityManager.shareInstance.entity = mentor
      
    }
  }

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
  }
  */

}
