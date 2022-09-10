//
//  SearchAPI.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/07.
//

import Foundation

enum SearchType: String {
    case blog
    case news
    case image
}

class SearchAPI {
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
    
    init(searchType: SearchType) {
        self.searchType = searchType
    }
    
    func requestSearchResult(startIndex: Int = 1, keyword: String) {
        guard let urlRequest = self.createURLRequest(keyword: keyword) else { return }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            // 결과값 파싱            
        }.resume()
    }
    
    private func createURLRequest(startIndex: Int = 1, keyword: String) -> URLRequest? {
        var urlComponents = URLComponents(string: baseURL + searchType.rawValue)
        
        let query: URLQueryItem = URLQueryItem(name: "query", value: keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
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
