//
//  WebViewController.swift
//  SearchApp
//
//  Created by 최은주 on 2022/10/13.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var webview: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func load(url: URL) {
        let request = URLRequest(url: url)
        self.webview?.load(request)
    }
    
    @IBAction func didSelectBack(_ sender: Any) {
        guard self.webview?.canGoBack == true else { return }
        self.webview?.goBack()
    }
    
    @IBAction func didSelectForward(_ sender: Any) {
        guard self.webview?.canGoForward == true else { return }
        self.webview?.goForward()
    }
    
    @IBAction func didSelectRefresh(_ sender: Any) {
        self.webview?.reload()
    }
}
