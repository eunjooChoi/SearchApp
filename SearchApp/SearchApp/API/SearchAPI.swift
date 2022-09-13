//
//  SearchAPI.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/07.
//

import Foundation
import SwiftUI

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}

class SearchAPI: ObservableObject {
    @Published var blogs: [Blog] = []
    @Published var news: [News] = []
    @Published var photos: [Photo] = []
    
    private let baseURL = "https://openapi.naver.com/v1/search/"
    
    private enum ClientKey: String {
        case id = "X-Naver-Client-Id"
        case secret = "X-Naver-Client-Secret"
        
        var value: String {
            switch self {
            case .id:
                return "e36FfMQKz631dqTfgjLG"
            case .secret:
                return "HIqyChuGFA"
            }
        }
    }
    
    let searchType: SearchType
    let session: URLSessionProtocol
    
    init(searchType: SearchType, session: URLSessionProtocol = URLSession.shared) {
        self.searchType = searchType
        self.session = session
    }
    
    func requestSearchResult(startIndex: Int, keyword: String) {
        guard let urlRequest = self.createURLRequest(keyword: keyword) else { return }
        
        session.dataTask(with: urlRequest) {data, response, error in
            // TODO: 에러 처리
            
            guard let data = data else { return }

            let decoder = JSONDecoder()
            
            DispatchQueue.main.async {
                switch self.searchType {
                case .blog:
                    if let result = try? decoder.decode(APIResult<Blog>.self, from: data) {
                        self.blogs.append(contentsOf: result.items)
                    }
                case .news:
                    if let result = try? decoder.decode(APIResult<News>.self, from: data) {
                        self.news.append(contentsOf: result.items)
                    }
                case .image:
                    if let result = try? decoder.decode(APIResult<Photo>.self, from: data) {
                        self.photos.append(contentsOf: result.items)
                    }
                }
            }
        }.resume()
    }
    
    private func createURLRequest(startIndex: Int = 1, keyword: String) -> URLRequest? {
        var urlComponents = URLComponents(string: baseURL + searchType.rawValue)
        
        let query: URLQueryItem = URLQueryItem(name: "query", value: keyword)
        let start: URLQueryItem = URLQueryItem(name: "start", value: String(startIndex))
        urlComponents?.queryItems = [query, start]
        
        guard let url = urlComponents?.url else { return nil }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(ClientKey.id.value, forHTTPHeaderField: ClientKey.id.rawValue)
        urlRequest.addValue(ClientKey.secret.value, forHTTPHeaderField: ClientKey.secret.rawValue)
        
        return urlRequest
    }
}
