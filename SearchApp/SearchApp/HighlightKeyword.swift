//
//  HighlightKeyword.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/26.
//

import Foundation

class HighlightKeyword {
    let keyword: String
    
    init (keyword: String) {
        self.keyword = keyword
    }
    
    func highlighting(string: String) -> AttributedString {
        var attributedString = AttributedString(string)
        let ranges = attributedString.ranges(of: keyword)
        
        for range in ranges {
            attributedString[range].backgroundColor = .yellow
        }
        
        return attributedString
    }
}

private extension AttributedString {
    func ranges(of keyword: String) -> [Range<AttributedString.Index>] {
        var string = self
        let reversedKeyword = AttributedString(keyword.reversed())
        var ranges: [Range<AttributedString.Index>] = []
        
        while let range = string.range(of: keyword) {
            ranges.append(range)
            string.replaceSubrange(range, with: reversedKeyword)
        }
        
        return ranges
    }
}


extension String {
    init?(htmlEncodedString: String) {
        guard let data = htmlEncodedString.data(using: .utf8) else { return nil }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else { return nil }
        
        self.init(attributedString.string)
    }
}
