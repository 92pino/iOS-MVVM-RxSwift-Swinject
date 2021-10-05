//
//  StartAssembly.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/5/21.
//

import Foundation
import Swinject

class StartAssembly: Assembly {
    
    func assemble(container: Container) {
        
        // MARK: - VM
        
        container.register(StartViewModeling.self, factory: { resolver in
            StartVM()
        }).inObjectScope(.weak)
        
        // MARK: - VC
        
        container.storyboardInitCompleted(StartVC.self) { resolver, controller in
            controller.viewModel = resolver.resolve(StartViewModeling.self)!
        }
        
    }
}
