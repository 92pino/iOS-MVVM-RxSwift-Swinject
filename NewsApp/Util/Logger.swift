//
//  Logger.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/15/21.
//

import Foundation

class Logger {
    
    static func log(message: String) {
        debugPrint("✅✅✅ >>> \(message)")
    }
    
    static func info(message: String) {
        debugPrint("💡💡💡 >>> \(message)")
    }
    
    static func error(message: String) {
        debugPrint("🔴🔴🔴 >>> \(message)")
    }
}
