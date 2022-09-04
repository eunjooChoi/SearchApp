//
//  SearchBoxView.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/04.
//

import SwiftUI

struct SearchBoxView: View {
    @State private var keyword: String = ""
    
    var body: some View {
        HStack(spacing: 0) {
            //TODO: Enter - 검색 API 조회
            TextField("Input Search Text", text: $keyword)
                .frame(height: 50)
                .padding(.leading, 10)
            
            Button {
                //TODO: 검색 API 조회
            } label: {
                NavigationLink(destination: ResultListView(keyword: $keyword)) {
                    Label("Search", systemImage: "magnifyingglass")
                        .labelStyle(.iconOnly)
                        .imageScale(.medium)
                        .foregroundColor(.orange)
                        .padding()
                }
            }
        }
        .border(.orange, width: 2)
        .cornerRadius(3.0)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}

struct SearchBoxView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBoxView()
    }
}
