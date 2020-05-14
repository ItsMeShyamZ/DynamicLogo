//
//  AppDelegate.swift
//  DynamicLogo
//
//  Created by Abservetech on 13/05/20.
//  Copyright © 2020 Abservetech. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        print("ApplicationShourCut", shortcutItem)
        if shortcutItem.type == "UIApplicationShortcutItemType"{
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initViewController  = storyBoard.instantiateViewController(withIdentifier: "3dtouch")
            self.window?.rootViewController = initViewController
            self.window?.makeKeyAndVisible()
        }
    }
}

