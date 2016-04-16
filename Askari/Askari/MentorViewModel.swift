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
  
  func fetchMentees(failure onFail: (NSError -> ())? = nil, success onSuccess: (() -> ())? = nil) {
    
    let param = EntityManager.shareInstance.entity?.entityType == EntityModel.MType.Mentee ? SearchParam.MenteeIndustry("") : SearchParam.MentorIndustry("")
    let entityType = EntityManager.shareInstance.entity?.entityType == EntityModel.MType.Mentee ? EntityModel.MType.Mentor : EntityModel.MType.Mentee
    
    mSearch(param: param, failure: { error in
      onFail!(error)
      }) { response in
        
        let items = response.arrayValue
        for item in items {
          let dict = item.dictionaryObject
          
          let entity = EntityModel(entityType: entityType,
                                   id: dict!["id"] as! NSNumber,
                                   name: dict!["name"] as! String,
                                   title: dict!["title"] as! String,
                                   city: dict!["city"] as! String,
                                   state: dict!["state"] as! String,
                                   industry: dict!["industry"] as! String,
                                   lookingFor: dict!["lookingFor"] as! String,
                                   language: dict!["language"] as! String,
                                   phone: "",
                                   bio: dict!["bio"] as? String,
                                   email: dict!["email"] as! String,
                                   password: dict!["password"] as! String,
                                   photo: dict!["photo"] as! String)
          
          self.modelList.append(entity)
        }        
//        print(self.modelList)
        onSuccess!()
    }
  }
}