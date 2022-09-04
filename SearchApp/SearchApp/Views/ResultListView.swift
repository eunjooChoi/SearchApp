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
        NavigationView {
            List {
                ArticleView()
                ArticleView()
            }
            .listStyle(.inset)
            .navigationTitle(keyword)
        }
    }
}

struct ResultListView_Previews: PreviewProvider {
    static var previews: some View {
        ResultListView(keyword: .constant("keyword"))
    }
}
