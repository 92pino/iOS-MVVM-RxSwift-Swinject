//
//  MainAssembl.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/5/21.
//

import Foundation
import Swinject

class HomeAssembly: Assembly {
    
    func assemble(container: Container) {
        
        // MARK: - VM
        
        container.register(HomeViewModeling.self, factory: { resolver in
            HomeVM(mainService: resolver.resolve(HomeServicing.self)!)
        }).inObjectScope(.weak)
        
        // MARK: - VC
        
        container.storyboardInitCompleted(HomeVC.self) { resolver, controller in
            controller.viewModel = resolver.resolve(HomeViewModeling.self)!
        }
    }    
}
