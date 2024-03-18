//
//  ViewController.swift
//  Project4
//
//  Created by Omar Makran on 3/17/24.
//  Copyright © 2024 Omar Makran. All rights reserved.
//

import UIKit

// WebKit is the framework used for web browsing capabilities. and APIs for web rendering and interaction.
import WebKit

// navigationDelegate is a Protocol. it will handle navigation events for the WKWebView.
class ViewController: UIViewController, WKNavigationDelegate {
    
    // used to display web content in the app.
    var webView: WKWebView!
    
    // is called when the view controller's view is requested but not yet loaded.
    override func loadView() {
        // a new instance of the WKWebView.
        webView = WKWebView()
        // assigns self (the ViewController instance) as its navigation delegate.
        webView.navigationDelegate = self
        view = webView
    }
    
    // is called after the view controller's view has been loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        // creates a URL object.
        let url = URL(string: "https://www.1337.ma/")!
        // creates a new URLRequest.
        // webView.load(...): This method of WKWebView is used to load the content specified by the provided URLRequest.
        webView.load(URLRequest(url: url))
        // enables back and forward navigation gestures in the 'webView'.
        webView.allowsBackForwardNavigationGestures = true
        
    }
    
    @objc func  openTapped() {
        let ac = UIAlertController(title: "Open Page...", message: nil, preferredStyle: .actionSheet)
        
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        // presentation controller to be displayed on iPad.
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction) {
        guard let actionTitle = action.title else {
            return
        }
        guard let url = URL(string: "https://" + actionTitle) else {
            return
        }
        webView.load(URLRequest(url: url))
    }
    
    // to display the Title on the Top the screen.
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }


}

