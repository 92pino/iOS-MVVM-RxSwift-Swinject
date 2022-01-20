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
    @objc optional func setupSubscribers()
    @objc optional func setupViewBindings()
}

class BaseVC: UIViewController, BaseVCProtocol {
    
    public let disposeBag = DisposeBag()
    
    func setupView() {}
    func setupSubscribers() {}
    func setupViewBindings() {}

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSubscribers()
        setupViewBindings()
    }
    
    deinit {
        Logger.info(message: "Deallocated >>> \(self)")
    }
}
