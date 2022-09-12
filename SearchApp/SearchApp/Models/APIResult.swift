//
//  APIResult.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/12.
//

import Foundation

struct APIResult<T: Codable>: Codable {
    let lastBuildDate: String
    let total: Int
    let start: Int
    let display: Int
    let items: [T]
}
