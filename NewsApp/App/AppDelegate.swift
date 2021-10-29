//
//  AppDelegate.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 7/31/21.
//

import UIKit
import Swinject
import IQKeyboardManagerSwift
import AlamofireEasyLogger


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    internal let container = Container()
    var assembler: Assembler!
    let alamofireLogger = FancyAppAlamofireLogger(prettyPrint: true) { print($0) }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        /// setup  di
        if #available(iOS 13, *) {
            // do only pure app launch stuff, not interface stuff
        } else {
            assembler = Assembler([
                GeneralAssembly(),
                ServiceAssembly(),
                StartAssembly(),
                MainAssembly()
            ], container: container)
            
            /// setup router
            Router.shared.container = container
            Router.shared.window = window
            Router.shared.configIntialVC()
        }
        
        /// setup keyboard
        IQKeyboardManager.shared.enable = true
        
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
