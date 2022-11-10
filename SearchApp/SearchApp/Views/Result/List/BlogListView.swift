//
//  BlogListView.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/15.
//

import SwiftUI

struct BlogListView: View {
    @Binding var keyword: String
    @Binding var blogs: [Blog]
    @EnvironmentObject var searchAPI: SearchAPI
    
    var body: some View {
        List {
            ForEach(blogs, id: \.self) { result in
                NavigationLink {
                    SwiftUIWebView(url: result.link)
                } label: {
                    BlogRow(keyword: $keyword, blog: result)
                }
                .onAppear {
                    guard let index = blogs.firstIndex(where: {$0.title == result.title}) else { return }
                    
                    if index == blogs.count - 1 {
                        searchAPI.loadMoreContents()
                    }
                }
            }
        }
        .alert(searchAPI.errorMessage ?? "Error!", isPresented: $searchAPI.hasError, actions: {})
    }
}

struct BlogListView_Previews: PreviewProvider {
    static var previews: some View {
        BlogListView(keyword: .constant("keyword"), blogs: .constant([]))
            .environmentObject(SearchAPI())
    }
}
