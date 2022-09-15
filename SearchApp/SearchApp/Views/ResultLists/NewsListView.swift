//
//  NewsListView.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/04.
//

import SwiftUI

struct NewsListView: View {
    @Binding var keyword: String
    @Binding var news: [News]
    
    var body: some View {
        List {
            ForEach(news, id: \.self) { result in
                NavigationLink {
                    // TODO: WebView 연결
                } label: {
                    NewsRow(news: result)
                }
            }
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(keyword: .constant("keyword"), news: .constant([]))
    }
}
