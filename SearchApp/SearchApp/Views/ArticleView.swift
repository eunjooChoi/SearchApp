//
//  ArticleView.swift
//  SearchApp
//
//  Created by 최은주 on 2022/08/31.
//

import SwiftUI

struct ArticleView: View {
    var body: some View {
        HStack {
            Image(systemName: "photo.on.rectangle.angled")
                .foregroundColor(.gray)
                .frame(width: 70, height: 70)
                .cornerRadius(15.0)
            
            VStack(alignment: .leading) {
                Text("Title")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("This is article text view. Line limit is 2. This is article text view. Line limit is 2.")
                    .font(.system(size: 14.0))
                    .fontWeight(.light)
                    .lineLimit(2)
                
                HStack {
                    //TODO: 데이터가 뉴스인 경우는 blog name과 divider가 나오지 않도록 수정
                    Text("Blog Name")
                        .fontWeight(.thin)
                        .lineLimit(1)
                    
                    Divider().frame(width: 1, height: 10, alignment: .leading)
                    
                    Text("Date")
                        .fontWeight(.thin)
                }.font(.system(size: 11.0))
            }
            
            Spacer()
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
