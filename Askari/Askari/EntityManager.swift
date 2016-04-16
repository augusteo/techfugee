//
//  EntityManager.swift
//  Askari
//
//  Created by Pk Heng on 16/04/2016.
//  Copyright © 2016 Pk Heng. All rights reserved.
//

class EntityManager {
  static let shareInstance = EntityManager()
  var entity: EntityModel?
  
  func isLoggedIn() -> Bool {
    return entity != nil
  }
  
  func getProfession() -> String {
    
    guard entity?.title != nil || entity?.industry != nil else {
      return "Software Developer / Technology"
    }
    
    return "\(entity!.title) - \(entity!.industry)"
  }
  
  func getLocation() -> String {
    
    guard entity?.state != nil || entity?.city != nil else {
      return "VIC / Melbourne"
    }
    
    return "\(entity!.state) - \(entity!.city)"
  }
}
