//
//  NewsRow.swift
//  SearchApp
//
//  Created by 최은주 on 2022/08/31.
//

import SwiftUI

struct NewsRow: View {
    @Binding var keyword: String
    var news: News
    
    var body: some View {
        let highlightKeyword = HighlightKeyword(keyword: keyword)
        
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(highlightKeyword.highlighting(string: news.title))
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(highlightKeyword.highlighting(string: news.description))
                    .font(.system(size: 15.0))
                    .fontWeight(.light)
                    .lineLimit(2)
                
                Text(news.pubDate)
                    .fontWeight(.thin)
                    .lineLimit(1)
                    .font(.system(size: 13.0))
            }
            
            Spacer()
        }
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(keyword: .constant("검색어"), news: News(title: "title",
                                                      link: URL(string: "www.naver.com")!,
                           description: "description",
                           pubDate: "date"))
        .previewLayout(.fixed(width: 300, height: 100))
    }
}

