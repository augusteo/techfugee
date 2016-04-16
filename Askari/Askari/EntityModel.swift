//
//  EntityModel.swift
//  Askari
//
//  Created by Pk Heng on 16/04/2016.
//  Copyright © 2016 Pk Heng. All rights reserved.
//

struct EntityModel {
  
  enum MType: Int {
    case Mentor
    case Mentee
  }
  
  var entityType: MType
  
  var id: String
  var name: String
  var title: String
  var city: String
  var state: String
  var industry: String
  var lookingFor: String
  var language: String
  var phone: String
  var bio: String?
  var email: String
  var password: String
  var photo: String
  
}
