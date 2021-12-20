//
//  GeneralAssembly.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 9/27/21.
//

import Foundation
import Swinject

final class GeneralAssembly: Assembly {
    
    func assemble(container: Container) {
        
        // MARK : - UserDefualts
        
        container.register(UserDefualtManagering.self, factory: { _ in
            UserDefualtManager()
        }).inObjectScope(.container)
        
        // MARK : - DatabaseManager
        
        container.register(DatabaseManagering.self, factory: { _ in
            DatabaseManager()
        }).inObjectScope(.container)
    }
}
