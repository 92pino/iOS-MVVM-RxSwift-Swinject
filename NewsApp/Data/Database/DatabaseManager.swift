//
//  DatabaseManager.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 12/2/21.
//

import Foundation
import RealmSwift

protocol DatabaseManagering {
    
}

class DatabaseManager: DatabaseManagering {
    
    private var database: Realm
    static let sharedInstance = DatabaseManager()
    
    private init() {
        database = try! Realm()
    }
    
//    func addData(object: Item)   {
//        try! database.write {
//            database.add(object, update: true)
//            Logger.info(message: <#T##String#>)
//        }
//    }
    
    func deleteAllFromDatabase()  {
        try! database.write {
            database.deleteAll()
        }
    }
    
//    func deleteFromDb(object: Item)   {
//        try!   database.write {
//            database.delete(object)
//        }
//    }
    
}

