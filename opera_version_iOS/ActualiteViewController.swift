//
//  actualiteViewController.swift
//  opera_version_iOS
//
//  Created by yiliang fu on 27/01/2020.
//  Copyright © 2020 yiliang fu. All rights reserved.
//

import UIKit
import WebKit
@available(iOS 13.0, *)
class ActualiteViewController: UIViewController {

        @IBOutlet weak var webview: WKWebView!
        
       let url2 = URL(string: "https://orchestre-inattendu.fr/test-1/")
        
    //    @IBOutlet weak var backButton: UIButton!
    //
    //    @IBOutlet weak var forwardButton: UIButton!
        
    //    var url = URL(string: "https://orchestre-inattendu.fr/test-1/")
    //      var url = URL(string: "https://orchestre-inattendu.fr/test-2/")
    //      var url = URL(string: "https://orchestre-inattendu.fr/test-2/")
    //    var url = URL(string: "https://orchestre-inattendu.fr/test-2/")
        var stringChoice = String()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationController?.isNavigationBarHidden = false

            
            
            let urlreq2 = URLRequest(url: url2!)
            

            webview.load(urlreq2)
           
           
           
            
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
//            self.navigationController?.setNavigationBarHidden(false, animated: animated)
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
