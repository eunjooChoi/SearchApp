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
    let searchAPI: SearchAPI
    
    var body: some View {
        List {
            ForEach(blogs, id: \.self) { result in
                NavigationLink {
                    // TODO: WebView 연결
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
    }
}

struct BlogListView_Previews: PreviewProvider {
    static var previews: some View {
        BlogListView(keyword: .constant("keyword"), blogs: .constant([]), searchAPI: SearchAPI())
    }
}
