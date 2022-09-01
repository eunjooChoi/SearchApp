//
//  SearchMainView.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/01.
//

import SwiftUI

struct SearchMainView: View {
    @State private var keyword: String = ""
    
    var body: some View {
        VStack {
            Text("Search Everything")
                .foregroundColor(.orange)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            HStack(spacing: 0) {
                //TODO: Enter - 검색 API 조회
                TextField("Input Search Text", text: $keyword)
                    .frame(height: 50)
                    .padding(.leading, 10)
                
                Button {
                    //TODO: 검색 API 조회
                } label: {
                    Label("Search", systemImage: "magnifyingglass")
                        .labelStyle(.iconOnly)
                        .imageScale(.medium)
                        .foregroundColor(.orange)
                        .padding()
                }
            }
            .border(.orange, width: 2)
            .cornerRadius(3.0)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMainView()
    }
}
