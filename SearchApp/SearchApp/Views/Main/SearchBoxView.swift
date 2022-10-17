//
//  SearchBoxView.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/04.
//

import SwiftUI

struct SearchBoxView: View {
    @State private var keyword: String = ""
    @State private var isActiveResultView: Bool = false
    
    var body: some View {
        HStack(spacing: 0) {
            TextField("Input Search Text", text: $keyword)
                .frame(height: 50)
                .padding(.leading, 10)
                .disableAutocorrection(true)        // 단어 자동수정 방지
                .submitLabel(.search)
                .onSubmit {
                    isActiveResultView = true
                }
                
            Button(action: {
                // TODO: keyword 빈 값인지 확인 -> 알럿 노출
                isActiveResultView = true
            }, label: {
                Label("Search", systemImage: "magnifyingglass")
                    .labelStyle(.iconOnly)
                    .imageScale(.medium)
                    .foregroundColor(.orange)
                    .padding()
            })
            
            NavigationLink("", isActive: $isActiveResultView, destination: {
                ResultMainView(keyword: $keyword)
            })
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
