//
//  SearchKeywordCheckerTests.swift
//  SearchAppTests
//
//  Created by 최은주 on 2022/10/18.
//

import XCTest
@testable import SearchApp

class SearchKeywordCheckerTests: XCTestCase {
    func test_Checker() {
        let keywordChecker = SearchKeywordChecker()
        var testKeyword = "keyword"
        
        XCTAssertTrue(keywordChecker.checkKeywordAvailable(keyword: testKeyword))
        
        testKeyword = ""
        XCTAssertFalse(keywordChecker.checkKeywordAvailable(keyword: testKeyword))
    }
}
