//
//  ResultListView.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/04.
//

import SwiftUI

struct ResultListView: View {
    @Binding var keyword: String
    
    var body: some View {
        TabView {
            List {
                ArticleView()
            }
            .tabItem {
                Label("Blog", systemImage: "book.circle")
            }
            
            List {
                ArticleView()
            }
            .tabItem {
                Label("News", systemImage: "newspaper.circle")
            }
            
            List {
                ArticleView()
            }
            .tabItem {
                Label("Image", systemImage: "photo.circle")
            }
        }
        .listStyle(.inset)
        .navigationTitle(keyword)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ResultListView_Previews: PreviewProvider {
    static var previews: some View {
        ResultListView(keyword: .constant("keyword"))
    }
}
