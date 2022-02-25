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
    var isLoading: Bool { get }
    
    func getHeadLines(country: String, page: Int)
}

class MainVM: BaseVM, MainViewModeling {
    
    // MARK:- Properties
    
    var dataSource = BehaviorRelay<[MainCellModeling]>(value: [])
    var articles = [Article]()
    var mainCellModels = [MainCellModeling]()
    
    var page: Int = 1
    private let pageSize = 20
    private var hasMorePages = true
    var isLoading = false
    
    var mainService: MainServicing
    
    init(mainService: MainServicing) {
        self.mainService = mainService
        super.init()
    }
    
    
    // MARK: -Functions
    
    func getHeadLines(country: String, page: Int)  {
        if !isLoading && hasMorePages {
            isLoading = true
            mainService.getTopHeadLines(country: country, page: page, pageSize: pageSize).subscribe(onNext: { [weak self] apiResult in
                guard let strongSelf = self else { return }
                
                guard let articles = apiResult.data?.articles else { return }
                strongSelf.articles = articles
                
                let mainCellModels = articles.map {
                   MainCellModel(title: $0.title, imageUrl: $0.urlToImage)
                }
                
                strongSelf.mainCellModels.append(contentsOf: mainCellModels)
                strongSelf.dataSource.accept(strongSelf.mainCellModels)
                strongSelf.hasMorePages = strongSelf.articles.count == strongSelf.pageSize
                
                if strongSelf.hasMorePages {
                    strongSelf.page += 1
                }
                
                strongSelf.isLoading = false
                
            }, onError: { error in
                Logger.error(message: error.localizedDescription)
            }).disposed(by: disposeBag)
        }
        
    }
}
