//
//  Atricle.swift
//  News App
//
//  Created by Chris Boshoff on 2022/02/25.
//

import Foundation

struct Article: Decodable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    
}
