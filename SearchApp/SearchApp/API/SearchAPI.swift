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
        
        // TODO: 추후에 값 발급받아 교체
        var value: String {
            switch self {
            case .id:
                return ""
            case .secret:
                return ""
            }
        }
    }
    
    let searchType: SearchType
    
    init(searchType: SearchType) {
        self.searchType = searchType
    }
    
    func requestSearchResult(startIndex: Int = 1) {
        guard let requestURL = URL(string: baseURL + searchType.rawValue) else { return }
        
        var urlRequest = URLRequest(url: requestURL)
        
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(ClientKey.id.value, forHTTPHeaderField: ClientKey.id.rawValue)
        urlRequest.addValue(ClientKey.secret.value, forHTTPHeaderField: ClientKey.secret.rawValue)
        
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            // 결과값 파싱
        }.resume()
    }
}
