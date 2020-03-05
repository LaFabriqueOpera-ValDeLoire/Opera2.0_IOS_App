//
//  WebViewController.swift
//  opera_version_iOS
//
//  Created by yiliang fu on 19/01/2020.
//  Copyright © 2020 yiliang fu. All rights reserved.
//

import UIKit
import WebKit

@available(iOS 13.0, *)
class BilletterieWebViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webview: WKWebView!
    
    let url1 = URL(string: "https://orchestre-inattendu.fr/test-1/")
 
    var stringChoice = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
        
        let urlreq1 = URLRequest(url: url1!)

        webview.load(urlreq1)

    }
    

    
    
    @IBAction func backtohomepage(_ sender: Any) {
        self.performSegue(withIdentifier: "backtohomepage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backtohomepage"
        {
            let dest = segue.destination as! homePageViewController
            dest.hero.modalAnimationType = .selectBy(presenting: .zoomSlide(direction: .right), dismissing: .zoomSlide(direction: .left))
        }
    }
    
    
    @IBAction func forward(_ sender: Any) {
                        if webview.canGoForward{
                            webview.goForward()
                        }
    }
    
    @IBAction func back(_ sender: Any) {
                if webview.canGoBack{
                            webview.goBack()
                       }
        }
}
