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
