//
//  LogLevel.swift
//  DomainDrivenLogging
//
//  Created by Neil Horton on 17/09/2017.
//

import Foundation

public enum LogLevel<T: RawRepresentable> where T: Equatable {
  case none
  case domain([T])
  case all
}
