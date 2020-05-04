//
//  WebViewController.swift
//  Interview
//
//  Created by Yohann Melo on 2020-02-13.
//  Copyright © 2020 Yohann Melo. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        if let url = URL(string: "https://www.mocky.io/v2/5e334c2232000069df94d504") {
            let req = URLRequest(url: url)
            webView.load(req)
        }
    }

    @IBAction func okButtonPushed(_ sender: Any) {
        UserDefaults().acceptTermsAndConditions()
    }
}
