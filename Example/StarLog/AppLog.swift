//
//  AppLog.swift
//  StarLog_Example
//
//  Created by Neil Horton on 21/09/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import StarLog

/// StarLog relies heavily on generics in order to create a nice interface. This can be overwhelming
/// so we reccomend creating a type alias for your log formatter to enhance readability.
private typealias LogFormatter = StringDomainLogFormatter<AppLogDomain>


/// Below is an example implementation wrapping StarLog in static methods. As StarLog is a open source
/// third party framewrok we reccomend wrapping it some way. Note this is not the only way to use StarLog
/// You could also inject an instance of StarLog whereever it is needed. For testing a protocol is supplied in
/// the framework.
final class AppLog {
  
  
  /// An example configuration of setting up the configuration for your logger. In this scenario only
  /// messages logged in the "unreachableGuard" and "info" domains will be logged. No remote log resource
  /// is supplied so this log will only print messages locally. Fine control over weather to post to your remote
  /// is also exposed via boolean variables on the logger configuration.
  private static let config = LoggerConfiguration<LogFormatter>(logLevel: .domain([.unreachableGuard, .info]),
                                                                formatter: StringDomainLogFormatter())
  
  private static let logger: Logger = Logger(logConfig: config)
  
  private init() {}
  
  
  /// An example of a static function wrapping StarLog.
  ///
  /// - Parameters:
  ///   - message: The message to be logged.
  ///   - domain: The domain in which to log the message, note the type here is a enum defined by the
  ///             application itself not by the framework.
  public static func log(message: String, inDomain domain: AppLogDomain) {
    logger.log(message: message, inDomain: domain)
  }
}
