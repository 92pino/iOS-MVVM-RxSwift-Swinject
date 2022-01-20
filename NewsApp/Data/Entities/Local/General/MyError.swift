//
//  MyError.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/15/21.
//

import Foundation


struct MyError: Error {
    let status: String?
    let code: String?
    let message: String?
}

extension MyError {
    
    static func getError(error: Error) -> MyError {
        return error as? MyError ?? MyError.init(status: "", code: "", message: "")
    }
}
