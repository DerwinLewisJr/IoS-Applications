//
//  InstagramViewController.swift
//  dlewis_SMC
//
//  Created by Derwin Alex-Lanier Lewis on 11/7/23.
//

import UIKit
import WebKit

class InstagramViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        myWebView.allowsBackForwardNavigationGestures = true
        myWebView.uiDelegate = self
        
        let myURL = URL(string: "https://www.instagram.com")
        let myRequest = URLRequest(url: myURL!)
        myWebView.load(myRequest)
        
    }
    

}
