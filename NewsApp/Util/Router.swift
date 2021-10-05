//
//  Router.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 9/27/21.
//

import Foundation
import UIKit
import Swinject
import SwinjectStoryboard

class Router {
    
    static let shared = Router()
    private init() {}
    
    var window: UIWindow?
    var container: Container?
    
    func configIntialVC() {
        window = UIWindow(frame: UIScreen.main.bounds)
        if let container = container, let window = window {
            window.makeKeyAndVisible()
            let storyboard = SwinjectStoryboard.create(name: Constants.START_STORYBOARD_ID, bundle: nil, container: container)
            let _ = storyboard.instantiateViewController(withIdentifier: Constants.START_VC_ID) as! StartVC
            window.rootViewController = storyboard.instantiateInitialViewController()
        }
    }
}
