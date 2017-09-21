//
//  AppDelegate.swift
//  StarLog
//
//  Created by Neil3079 on 09/18/2017.
//  Copyright (c) 2017 Neil3079. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      
      guard let somethingImpossible: String = nil else {
        AppLog.log(message: "Test message", inDomain: .unreachableGuard)
        return true
      }
      AppLog.log(message: somethingImpossible, inDomain: .info)
      
      return true
  }
}
