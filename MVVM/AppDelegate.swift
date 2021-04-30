//
//  AppDelegate.swift
//  MVVM
//
//  Created by Azfar Hussain on 30/04/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController : UIViewController = storyboard.instantiateViewController(withIdentifier: "Home") as UIViewController
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = viewController
    self.window?.makeKeyAndVisible()
    return true
  }
}

