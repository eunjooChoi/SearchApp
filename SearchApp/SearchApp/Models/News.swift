//
//  News.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/06.
//

import Foundation

struct News: Codable, Hashable {
    enum CodingKeys: String, CodingKey {
        case title, link, description, pubDate
    }
    
    var title: String
    var link: String
    var description: String
    var pubDate: String     // "pubDate":"Mon, 12 Sep 2022 15:30:00 +0900"
}

extension News {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let decodedTitle = try container.decode(String.self, forKey: .title)
        self.title = String(htmlEncodedString: decodedTitle) ?? ""
        
        self.link = try container.decode(String.self, forKey: .link)
        
        let decodedDescription = try container.decode(String.self, forKey: .description)
        self.description = String(htmlEncodedString: decodedDescription) ?? ""
        
        self.pubDate = try container.decode(String.self, forKey: .pubDate)
    }
}


extension Date {
    var stringValue: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMdd"
        
        return dateFormatter.string(from: self)
    }
}
