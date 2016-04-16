//
//  MentorViewModel.swift
//  Askari
//
//  Created by vic on 16/04/2016.
//  Copyright © 2016 Pk Heng. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MentorViewModel {
  var modelList = [EntityModel]()
  
  func fetchMentees() {
    let menteeString = serviceBaseUrl + "mentees"
    print(menteeString)
    Alamofire.request(.GET, menteeString)
      .responseJSON { response in
        if let JSON = response.result.value {
          print("JSON: \(JSON)")
        }
    }
  }
}