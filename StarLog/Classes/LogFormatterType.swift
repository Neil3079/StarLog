//
//  LogFormatterType.swift
//  DomainDrivenLogging
//
//  Created by Neil Horton on 17/09/2017.
//

import Foundation

public protocol LogFormatterType {
  associatedtype DomainType: RawRepresentable, Equatable
  func formattedLogMessage(withLog log: String, inDomain domain: DomainType) -> String
}

public struct StringDomainLogFormatter<T: RawRepresentable & Equatable>: LogFormatterType where T.RawValue == String {
  public typealias DomainType = T
  
  public init() {}
  
  public func formattedLogMessage(withLog log: String, inDomain domain: T) -> String {
    return domain.rawValue + ": " + log
  }
}
