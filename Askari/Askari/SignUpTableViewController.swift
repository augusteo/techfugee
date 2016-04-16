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
  @IBOutlet weak var languageTxtField: UITextField!
  @IBOutlet weak var cityTxtField: UITextField!
  @IBOutlet weak var stateTxtField: UITextField!
  
  @IBOutlet weak var industryPickerView: UIPickerView!
  
  @IBOutlet weak var lookingForTxtField: UITextView!
  @IBOutlet weak var bioTxtField: UITextView!
  @IBOutlet weak var emailTxtField: UITextField!
  @IBOutlet weak var pwdTxtField: UITextField!
  
  var industryList: [String]?
  
  
  override func viewDidLoad() {
      super.viewDidLoad()
    
    nameTxtField.delegate = self
    professionTxtField.delegate = self
    languageTxtField.delegate = self
    cityTxtField.delegate = self
    stateTxtField.delegate = self
    lookingForTxtField.delegate = self
    bioTxtField.delegate = self
    emailTxtField.delegate = self
    pwdTxtField.delegate = self

    industryList = ["Accounting",
    "Administration & Office Support",
    "Advertising, Arts & Media",
    "Banking & Financial Services",
    "Call Centre & Customer Service",
    "Community Services & Development",
    "Construction",
    "Consulting & Strategy",
    "Design & Architecture",
    "Education & Training",
    "Engineering",
    "Farming, Animals & Conservation",
    "Healthcare & Medical",
    "Hospitality & Tourism",
    "Human Resources & Recruitment",
    "Information & Communication Technology",
    "Insurance & Superannuation",
    "Legal",
    "Manufacturing, Transport & Logistics",
    "Marketing & Communications",
    "Mining, Resources & Energy",
    "Real Estate & Property",
    "Retail & Consumer Products",
    "Sales",
    "Science & Technology",
    "Self Employment",
    "Sport & Recreation",
    "Trades & Services"]
    
    industryPickerView.dataSource = self
    industryPickerView.delegate = self
  }

  @IBAction func didSelectSignUp(sender: AnyObject) {
    EntityManager.shareInstance.entity?.name = self.nameTxtField.text!
    EntityManager.shareInstance.entity?.title = self.professionTxtField.text!
    EntityManager.shareInstance.entity?.language = self.languageTxtField.text!
    EntityManager.shareInstance.entity?.city = self.cityTxtField.text!
    EntityManager.shareInstance.entity?.state = self.stateTxtField.text!
    
    EntityManager.shareInstance.entity?.lookingFor = self.lookingForTxtField.text!
    EntityManager.shareInstance.entity?.bio = self.bioTxtField.text!
    EntityManager.shareInstance.entity?.email = self.emailTxtField.text!
    EntityManager.shareInstance.entity?.password = self.pwdTxtField.text!
    
    self.dismissViewControllerAnimated(true) {
      
    }
  }
}

extension SignUpTableViewController: UIPickerViewDataSource {
  
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return industryList!.count
  }
}

extension SignUpTableViewController: UIPickerViewDelegate {
  
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
    return industryList![row]
  }
  
  func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    EntityManager.shareInstance.entity?.industry = industryList![row]
  }
}

extension SignUpTableViewController: UITextFieldDelegate {
  
}

extension SignUpTableViewController: UITextViewDelegate {
  
}
