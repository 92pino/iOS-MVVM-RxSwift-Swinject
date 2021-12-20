//
//  DatabaseManager.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 12/2/21.
//

import Foundation
import RealmSwift

protocol DatabaseManagering {
    func write()
    func read()
    func update()
    func delete()
    func deleteAll()
}

class DatabaseManager: DatabaseManagering {
    
    private var database: Realm? = nil
    
    init() {
        do {
            database = try Realm()
        } catch {
            Logger.error(message: error.localizedDescription)
        }
    }
    
    func write() {
        
    }
    
    func read() {
        
    }
    
    func update() {
        
    }
    
    func delete() {
        
    }
    
    func deleteAll() {
        
    }
}
