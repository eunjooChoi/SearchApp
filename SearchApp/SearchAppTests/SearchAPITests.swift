//
//  SearchAPITests.swift
//  SearchAppTests
//
//  Created by 최은주 on 2022/08/31.
//

import XCTest
@testable import SearchApp

class SearchAPITests: XCTestCase {
    var mockSession: URLSessionSpy!
    var sut: SearchAPI!
    
    override func setUpWithError() throws {
        mockSession = URLSessionSpy()
    }
    
    func test_search_blog_success() {
        sut = SearchAPI.init(searchType: .blog, session: mockSession)
        sut.requestSearchResult(startIndex: 1, keyword: "여행")
        XCTAssertNotNil(sut.blogs)
    }
    
    func test_search_news_success() {
        sut = SearchAPI.init(searchType: .news, session: mockSession)
        sut.requestSearchResult(startIndex: 1, keyword: "여행")
        XCTAssertNotNil(sut.news)
    }
    
    func test_search_image_success() {
        sut = SearchAPI.init(searchType: .image, session: mockSession)
        sut.requestSearchResult(startIndex: 1, keyword: "여행")
        XCTAssertNotNil(sut.photos)
    }
}
