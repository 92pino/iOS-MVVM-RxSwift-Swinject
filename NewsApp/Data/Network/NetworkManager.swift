//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/15/21.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire


protocol NetworkManagering {
    func request<D: Codable>(method: NetworkMethod, url: String, parameters: [String : Any]?, type: D.Type) -> Observable<ApiResult<D>>
    func request<D: Codable>(method: NetworkMethod, url: String, parameters: [String : Any]?, type: D.Type, header: [String: String]) -> Observable<ApiResult<D>>
}

final class NetworkManager: NetworkManagering {
    
    private let queue = DispatchQueue(label: "NewsApp.Network.Queue", qos: .background)
    private let userDefualtManagering: UserDefualtManagering
    
    init(userDefualtManagering: UserDefualtManagering) {
        self.userDefualtManagering = userDefualtManagering
    }
    
    func request<D>(method: NetworkMethod, url: String, parameters: [String : Any]?, type: D.Type, header: [String : String]) -> Observable<ApiResult<D>> where D : Decodable, D : Encodable {
        return handleRequest(method: method, url: url, parameters: parameters, type: type, header: header)
    }
    
    func request<D: Codable>(method: NetworkMethod, url: String, parameters: [String : Any]?, type: D.Type) -> Observable<ApiResult<D>> {
        return handleRequest(method: method, url: url, parameters: parameters, type: type, header: nil)
    }
    
    private func handleRequest<D>(method: NetworkMethod, url: String, parameters: [String : Any]?, type: D.Type, header: [String : String]?) -> Observable<ApiResult<D>> where D : Decodable, D : Encodable {
        return Observable.create { observer in
            
            let method = method.httpMethod()
            
            var headers: HTTPHeaders = [
                "Content-Type": "application/json",
                "Accept-Language": "",
                "Authorization": "Bearer "
            ]
            
            if let header = header {
                for (key, value) in header {
                    headers[key] = value
                }
            }
            
            if let parameters = parameters {
                Logger.info(message: "API params: \(parameters)")
            }
            
            let request = AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                .validate()
                .response(queue: self.queue) { response in
                    switch response.result {
                    case .success(_ ):
                        guard let data = response.data else {
                            observer.onNext(ApiResult(data: nil, statusCode: response.response?.statusCode))
                            observer.onCompleted()
                            return
                        }
                        
                        if let model = try? JSONDecoder().decode(D.self, from: data) {
                            observer.onNext(ApiResult(data: model, statusCode: response.response?.statusCode))
                            observer.onCompleted()
                        } else {
                            let myError = MyError(status: "", code: "", message: "Decoding Failed")
                            observer.onError(myError)
                            observer.onCompleted()
                        }
                    case .failure(let error):
                        let myError = MyError(status: "", code: "", message: error.localizedDescription)
                        observer.onError(myError)
                    }
                }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}

enum NetworkMethod {
    case get, post, put, delete, patch
}

fileprivate extension NetworkMethod {
    func httpMethod() -> HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        case .delete:
            return .delete
        case .patch:
            return .patch
        }
    }
}

