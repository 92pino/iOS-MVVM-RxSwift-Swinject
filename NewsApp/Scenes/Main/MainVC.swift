//
//  MainVC.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/7/21.
//

import UIKit
import Foundation

class MainVC: BaseVC {
    
    // MARK: - IBOutlets
    
    @IBOutlet var table: UITableView!
    
    // MARK: - Properties
    
    var viewModel: MainViewModeling!
    
    
    // MARK: - Functions
    
    override func setupView() {
        registerTable()
    }
    
    private func registerTable() {
        table.register(MainCell.nib(), forCellReuseIdentifier: MainCell.identifier)
    }
    
    override func setupSubscribers() {
        viewModel.dataSource.asObservable().bind(to: table.rx.items(cellIdentifier: MainCell.identifier, cellType: MainCell.self)) { index, model, cell in
            cell.viewModel = model
        }.disposed(by: disposeBag)
        
        table.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            guard let strongSelf = self else { return }
            strongSelf.table.deselectRow(at: indexPath, animated: true)
        
            let article = strongSelf.viewModel.articles[indexPath.row]
            
            self?.navigateToDetailVC(article: article)
            
        }).disposed(by: disposeBag)
    }
    
    private func navigateToDetailVC(article: Article) {
        
    }
    
    override func setupViewBindings() {
        /* NO-OP */
    }
}
