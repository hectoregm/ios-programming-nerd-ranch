//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Hector Enrique Gomez Morales on 1/18/16.
//  Copyright © 2016 Hector Enrique Gomez Morales. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
  var webView: WKWebView!

  override func loadView() {
    webView = WKWebView()

    view = webView
    let url = NSURL(string: "https://www.bignerdranch.com")
    let req = NSURLRequest(URL: url!)
    self.webView.loadRequest(req)
  }
}