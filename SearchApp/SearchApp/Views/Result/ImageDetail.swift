//
//  ImageDetail.swift
//  SearchApp
//
//  Created by 최은주 on 2022/10/14.
//

import SwiftUI

struct ImageDetail: View {
    let photo: Photo?
    
    var body: some View {
        VStack {
            Text(photo?.title ?? "No Title")
                .font(.title)
                .fontWeight(.heavy)
                .padding()
            
            AsyncImage(url: URL(string: photo?.link ?? "")) { photo in
                switch photo {
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400)
                default:
                    Image(systemName: "photo.fill")
                }
            }
        }
        
    }
}

struct ImageDetail_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetail(photo: nil)
    }
}
