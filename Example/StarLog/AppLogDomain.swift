//
//  AppLogDomain.swift
//  StarLog_Example
//
//  Created by Neil Horton on 21/09/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation


/// An Example of a possible enum defining log domains for the example app. The requirement for a
/// Log Domain is it conforms both to RawRepresentable and Hashable.
///
/// - unreachableGuard: Example log domain for the else clauses of guard's that should never fail
/// - networking: Example log domain for networking errors
/// - ui: Example log domain for ui information
/// - info: Example log domain for general information
enum AppLogDomain: String {
  case unreachableGuard = "Unreachable Guard"
  case networking = "Networking"
  case ui = "UI"
  case info = "Info"
}
