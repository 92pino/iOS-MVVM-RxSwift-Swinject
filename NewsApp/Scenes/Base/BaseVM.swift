//
//  BaseVM.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/28/21.
//

import Foundation
import RxSwift


@objc protocol BaseVMProtocol {
    @objc optional func setupBindings()
    @objc optional func apiCalls()
}


class BaseVM: BaseVMProtocol {
    
    public let disposeBag = DisposeBag()

    // MARK: - Init & Deinit
    
    init() {
        setupBindings()
        apiCalls()
    }
    
    deinit {
        Logger.info(message: "Deallocated VM >>> \(self)")
    }
    
    // MARK: - Functions
    
    func setupBindings() {}
    func apiCalls() {}
}

