//
//  ImageListView.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/17.
//

import SwiftUI

struct ImageListView: View {
    @Binding var keyword: String
    @Binding var photos: [Photo]
    let searchAPI: SearchAPI
    
    private let layout = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: layout) {
                ForEach(photos, id: \.self) { result in
                    NavigationLink {
                        // TODO: 이미지 크게 보기 _ 제목 노출
                    } label: {
                        ImageRow(keyword: $keyword, photo: result)
                    }
                    .onAppear {
                        guard let index = photos.firstIndex(where: {$0.title == result.title}) else { return }
                        
                        if index == photos.count - 1 {
                            searchAPI.loadMoreContents()
                        }
                    }
                }
            }
        }
    }
}

struct ImageListView_Previews: PreviewProvider {
    static var previews: some View {
        ImageListView(keyword: .constant("keyword"), photos: .constant([]), searchAPI: SearchAPI())
    }
}
