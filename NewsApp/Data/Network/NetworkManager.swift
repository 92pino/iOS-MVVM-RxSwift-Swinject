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
import SwiftyJSON


protocol NetworkingManager {
    func request<D: Codable>(method: NetworkMethod, url: String, parameters: [String : Any]?, type: D.Type) -> Observable<ApiResult<D>>
    func request<D: Codable>(method: NetworkMethod, url: String, parameters: [String : Any]?, type: D.Type, header: [String: String]) -> Observable<ApiResult<D>>
    func uploadImage<D: Codable>(method: NetworkMethod, url: String, imageData: Data, fileName: String, type: D.Type) -> Observable<ApiResult<D>>
}

final class NetworkManager: NetworkingManager {
    
    private let queue = DispatchQueue(label: Constants.BACK_GROUND_QUEUE)
    private let userDefualtManaging: UserDefualtManaging
    
    init(userDefualtManaging: UserDefualtManaging) {
        self.userDefualtManaging = userDefualtManaging
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
                "Authorization": "Bearer ",
                
            ]
            if header != nil {
                headers["Origin"] = "https://didex.ir"
            }
            
            if parameters != nil {
                Logger.info(message: "API parms: \(parameters!)")
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
                            observer.onError(MyError(message: "Error"))
                            observer.onCompleted()
                        }
                        
                    case .failure(let error):
                        if error.isSessionTaskError {
                            observer.onError(MyError(message: "No Internet Connection"))
                        } else {
                            var myError = MyError(message: "Temp error")
                            if let data = response.data {
                                let _ = JSON(data)
                                observer.onError(myError)
                            } else {
                                myError.message = error.localizedDescription
                                observer.onError(myError)
                            }
                        }
                    }
                }
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    
    func uploadImage<D: Codable>(method: NetworkMethod, url: String, imageData: Data, fileName: String, type: D.Type) -> Observable<ApiResult<D>> {
        return Observable.create { observer in
            
            let method = method.httpMethod()
            let headers: HTTPHeaders = [
                "Content-Type": "multipart/form-data",
                "Accept-Language": "",
                "Authorization": "Bearer "
            ]
            
            let request = AF.upload(multipartFormData: { multipartFormData in
                                        multipartFormData.append(
                                            imageData,
                                            withName: "fileset",
                                            fileName: fileName,
                                            mimeType: "image/jpg"
                                        )},
                                    to: url,
                                    method: method,
                                    headers: headers
            ).validate()
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
                        observer.onError(MyError(message: "Error"))
                        observer.onCompleted()
                    }
                    
                case .failure(let error):
                    if error.isSessionTaskError {
                        observer.onError(MyError(message: "No Internet Connection"))
                        
                    } else {
                        var myError = MyError(message: "Temp error")
                        if let data = response.data {
                            let _ = JSON(data)
                            observer.onError(myError)
                        } else {
                            myError.message = error.localizedDescription
                            observer.onError(myError)
                        }
                    }
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

