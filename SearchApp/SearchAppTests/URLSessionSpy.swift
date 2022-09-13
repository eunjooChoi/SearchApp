//
//  URLSessionSpy.swift
//  SearchAppTests
//
//  Created by 최은주 on 2022/09/13.
//

import Foundation
@testable import SearchApp

class URLSessionSpy: URLSessionProtocol {
    var shouldRequestSuccess: Bool
    var searchType: SearchType
    var sessionDataTask: URLSessionDataTaskSpy?

    init(shouldRequestSuccess: Bool = true, searchType: SearchType = .blog) {
        self.shouldRequestSuccess = shouldRequestSuccess
        self.searchType = searchType
    }

    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {

        let sucessResponse = HTTPURLResponse(url: request.url!,
                                             statusCode: 200,
                                             httpVersion: "2",
                                             headerFields: nil)
        let failureResponse = HTTPURLResponse(url: request.url!,
                                              statusCode: 402,
                                              httpVersion: "2",
                                              headerFields: nil)

        let sessionDataTask = URLSessionDataTaskSpy()

        if shouldRequestSuccess {
            let data = load("\(searchType.rawValue).json")
            
            sessionDataTask.resumeDidCall = {
                completionHandler(data, sucessResponse, nil)
            }
        } else {
            sessionDataTask.resumeDidCall = {
                completionHandler(nil, failureResponse, nil)
            }
        }
        self.sessionDataTask = sessionDataTask
        return sessionDataTask
    }
    
    private func load(_ filename: String) -> Data? {
        let data: Data
        
        guard let file = Bundle(for: type(of: self)).url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
            return data
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
    }
}

