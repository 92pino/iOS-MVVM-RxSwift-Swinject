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
    
    // MARK: - IBOutlets
    @IBOutlet var table: UITableView!
    
    
    // MARK: - Functions
    
    override func setupView() {
        registerTable()
    }
    
    private func registerTable() {
        table.register(MainCell.nib(), forCellReuseIdentifier: MainCell.identifier)
    }
    
    override func setupObservers() {
        viewModel.dataSource.asObservable().bind(to: table.rx.items(cellIdentifier: MainCell.identifier, cellType: MainCell.self)) { index, model, cell in
            cell.viewModel = model
        }.disposed(by: disposeBag)
    }
    
    override func setupViewBindings() {
        /* NO-OP */
    }
}
