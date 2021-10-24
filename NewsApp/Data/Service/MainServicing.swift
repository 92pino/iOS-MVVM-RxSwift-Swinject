//
//  MainServicing.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/24/21.
//

import Foundation
import RxSwift

protocol MainServicing {
    
}

class MainService: MainServicing {
    
    private let network: NetworkingManager
    
    init(network: NetworkingManager) {
        self.network = network
    }
    
}
