//
//  MainVM.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/7/21.
//

import Foundation
import RxSwift
import RxCocoa

protocol MainViewModeling {
    var dataSource: BehaviorRelay<[MainCellModeling]> { get }
}

class MainVM: BaseVM, MainViewModeling {
    
    var dataSource = BehaviorRelay<[MainCellModeling]>(value: [])
    
    // MARK:- Properties
    
    var mainService: MainServicing
    
    init(mainService: MainServicing) {
        self.mainService = mainService
        super.init()
        getHeadLines(country: "us")
    }
    
    private func getHeadLines(country: String)  {
        var list = [MainCellModeling]()
        
        mainService.getTopHeadLines(country: country).subscribe(onNext: { [weak self] apiResult in
            guard let articles = apiResult.data?.articles else { return }
            
            let _ = articles.map {
                let mainCellModel = MainCellModel(title: $0.title, imageUrl: $0.urlToImage)
               list.append(mainCellModel)
            }
            
            self?.dataSource.accept(list)
        }, onError: { error in
            Logger.error(message: error.localizedDescription)
        }).disposed(by: disposeBag)
    }
}
