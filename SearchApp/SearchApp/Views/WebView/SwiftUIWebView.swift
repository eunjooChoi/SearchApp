//
//  SwiftUIWebView.swift
//  SearchApp
//
//  Created by 최은주 on 2022/10/06.
//

import SwiftUI
import WebKit
 
struct SwiftUIWebView: UIViewControllerRepresentable {
    var url: URL
    
    func makeUIViewController(context: Context) -> WebViewController {
        return WebViewController()
    }
    
    func updateUIViewController(_ uiViewController: WebViewController, context: Context) {
        uiViewController.load(url: url)
    }
}
