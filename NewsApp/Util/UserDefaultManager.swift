//
//  UserDefaultManager.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/15/21.
//

import Foundation

protocol UserDefualtManagering {
    func getString(key: String) -> String
    func getBool(key: String) -> Bool
    func setString(key: String, value: String)
    func setBool(key: String, value: Bool)
    func remove(key: String)
}

class UserDefualtManager: UserDefualtManagering {
    
    private var userdefualt: UserDefaults
    
    init() {
        userdefualt = UserDefaults.standard
    }
    
    func getString(key: String) -> String {
        userdefualt.string(forKey: key) ?? ""
    }
    
    func getBool(key: String) -> Bool {
        userdefualt.bool(forKey: key)
    }
    
    func setString(key: String, value: String) {
        userdefualt.set(value, forKey: key)
    }
    
    func setBool(key: String, value: Bool) {
        userdefualt.set(value, forKey: key)
    }
    
    func remove(key: String) {
        userdefualt.removeObject(forKey: key)
    }
}
