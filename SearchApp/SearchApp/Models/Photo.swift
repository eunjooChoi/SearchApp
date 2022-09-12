//
//  Photo.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/06.
//

import Foundation

struct Photo: Codable, Hashable {
    var title: String
    var link: String
    var thumbnail: String
    var sizewidth: String
    var sizeheight: String
}
