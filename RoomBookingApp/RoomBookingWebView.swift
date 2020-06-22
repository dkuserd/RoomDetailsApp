//
//  RoomBookingWebView.swift
//  RoomBookingApp
//
//  Created by Dadha Kumar on 22/6/20.
//  Copyright © 2020 Dadha Kumar. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class RoomBookingWebView: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var loadUrlFromQR: String?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
//        let request = URLRequest(url:URL(string: loadUrlFromQR ?? "")!)
//        webView.load(request)
        loadUrl(urlWeb: loadUrlFromQR ?? "")
    }
    
    func loadUrl(urlWeb: String = "") {
        if let urlStr = URL(string: urlWeb) {
            let urlRequest = URLRequest(url: urlStr)
            webView.load(urlRequest)
        }
    }
}
