//
//  NavigationController.swift
//  opera_version_iOS
//
//  Created by yiliang fu on 22/01/2020.
//  Copyright © 2020 yiliang fu. All rights reserved.
//

import UIKit

class NavigationController: UIViewController {
    
  var url = URL(string: "")
    var stringURL = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "openLink"
        {
            let destination = segue.destination as! WebViewController
            destination.url = URL(string: stringURL)
        }
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
