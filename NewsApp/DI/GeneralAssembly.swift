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
        
        // MARk : - Network
        
        container.register(NetworkManagering.self, factory: { resolver in
            NetworkManager(userDefualtManagering: resolver.resolve(UserDefualtManagering.self)!)
        }).inObjectScope(.container)
        
        
    }
}
