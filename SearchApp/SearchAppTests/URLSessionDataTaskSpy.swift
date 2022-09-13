//
//  URLSessionDataTaskSpy.swift
//  SearchAppTests
//
//  Created by 최은주 on 2022/09/13.
//

import Foundation

class URLSessionDataTaskSpy: URLSessionDataTask {
    var resumeDidCall: () -> Void = {}

    override func resume() {
        resumeDidCall()
    }
}
