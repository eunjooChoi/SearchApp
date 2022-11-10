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
    @EnvironmentObject var searchAPI: SearchAPI
    
    var body: some View {
        List {
            ForEach(news, id: \.self) { result in
                NavigationLink {
                    SwiftUIWebView(url: result.link)
                } label: {
                    NewsRow(keyword: $keyword, news: result)
                }
                .onAppear {
                    guard let index = news.firstIndex(where: {$0.title == result.title}) else { return }
                    
                    if index == news.count - 1 {
                        searchAPI.loadMoreContents()
                    }
                }
            }
        }
        .alert(searchAPI.errorMessage ?? "Error!", isPresented: $searchAPI.hasError, actions: {})
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(keyword: .constant("keyword"), news: .constant([]))
            .environmentObject(SearchAPI())
    }
}
