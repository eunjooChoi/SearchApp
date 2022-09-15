//
//  News.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/06.
//

import Foundation

struct News: Codable, Hashable {
    var title: String
    var link: String
    var description: String
    var pubDate: String     // "pubDate":"Mon, 12 Sep 2022 15:30:00 +0900"
}

extension Date {
    var stringValue: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd"
        
        return dateFormatter.string(from: self)
    }
}
