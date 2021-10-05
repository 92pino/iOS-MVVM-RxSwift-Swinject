//
//  StartVM.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/5/21.
//

import Foundation
import RxSwift

protocol StartViewModeling {
    var trigger: PublishSubject<Bool> { get }
}

class StartVM: StartViewModeling {
    
    var trigger: PublishSubject<Bool> = PublishSubject()
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.trigger.onNext(true)
        }
    }
}
