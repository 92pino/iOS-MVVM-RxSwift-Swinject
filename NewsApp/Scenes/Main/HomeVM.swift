//
//  MainVM.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/7/21.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeViewModeling {
    var dataSource: PublishSubject<Result<[Articles], Error>> { get }
}

class HomeVM: BaseVM, HomeViewModeling {
    
    var dataSource = PublishSubject<Result<[Articles], Error>>()
    
    // MARK:- Properties
    
    var mainService: HomeServicing
    
    init(mainService: HomeServicing) {
        self.mainService = mainService
        super.init()
        getHeadLines(country: "us")
    }
    
    private func getHeadLines(country: String)  {
        mainService.getTopHeadLines(country: country).subscribe(onNext: { [weak self] apiResult in
            self?.dataSource.onNext(.success(apiResult.data?.articles ?? []))
        }, onError: { [weak self] error in
            self?.dataSource.onNext(.failure(error))
        }).disposed(by: disposeBag)
    }
}
