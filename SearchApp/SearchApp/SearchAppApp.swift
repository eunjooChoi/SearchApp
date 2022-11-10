//
//  SearchAppApp.swift
//  SearchApp
//
//  Created by 최은주 on 2022/08/31.
//

import SwiftUI

@main
struct SearchAppApp: App {
    @StateObject private var searchAPI = SearchAPI()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(searchAPI)
        }
    }
}
