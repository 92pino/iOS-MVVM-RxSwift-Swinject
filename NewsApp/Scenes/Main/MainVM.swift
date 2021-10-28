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
    
    var dataSource: BehaviorRelay<Articles> { get }
    func getHeadLines(country: String)
    
}

class MainVM: MainViewModeling {
    
    // MARK:- Properties
    
    var mainService: MainServicing
    
    init(mainService: MainServicing) {
        self.mainService = mainService
    }
    
    func getHeadLines(country: String) {
//        mainService.getTopHeadLines(country: country).subscribe { <#ApiResult<TopHeadLines>#> in
//            <#code#>
//        } onError: { <#Error#> in
//            <#code#>
//        } onCompleted: {
//            <#code#>
//        } onDisposed: {
//            <#code#>
//        }

    }
    
}
