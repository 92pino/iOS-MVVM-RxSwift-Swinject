//
//  MainVC.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/7/21.
//

import UIKit
import Foundation

class HomeVC: BaseVC {
    
    // MARK: - Properties
    
    var viewModel: HomeViewModeling!
    
    override func setupView() {
        
    }
    
    override func setupObservers() {
        viewModel.dataSource.subscribe(onNext: { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let articles):
               
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
