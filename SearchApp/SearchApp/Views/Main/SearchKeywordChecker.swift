//
//  SearchKeywordChecker.swift
//  SearchApp
//
//  Created by 최은주 on 2022/10/18.
//

import Foundation

class SearchKeywordChecker {
    /**
            검색어가 빈 문자열인지 체크 (추후 조건이 추가되면 해당 메서드에서 검색 가능 여부 판단)
     */
    func checkKeywordAvailable(keyword: String) -> Bool {
        return keyword.isNotEmpty
    }
}

private extension String {
    var isNotEmpty: Bool {
        !isEmpty
    }
}
