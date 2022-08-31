//
//  ContentView.swift
//  SearchApp
//
//  Created by 최은주 on 2022/08/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ArticleView()
            ArticleView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
