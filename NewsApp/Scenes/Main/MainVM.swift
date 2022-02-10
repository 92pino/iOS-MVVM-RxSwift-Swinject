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
    var articles: [Article] { get }
    var page: Int { get }
    
    func getHeadLines(country: String, page: Int)
}

class MainVM: BaseVM, MainViewModeling {

    var dataSource = BehaviorRelay<[MainCellModeling]>(value: [])
    var articles = [Article]()
    var page: Int = 1
    
    // MARK:- Properties
    
    var mainService: MainServicing
    
    init(mainService: MainServicing) {
        self.mainService = mainService
        super.init()
        getHeadLines(country: "us", page: page)
    }
    
    func getHeadLines(country: String, page: Int)  {
        var list = [MainCellModeling]()
        
        mainService.getTopHeadLines(country: country, page: page).subscribe(onNext: { [weak self] apiResult in
            
            guard let strongSelf = self else { return }
            guard let articles = apiResult.data?.articles else { return }
            strongSelf.articles = articles
            
            let _ = articles.map {
                let mainCellModel = MainCellModel(title: $0.title, imageUrl: $0.urlToImage)
                list.append(mainCellModel)
            }
            
            strongSelf.dataSource.accept(list)
            strongSelf.page += 1
            
        }, onError: { error in
            Logger.error(message: error.localizedDescription)
        }).disposed(by: disposeBag)
    }
}
