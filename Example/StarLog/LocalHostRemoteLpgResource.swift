//
//  LocalHostRemoteLpgResource.swift
//  StarLog_Example
//
//  Created by Neil Horton on 21/09/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import StarLog


/// An Example of a remote log resource. Supplying one of these to your log configuration will allow
/// StarLog to inform your remote logging service of events. The example below is probably the most common
/// scenario where the log is required to be POSTed to a remote resource with the actual method in the
/// body of the request.
struct LocalHostRemoteLpgResource: RemoteLogResource {

  let httpMethod: RemoteLogHTTPMethod = .POST
  private let url = URL(string: "http://localhost:8080/log")!
  
  func url(forMessage message: String) -> URL {
    return url
  }
  
  func body(forMessage message: String) -> Dictionary<String, Any>? {
    return ["message": message]
  }
}
