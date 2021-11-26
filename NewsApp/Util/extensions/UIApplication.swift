//
//  UIApplication.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 11/26/21.
//

import Foundation
import UIKit

extension UIApplication {
    
    var statusBarView: UIView? {
        if #available(iOS 13.0, *) {
            let statusBar =  UIView()
            
            statusBar.frame = UIApplication.shared.statusBarFrame
            
            UIApplication.shared.keyWindow?.addSubview(statusBar)
            
            return statusBar
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            return statusBar
        }
    }
}
