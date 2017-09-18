//
//  LoggerConfiguration.swift
//  DomainDrivenLogging
//
//  Created by Neil Horton on 17/09/2017.
//

import Foundation

public struct LoggerConfiguration<X, LogFormatter: LogFormatterType> where LogFormatter.DomainType == X {
  let logLevel: LogLevel<X>
  let formatter: LogFormatter
  let remoteLogResource: RemoteLogResource?
  let informRemoteLog: Bool
  let informLocalLog: Bool
}
