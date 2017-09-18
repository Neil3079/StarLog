//
//  LoggerConfiguration.swift
//  DomainDrivenLogging
//
//  Created by Neil Horton on 17/09/2017.
//

import Foundation

public struct LoggerConfiguration<Domain, LogFormatter: LogFormatterType> where LogFormatter.DomainType == Domain {
  let logLevel: LogLevel<Domain>
  let formatter: LogFormatter
  let remoteLogResource: RemoteLogResource?
  let informRemoteLog: Bool
  let informLocalLog: Bool
}
