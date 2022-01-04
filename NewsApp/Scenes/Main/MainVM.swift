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
    var dataSource: PublishSubject<Result<[Articles], Error>> { get }
}

class MainVM: BaseVM, MainViewModeling {
    
    var dataSource = PublishSubject<Result<[Articles], Error>>()
    
    // MARK:- Properties
    
    var mainService: MainServicing
    
    init(mainService: MainServicing) {
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
