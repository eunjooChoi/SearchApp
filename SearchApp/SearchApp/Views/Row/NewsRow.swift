//
//  NewsRow.swift
//  SearchApp
//
//  Created by 최은주 on 2022/08/31.
//

import SwiftUI

struct NewsRow: View {
    var news: News
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(news.title)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(news.description)
                    .font(.system(size: 15.0))
                    .fontWeight(.light)
                    .lineLimit(2)
                
                Text(news.pubDate)
                    .fontWeight(.thin)
                    .lineLimit(1)
                    .font(.system(size: 13.0))
            }
            
            Spacer()
        }
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(news: News(title: "title",
                            link: "link",
                            description: "description",
                            pubDate: "date"))
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
