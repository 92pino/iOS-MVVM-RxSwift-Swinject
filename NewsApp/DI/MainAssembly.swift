//
//  MainAssembl.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/5/21.
//

import Foundation
import Swinject

class MainAssembly: Assembly {
    
    func assemble(container: Container) {
        
        // MARK: - VM
        
        container.register(MainViewModeling.self, factory: { resolver in
            MainVM(mainService: resolver.resolve(MainServicing.self)!)
        }).inObjectScope(.weak)
        
        // MARK: - VC
        
        container.storyboardInitCompleted(MainVC.self) { resolver, controller in
            controller.viewModel = resolver.resolve(MainViewModeling.self)!
        }
    }    
}
