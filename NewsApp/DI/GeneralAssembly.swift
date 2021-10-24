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
        
        container.register(UserDefualtManaging.self,  factory: { _ in
            UserDefualtManager()
        }).inObjectScope(.container)
    }

}
