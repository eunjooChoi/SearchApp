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
        let removedTagString = removeBTag(string: string)
        
        var attributedString = AttributedString(removedTagString)
        let ranges = attributedString.ranges(of: keyword)
        
        for range in ranges {
            attributedString[range].backgroundColor = .yellow
        }
        
        return attributedString
    }
    
    private func removeBTag(string: String) -> String {
        return string.replacingOccurrences(of: "<b>", with: "")
            .replacingOccurrences(of: "</b>", with: "")
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
