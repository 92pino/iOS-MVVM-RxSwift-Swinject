//
//  MainVC.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/7/21.
//

import UIKit
import Foundation

class MainVC: BaseVC {
    
    // MARK: - Properties
    
    var viewModel: MainViewModeling!
    
    override func setupView() {
        viewModel.getHeadLines(country: "us")
    }
    
    override func setupObservers() {
        viewModel.dataSource.subscribe(onNext: { [weak self] result in
            switch result {
            case .success(let articles):
                print("Articles are \(articles)")
                break
            case .failure(let error):
                Logger.error(message: error.localizedDescription)
                break
            }
        }).disposed(by: disposeBag)
    }
    
    override func setupViewBindings() {
        /* NO-OP */
    }
    
    
    
}
