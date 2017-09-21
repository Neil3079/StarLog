//
//  LoggerConfiguration.swift
//  DomainDrivenLogging
//
//  Created by Neil Horton on 17/09/2017.
//

import Foundation

public struct LoggerConfiguration<LogFormatter: LogFormatterType> {
  let logLevel: LogLevel<LogFormatter.DomainType>
  let formatter: LogFormatter
  let remoteLogResource: RemoteLogResource?
  let informRemoteLog: Bool
  let informLocalLog: Bool
  
  public init(logLevel: LogLevel<LogFormatter.DomainType>, formatter: LogFormatter, remoteLogResource: RemoteLogResource? = nil, informRemoteLog: Bool = false, informLocalLog: Bool = true) {
    self.logLevel = logLevel
    self.formatter = formatter
    self.remoteLogResource = remoteLogResource
    self.informRemoteLog = informRemoteLog
    self.informLocalLog = informLocalLog
  }
}
