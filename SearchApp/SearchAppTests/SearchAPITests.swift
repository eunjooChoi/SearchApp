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
        mockSession = URLSessionSpy(searchType: .blog)
    }
    
    func test_search_blog_success() {
        sut = SearchAPI(session: mockSession)
        sut.requestSearchResult(keyword: "여행")
        
        let expectationAPI = expectation(description: "APIDone")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            XCTAssertTrue(self.sut.blogs.count != 0)
            
            expectationAPI.fulfill()
        })
        
        wait(for: [expectationAPI], timeout: 2.0)
        
        sut.loadMoreContents()
        
        let loadMoreExpectation = expectation(description: "LoadMoreContentsDone")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            XCTAssertTrue(self.sut.blogs.count > 10)        // loadMoreContent를 호출하는 경우 기존 blogs에 데이터가 추가되므로 10개 이상의 결과 값이 들어가야 한다.
            
            loadMoreExpectation.fulfill()
        })
        
        wait(for: [loadMoreExpectation], timeout: 2.0)
    }
    
    func test_search_news_success() {
        mockSession = URLSessionSpy(searchType: .news)
        sut = SearchAPI(session: mockSession)
        sut.searchType = .news
        sut.requestSearchResult(keyword: "여행")
        
        let expectation = expectation(description: "APIDone")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            XCTAssertTrue(self.sut.news.count != 0)
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func test_search_image_success() {
        mockSession = URLSessionSpy(searchType: .image)
        sut = SearchAPI(session: mockSession)
        sut.searchType = .image
        sut.requestSearchResult(keyword: "여행")
        
        let expectation = expectation(description: "APIDone")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            XCTAssertTrue(self.sut.photos.count != 0)
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 2.0)
    }
}
