//
//  LesCoulissesViewController.swift
//  opera_version_iOS
//
//  Created by yiliang fu on 30/01/2020.
//  Copyright © 2020 yiliang fu. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import WebKit
import Hero

@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
class LesCoulissesViewController: UIViewController {

    
    let urlcoulisses = URL(string: "https://orchestre-inattendu.fr/test-1/")
    var status = 0
    
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webview.alpha=0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backtohomepage(_ sender: Any) {
        if(status == 0){ self.performSegue(withIdentifier: "backtohomepage", sender: self)
        }
        
        if(status == 1)
        {
            webview.alpha=0
            status=0
        }
    }
    
    
    @IBAction func coulisses(_ sender: Any) {
        webview.alpha = 1
        let urlreqcoulisses = URLRequest(url:urlcoulisses!)
        webview.load(urlreqcoulisses)
        status = 1
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backtohomepage"
        {
            let dest = segue.destination as! homePageViewController
            dest.hero.modalAnimationType = .selectBy(presenting: .zoomSlide(direction: .right), dismissing: .zoomSlide(direction: .left))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
