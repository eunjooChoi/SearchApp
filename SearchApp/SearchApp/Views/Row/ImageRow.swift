//
//  ImageRow.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/17.
//

import SwiftUI

struct ImageRow: View {
    @Binding var keyword: String
    let photo: Photo
    
    var body: some View {
        let highlightKeyword = HighlightKeyword(keyword: keyword)
        
        VStack {
            AsyncImage(url: URL(string: photo.thumbnail)) { photo in
                photo.image != nil ? photo.image : Image(systemName: "photo.fill")
            }
            .frame(width: 150, height: 150, alignment: .center)
            .cornerRadius(10)
            
            Text(highlightKeyword.highlighting(string: photo.title))
                .fontWeight(.thin)
                .lineLimit(2)
                .font(.system(size: 15.0))
                .foregroundColor(.black)
        }
        .padding()
    }
}

struct ImageRow_Previews: PreviewProvider {
    static var previews: some View {
        let photo = Photo(title: "title",
                          link: "link",
                          thumbnail: "thumbnail",
                          sizewidth: "size",
                          sizeheight: "size")
        
        ImageRow(keyword: .constant("검색어"), photo: photo)
    }
}
