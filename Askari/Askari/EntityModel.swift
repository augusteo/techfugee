//
//  EntityModel.swift
//  Askari
//
//  Created by Pk Heng on 16/04/2016.
//  Copyright © 2016 Pk Heng. All rights reserved.
//

struct EntityModel {
  
  enum MType: Int {
    case Mentor = 0
    case Mentee = 1
  }
  
  var entityType: MType
  
  var name: String
  var industry: String
  var location: String
  var company: String?
  var position: String?
  var email: String
  var phone: String
  
}
