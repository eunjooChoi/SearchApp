//
//  ResultMainView.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/15.
//

import SwiftUI

struct ResultMainView: View {
    @Binding var keyword: String
    @State var tabSelection: SearchType = .blog
    @StateObject private var searchAPI = SearchAPI()
    
    var body: some View {
        TabView(selection: $tabSelection) {
            BlogListView(keyword: $keyword, blogs: $searchAPI.blogs)
                .tabItem {
                    Label("Blog", systemImage: "book.circle")
                }
                .tag(SearchType.blog)
            
            NewsListView(keyword: $keyword, news: $searchAPI.news)
                .tabItem {
                    Label("News", systemImage: "newspaper.circle")
                }
                .tag(SearchType.news)
            
            List {
            }
            .tabItem {
                Label("Image", systemImage: "photo.circle")
            }
            .tag(SearchType.image)
        }
        .listStyle(.inset)
        .navigationTitle(keyword)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            searchAPI.requestSearchResult(keyword: keyword)
        }
        .onChange(of: tabSelection) { newValue in
            searchAPI.searchType = newValue
            searchAPI.requestSearchResult(keyword: keyword)
        }
    }
}

struct ResultMainView_Previews: PreviewProvider {
    static var previews: some View {
        ResultMainView(keyword: .constant("keyword"))
    }
}
