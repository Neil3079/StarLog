//
//  DomainLogger.swift
//  DomainDrivenLogging
//
//  Created by Neil Horton on 13/09/2017.
//

import Foundation

public protocol LoggerType {
  associatedtype Domain
  func log(message: String, inDomain domain: Domain)
}

public final class Logger<LogFormatter: LogFormatterType>: LoggerType {
  private let logConfig: LoggerConfiguration<LogFormatter>
  
  public init(logConfig: LoggerConfiguration<LogFormatter>) {
    self.logConfig = logConfig
  }
  
  public func log(message: String, inDomain domain: LogFormatter.DomainType) {
    DispatchQueue.global(qos: .background).async {
      switch self.logConfig.logLevel {
      case .none:
        return
      case .domain(let domains):
        guard domains.contains(domain) else { return }
        self.writeLog(message: message, inDomain: domain)
      case .all:
        self.writeLog(message: message, inDomain: domain)
      }
    }
  }
  
  private func writeLog(message: String, inDomain domain: LogFormatter.DomainType) {
    let formattedMessage = logConfig.formatter.formattedLogMessage(withLog: message, inDomain: domain)
    if logConfig.informLocalLog {
      print(formattedMessage)
    }
    postLogMessageToRemote(formattedMessage)
  }
  
  private func postLogMessageToRemote(_ message: String) {
    guard logConfig.informRemoteLog, let resource = logConfig.remoteLogResource else {
      return
    }
    var urlRequest = URLRequest(url: resource.url(forMessage: message))
    urlRequest.httpMethod = resource.httpMethod.rawValue
    if let requestBody = resource.body(forMessage: message) {
      do {
        let jsonData = try JSONSerialization.data(withJSONObject: requestBody, options: .prettyPrinted)
        urlRequest.httpBody = jsonData
      } catch {
        print(error.localizedDescription)
      }
    }
    URLSession.shared.dataTask(with: urlRequest).resume()
  }
}
