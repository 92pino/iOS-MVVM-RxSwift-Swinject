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
        
        container.register(HomeServicing.self, factory: { resolver in
            HomeService(network: resolver.resolve(NetworkManagering.self)!)
        }).inObjectScope(.transient)
    }
}
