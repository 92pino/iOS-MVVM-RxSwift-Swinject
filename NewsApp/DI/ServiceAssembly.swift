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
        
        
        
        // MARK: - Service
        
        container.register(MainServicing.self, factory: { resolver in
            MainService(network: resolver.resolve(NetworkManagering.self)!)
        }).inObjectScope(.transient)
    }
}
