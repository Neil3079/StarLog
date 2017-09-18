//
//  RemoteLogResource.swift
//  DomainDrivenLogging
//
//  Created by Neil Horton on 17/09/2017.
//

import Foundation

public enum RemoteLogHTTPMethod: String {
  case GET
  case POST
  case PUT
}

public protocol RemoteLogResource {
  var httpMethod: RemoteLogHTTPMethod { get }
  func url(forMessage message: String) -> URL
  func body(forMessage message: String) -> Dictionary<String, Any>?
}
