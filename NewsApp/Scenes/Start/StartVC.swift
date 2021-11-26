//
//  StartViewController.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/5/21.
//

import UIKit
import RxSwift

class StartVC: BaseVC {
    
    // MARK: - Properties
    
    var viewModel: StartViewModeling!
    
    override func setupObservers() {
        viewModel.trigger.subscribe(onNext: { [weak self] isChanged in
            if (isChanged) {
                self?.navigateToMain()
                print("changed")
            }
        }).disposed(by: disposeBag)
    }
    
    private func navigateToMain() {
        DispatchQueue.main.async {
            Router.shared.navigateToDashbaord()
        }
    }
}
