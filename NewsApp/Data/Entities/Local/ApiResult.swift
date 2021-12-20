//
//  ApiResult.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/15/21.
//

import Foundation

struct ApiResult<D: Codable> {
    var data: D?
    var statusCode: Int?
}
