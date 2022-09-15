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
    
    var body: some View {
        List {
            ForEach(blogs, id: \.self) { result in
                NavigationLink {
                    // TODO: WebView 연결
                } label: {
                    BlogRow(blog: result)
                }
            }
        }
    }
}

struct BlogListView_Previews: PreviewProvider {
    static var previews: some View {
        BlogListView(keyword: .constant("keyword"), blogs: .constant([]))
    }
}
