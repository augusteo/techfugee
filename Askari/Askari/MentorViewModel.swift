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
    Alamofire.request(.GET, serviceBaseUrl+"mentees")
      .responseJSON { response in
        if let value = response.result.value {
          let json = JSON(value)
          print("JSON: \(json)")
        }
    }
  }
}