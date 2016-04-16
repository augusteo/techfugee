//
//  AskariAPI.swift
//  Askari
//
//  Created by Pk Heng on 16/04/2016.
//  Copyright © 2016 Pk Heng. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import SwiftyJSON

let serviceBaseUrl = "http://www.askari.com"

private extension String {
  var URLEscapedString: String {
    return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
  }
}

public enum SearchParam {
  case MentorIndustry(String)
  case MenteeIndustry(String)
}

extension SearchParam: TargetType {
  
  public var baseURL: NSURL { return NSURL(string: serviceBaseUrl)!}
  
  public var path: String {
  
    switch self {
    case .MentorIndustry(let industry):
      return "/mentor?industry=\(industry)"
    case .MenteeIndustry(let industry):
      return "/mentee/?industry=\(industry)"
    }
    
  }
  
  public var method: Moya.Method { return .GET }
  
  public var parameters: [String: AnyObject]? {
    switch self {
    default:
      return nil
    }
  }
  
  public var sampleData: NSData {
    switch self {
    default:
      return "Sample Data".dataUsingEncoding(NSUTF8StringEncoding)!
    }
  }
}

public func url(route: TargetType) -> String {
  return "\(route.baseURL)\(route.path)"
}


public func mSearch(param param: SearchParam, failure onFail: (NSError -> ())? = nil, success onSuccess: (JSON -> ())? = nil) {
  getRequest(url(param), failure: { error in
    onFail!(error)
  }) { response in
    onSuccess!(response)
  }
  
}

private func getRequest(url: String, failure onFail: (NSError -> ())? = nil, success onSuccess: (JSON -> ())? = nil) {
  
  print("\(url)")
  
  Alamofire.request(.GET, url).responseJSON { response in
    
    guard response.result.error == nil else {
      print("response error: \(response.result.error!)")
      onFail!(response.result.error!)
      return
    }
    
    if let value = response.result.value {
      let swiftyJSON = JSON(value)
      print("JSON: \(swiftyJSON)")
      onSuccess!(swiftyJSON)
    }
  }
  
}


