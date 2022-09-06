//
//  News.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/06.
//

import Foundation

struct News: Codable {
    var title: String
    var link: String
    var description: String
    var pubdate: Date
}
