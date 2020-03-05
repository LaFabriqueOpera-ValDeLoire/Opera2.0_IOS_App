//
//  WelcomePageViewController.swift
//  opera_version_iOS
//
//  Created by yiliang fu on 28/01/2020.
//  Copyright © 2020 yiliang fu. All rights reserved.
//

import UIKit
import Hero

 
@available(iOS 13.0, *)
class WelcomePageViewController: UIViewController {

    @IBOutlet weak var welcomeimage: UIImageView!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
    }
    

    
    
    
        @IBAction func ToScanQr(_ sender: Any) {
            self.performSegue(withIdentifier: "toscanqr",sender:self)

        }
    
    
        @IBAction func tohomepage(_ sender: Any) {
            self.performSegue(withIdentifier: "tohomepage",sender:self)

        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "tohomepage"
        {
            
            let dest = segue.destination as! homePageViewController
            dest.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoom)
        }
    }
}
