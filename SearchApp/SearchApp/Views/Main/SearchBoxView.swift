//
//  SearchBoxView.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/04.
//

import SwiftUI

struct SearchBoxView: View {
    @State private var keyword: String = ""
    @State private var shouldShowResultView: Bool = false
    @State private var shouldShowAlert: Bool = false
    
    private let keywordChecker: SearchKeywordChecker = SearchKeywordChecker()
    
    var body: some View {
        HStack(spacing: 0) {
            TextField("Input Search Text", text: $keyword)
                .frame(height: 50)
                .padding(.leading, 10)
                .disableAutocorrection(true)        // 단어 자동수정 방지
                .submitLabel(.search)
                .onSubmit {
                    let isAvailable = keywordChecker.checkKeywordAvailable(keyword: keyword)
                    shouldShowResultView = isAvailable
                    shouldShowAlert = !shouldShowResultView
                }
            
            Button(action: {
                let isAvailable = keywordChecker.checkKeywordAvailable(keyword: keyword)
                shouldShowResultView = isAvailable
                shouldShowAlert = !shouldShowResultView
            }, label: {
                Label("Search", systemImage: "magnifyingglass")
                    .labelStyle(.iconOnly)
                    .imageScale(.medium)
                    .foregroundColor(.orange)
                    .padding()
            })
            
            NavigationLink("", isActive: $shouldShowResultView, destination: {
                ResultMainView(keyword: $keyword)
            })
        }
        .border(.orange, width: 2)
        .cornerRadius(3.0)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .alert("검색어를 입력하세요", isPresented: $shouldShowAlert, actions: {})
    }
}


struct SearchBoxView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBoxView()
    }
}
