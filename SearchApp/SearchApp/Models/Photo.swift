//
//  Photo.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/06.
//

import Foundation

struct Photo: Codable, Hashable {
    enum CodingKeys: String, CodingKey {
        case title, link, thumbnail, sizewidth, sizeheight
    }
    
    var title: String
    var link: String
    var thumbnail: String
    var sizewidth: String
    var sizeheight: String
}

extension Photo {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let decodedTitle = try container.decode(String.self, forKey: .title)
        self.title = String(htmlEncodedString: decodedTitle) ?? ""
        
        self.link = try container.decode(String.self, forKey: .link)
        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
        self.sizewidth = try container.decode(String.self, forKey: .sizewidth)
        self.sizeheight = try container.decode(String.self, forKey: .sizeheight)
    }
}
