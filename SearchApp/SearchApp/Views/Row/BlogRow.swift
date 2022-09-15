//
//  BlogRow.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/12.
//

import SwiftUI

struct BlogRow: View {
    var blog: Blog
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(blog.title)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(blog.description)
                    .font(.system(size: 15.0))
                    .fontWeight(.light)
                    .lineLimit(2)
                
                HStack {
                    Text(blog.bloggername)
                        .fontWeight(.thin)
                        .lineLimit(1)
                        .font(.system(size: 13.0))
                    
                    Divider()
                        .frame(width: 1, height: 10, alignment: .center)
                    
                    Text(blog.postdate)
                        .fontWeight(.thin)
                        .lineLimit(1)
                        .font(.system(size: 13.0))
                }
                
            }
            
            Spacer()
        }
    }
}

struct BlogRow_Previews: PreviewProvider {
    static var previews: some View {
        let blog = Blog(title: "title",
                        link: "link",
                        description: "description",
                        bloggername: "name",
                        bloggerlink: "link",
                        postdate: "date")
        
        BlogRow(blog: blog)
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
