//
//  Blog.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/06.
//

import Foundation

struct Blog: Codable, Hashable {
    var title: String
    var link: String
    var description: String
    var bloggername: String
    var bloggerlink: String
}
