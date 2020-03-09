//
//  PageDaccueillirViewController.swift
//  opera_version_iOS
//
//  Created by yiliang fu on 23/01/2020.
//  Copyright © 2020 yiliang fu. All rights reserved.
//

import UIKit
import Hero

class PageDaccueillirViewController: UIViewController {

    var stringNum = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

                if segue.identifier == "billetterieWebViewController"
                {
                    let destination = segue.destination as! billetterieWebViewController
                    destination.stringChoice = stringNum
                }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destination.
         Pass the selected object to the new view controller.
    }
    */

}
