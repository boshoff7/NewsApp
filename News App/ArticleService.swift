//
//  ArticleService.swift
//  News App
//
//  Created by Chris Boshoff on 2022/02/25.
//

import Foundation

struct ArticleService: Decodable {
    
    var totalResults: Int?
    var articles: [Article]?
    
}
