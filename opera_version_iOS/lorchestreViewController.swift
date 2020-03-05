//
//  LorchestreViewController.swift
//  opera_version_iOS
//
//  Created by yiliang fu on 23/01/2020.
//  Copyright © 2020 yiliang fu. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class lorchestreViewController: UIViewController {
    
    
    
    @IBOutlet weak var orchestreimage: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.orchestreimage.alpha = 0.0
        UIView.animate(withDuration: 5, delay: 0.2,  options: .curveEaseOut, animations: {
            self.orchestreimage.alpha = 1.0
        })
        
    }
    
    @IBAction func BackToWelcomePage(_ sender: Any) {

        self.performSegue(withIdentifier: "backtohomepage", sender: self)
        
    }
    
    @IBAction func toventbois(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toventbois", sender: self)
    }
    
    
    @IBAction func tocordes(_ sender: Any) {
        self.performSegue(withIdentifier: "tocordes", sender: self)
    }
    
    @IBAction func tocuivres(_ sender: Any) {
        self.performSegue(withIdentifier: "toventcuivres", sender: self)
    }
    
    
    @IBAction func toclaviers(_ sender: Any) {
        self.performSegue(withIdentifier: "toclaviers", sender: self)
    }
    
    
    @IBAction func topercussions(_ sender: Any) {
        self.performSegue(withIdentifier: "topercussions", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backtohomepage"
        {
            let dest = segue.destination as! homePageViewController
            dest.hero.modalAnimationType = .selectBy(presenting: .zoomSlide(direction: .right), dismissing: .zoomSlide(direction: .left))
        }
        
        if segue.identifier == "toventbois"
        {
            let dest = segue.destination as! ToventboisViewController
            dest.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoom)
        }
        
        if segue.identifier == "tocordes"
        {
            let dest = segue.destination as! cordesViewController
            dest.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoom)
        }
        
        if segue.identifier == "toventcuivres"
        {
            let dest = segue.destination as! ventcuivresViewController
            dest.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoom)
        }
        
        if segue.identifier == "toclaviers"
        {
            let dest = segue.destination as! claviersViewController
            dest.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoom)
            
        }
        
        if segue.identifier == "topercussions"
        {
            let dest = segue.destination as! percuissionsViewController
            dest.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoom)
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
