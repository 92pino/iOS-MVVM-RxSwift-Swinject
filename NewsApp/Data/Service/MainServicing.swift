//
//  MainServicing.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/24/21.
//

import Foundation
import RxSwift

protocol MainServicing {
    func getTopHeadLines(country: String, page: Int, pageSize: Int) -> Observable<ApiResult<TopHeadLines>>
}

class MainService: MainServicing {
    
    private let network: NetworkManagering
    
    init(network: NetworkManagering) {
        self.network = network
    }
    
    func getTopHeadLines(country: String, page: Int, pageSize: Int) -> Observable<ApiResult<TopHeadLines>> {
        return network.request(method: .get,
                               url: NewsEndPoints.headLines.url + "?country=\(country)&apiKey=\(Constants.API_KEY)&page=\(page)&pageSize=\(pageSize)",
                               parameters: nil,
                               type: TopHeadLines.self)
    }
    
}

enum NewsEndPoints {
    case headLines
    
    var url : String {
        switch self {
        case .headLines:
            return "\(Constants.BASE_URL)top-headlines"
        }
    }
}
