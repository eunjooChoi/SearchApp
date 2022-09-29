//
//  Blog.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/06.
//

import Foundation

struct Blog: Codable, Hashable {
    enum CodingKeys: String, CodingKey {
        case title, link, description, bloggername, bloggerlink, postdate
    }
    
    var title: String
    var link: String
    var description: String
    var bloggername: String
    var bloggerlink: String
    var postdate: String        //"postdate":"20220912"
}

extension Blog {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let decodedTitle = try container.decode(String.self, forKey: .title)
        self.title = String(htmlEncodedString: decodedTitle) ?? ""
        
        self.link = try container.decode(String.self, forKey: .link)
        
        let decodedDescription = try container.decode(String.self, forKey: .description)
        self.description = String(htmlEncodedString: decodedDescription) ?? ""
        
        self.bloggername = try container.decode(String.self, forKey: .bloggername)
        self.bloggerlink = try container.decode(String.self, forKey: .bloggerlink)
        self.postdate = try container.decode(String.self, forKey: .postdate)
    }
}
