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
    @EnvironmentObject var searchAPI: SearchAPI
    
    private let layout = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: layout) {
                ForEach(photos, id: \.self) { result in
                    NavigationLink {
                        ImageDetail(photo: result)
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
        .alert(searchAPI.errorMessage ?? "Error", isPresented: $searchAPI.hasError, actions: {})
    }
}

struct ImageListView_Previews: PreviewProvider {
    static var previews: some View {
        ImageListView(keyword: .constant("keyword"), photos: .constant([]))
            .environmentObject(SearchAPI())
    }
}
