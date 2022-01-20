//
//  TopHeadLines.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 10/24/21.
//

import Foundation

struct TopHeadLines: Codable {
    
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
    
    enum CodingKeys: String, CodingKey {
        case status, totalResults, articles
    }
}

struct Article: Codable {
    
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content
    }
}

struct Source: Codable {
    
    let id: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}
