//
//  ServiceAssembly.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/24/21.
//

import Foundation
import Swinject

class  ServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        
        // MARK: - Network
        
        container.register(NetworkingManager.self, factory: { resolver in
            NetworkManager(userDefualtManaging: resolver.resolve(UserDefualtManaging.self)!)
        }).inObjectScope(.container)
        
        // MARK: - Service
        
        container.register(MainServicing.self, factory: { resolver in
            MainService(network: resolver.resolve(NetworkingManager.self)!)
        }).inObjectScope(.transient)
        
        
        
    }
    
    
}
