//
//  CustomTabBarController.swift
//  Askari
//
//  Created by Pk Heng on 16/04/2016.
//  Copyright © 2016 Pk Heng. All rights reserved.
//

import UIKit
import Onboard

class CustomTabBarController: UITabBarController {

  let onboardVC = OnboardingViewController()
  
  override func viewDidLoad() {
      super.viewDidLoad()
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    if !NSUserDefaults.standardUserDefaults().boolForKey("hasBeenOnboarded") {
      showOnboarding()
    }
    
    showSignUpModal()
  }
  
  func showOnboarding() {
    let onboardImage = UIImage(named: "onboard")
    
    let onboardVC = OnboardingViewController(backgroundImage: onboardImage, contents: generatePages())
    onboardVC.shouldBlurBackground = true
    onboardVC.shouldFadeTransitions = true
    
    presentViewController(onboardVC, animated: true, completion: nil)
  }
  
  func generatePages() -> [OnboardingContentViewController] {
    let page1 = OnboardingContentViewController(title: "Welcome to Askari", body: "Where mentee and mentors connect to help each others", image: nil, buttonText: nil, action: nil)
    let page2 = OnboardingContentViewController(title: "Your own profile", body: "Register with your bio, industry, and what are you looking for", image: nil, buttonText: nil, action: nil)
    let page3 = OnboardingContentViewController(title: "Connect", body: "Find mentors or mentee and connect with them personally", image: nil, buttonText: "Get Started", action: {
      NSUserDefaults.standardUserDefaults().setBool(true, forKey: "hasBeenOnboarded")
      self.dismissViewControllerAnimated(true, completion: nil)
    })
    return [page1, page2, page3]
  }
  
  func showSignUpModal() {
    self.performSegueWithIdentifier("showSignUp", sender: nil)
  }
}
























