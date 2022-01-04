//
//  MainCellModel.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 12/31/21.
//

import Foundation

protocol MainCellModeling {
    var title: String? { get }
    var imageUrl: String? { get }
}

class MainCellModel : MainCellModeling {
    var title: String?
    var imageUrl: String?
    
    init(title: String?, imageUrl: String?) {
        self.title = title
        self.imageUrl = imageUrl
    }
}
