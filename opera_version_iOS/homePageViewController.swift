//
//  HomePageViewController.swift
//  opera_version_iOS
//
//  Created by yiliang fu on 27/01/2020.
//  Copyright © 2020 yiliang fu. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class homePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    
    
    @IBAction func LaTechnique(_ sender: Any) {
        self.performSegue(withIdentifier: "tolatechnique", sender: self)
    }
    
    
    @IBAction func LaScene(_ sender: Any) {
        self.performSegue(withIdentifier: "tolascene", sender: self)
    }
    
    
    @IBAction func LaQuiz(_ sender: Any) {
        self.performSegue(withIdentifier: "toquiz", sender: self)
    }
    
    
    
    @IBAction func LesCoulissesL(_ sender: Any) {
        self.performSegue(withIdentifier: "tolescoulisses", sender: self)
    }
    
    
    @IBAction func Lorchestre(_ sender: Any) {
        self.performSegue(withIdentifier: "tolorchestre", sender: self)
    }
    
    
    @IBAction func LesProductions(_ sender: Any) {
        self.performSegue(withIdentifier: "tolavideo", sender: self)
    }
    
    
    
    @IBAction func backtowelcomepage(_ sender: Any) {
        self.performSegue(withIdentifier: "backtowelcomepage", sender: self)
        
    }
    
    
    
    
    
    @IBAction func tobillettrie(_ sender: Any) {
        self.performSegue(withIdentifier: "tobilletterie", sender: self)
//        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func toactualite(_ sender: Any) {
        self.performSegue(withIdentifier: "toactualite", sender: self)
//        self.dismiss(animated: true, completion: nil)
    }
    
    
    
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

if segue.identifier == "backtowelcomepage"
{
    let dest = segue.destination as! WelcomePageViewController
    dest.hero.modalAnimationType = .selectBy(presenting: .zoomSlide(direction: .right), dismissing: .zoomSlide(direction: .left))
}
    
    if segue.identifier == "tolavideo"
    {
        let dest = segue.destination as! LesProductionsViewController
        dest.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoom)
    }
    
    if segue.identifier == "tolorchestre"
    {
        let dest = segue.destination as! lorchestreViewController
        dest.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoom)
    }
    if segue.identifier == "tolescoulisses"
    {
        let dest = segue.destination as! LesCoulissesViewController
        dest.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoom)
    }
    if segue.identifier == "tolascene"
    {
        let dest = segue.destination as! LaSceneViewController
        dest.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoom)
    }
    
    if segue.identifier == "tolatechnique"
    {
        let dest = segue.destination as! LaTechniqueViewController
        dest.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoom)
    }
    
    if segue.identifier == "toquiz"
    {
        let dest = segue.destination as! QuizClassViewController
        dest.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoom)
    }
    
    if segue.identifier == "tobilletterie"
    {
        let dest = segue.destination as! BilletterieWebViewController
        dest.hero.modalAnimationType = .selectBy(presenting: .cover(direction: .up), dismissing: .zoom)
    }
    
    if segue.identifier == "toactualite"
    {
        let dest = segue.destination as! ActualiteViewController
        dest.hero.modalAnimationType = .selectBy(presenting: .cover(direction: .up), dismissing: .zoom)
    }
}
}
