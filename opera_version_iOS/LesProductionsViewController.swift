//
//  LesProductionsViewController.swift
//  opera_version_iOS
//
//  Created by yiliang fu on 30/01/2020.
//  Copyright © 2020 yiliang fu. All rights reserved.
//

import UIKit
import WebKit
@available(iOS 13.0, *)
class LesProductionsViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    
   var status = 0
    
    let urlCarmen = URL(string: "https://youtu.be/-DU4yQDcbtQ")
    
    let urlFlute = URL(string: "https://youtu.be/hjZKhwpWMaE")
    
    let urlAida = URL(string: "https://youtu.be/30mDGj5BfIk")
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webview.alpha = 0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backtohomepage(_ sender: Any) {
        
        if(status == 0)
        {
        self.performSegue(withIdentifier: "backtohomepage", sender: self)
        }
        
        if(status == 1)
        {
            webview.alpha = 0
            status = 0
        }
    }
    
    
    @IBAction func tocarmen(_ sender: Any) {
        
        webview.alpha = 1
        let urlreqCarmen = URLRequest(url: urlCarmen!)
        webview.load(urlreqCarmen)
        status = 1
        
    }
    
    
    @IBAction func toflute(_ sender: Any) {
        
        webview.alpha = 1
        let urlreqFlute = URLRequest(url: urlFlute!)
        webview.load(urlreqFlute)
        status = 1
        
    }
    
    @IBAction func toaida(_ sender: Any) {
        
        webview.alpha = 1
        let urlreqAida = URLRequest(url: urlAida!)
        webview.load(urlreqAida)
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
