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

struct MainCellModel : MainCellModeling {
    let title: String?
    let imageUrl: String?
}
