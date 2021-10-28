//
//  BaseVC.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/7/21.
//

import UIKit
import RxSwift

@objc protocol BaseVCProtocol {
    @objc optional func setupView()
    @objc optional func setupObservers()
    @objc optional func setupViewBindings()
}

class BaseVC: UIViewController, BaseVCProtocol {
    
    public let disposeBag = DisposeBag()
    
    func setupView() {}
    func setupObservers() {}
    func setupViewBindings() {}

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupObservers()
        setupViewBindings()
    }
    
    deinit {
        Logger.info(message: "Deallocated >>> \(self)")
    }
}
