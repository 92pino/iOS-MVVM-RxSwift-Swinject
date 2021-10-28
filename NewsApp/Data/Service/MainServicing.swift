//
//  MainServicing.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/24/21.
//

import Foundation
import RxSwift

protocol MainServicing {
    func getTopHeadLines(country: String) -> Observable<ApiResult<TopHeadLines>>
}

class MainService: MainServicing {
    
    private let network: NetworkingManager
    
    init(network: NetworkingManager) {
        self.network = network
    }
    
    func getTopHeadLines(country: String) -> Observable<ApiResult<TopHeadLines>> {
        return network.request(method: .get,
                               url: NewsEndPoints.headLines.url + "?country=\(country)&apiKey=\(Constants.API_KEY)",
                               parameters: nil,
                               type: TopHeadLines.self)
    }
    
}

enum NewsEndPoints {
    case headLines
    
    var url : String {
        switch self {
        case .headLines:
            return "top-headlines"
        default:
            return ""
        }
    
    }
}
