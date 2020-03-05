//
//  cordesViewController.swift
//  opera_version_iOS
//
//  Created by yiliang fu on 19/02/2020.
//  Copyright © 2020 yiliang fu. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import WebKit
@available(iOS 13.0, *)
@available(iOS 13.0, *)
class cordesViewController: UIViewController {

    
    var audioPlayer: AVAudioPlayer?
    var status = 0
    
    let urlviolon = URL(string: "https://fr.wikipedia.org/wiki/Violon")
    let urlalto = URL(string: "https://fr.wikipedia.org/wiki/Alto_(instrument_%C3%A0_cordes)")
    let urlharp = URL(string: "https://fr.wikipedia.org/wiki/Harpe")
    let urlvioloncelle = URL(string: "https://fr.wikipedia.org/wiki/Violoncelle")
    let urlcontrebasse = URL(string: "https://fr.wikipedia.org/wiki/Contrebasse")
    
    
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webview.alpha = 0
        // Do any additional setup after loading the view.
    }
    func playSound(sound: String, type: String)
    {
        if let path = Bundle.main.path(forResource: sound, ofType: type)
        {
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Could not find and play the sound file.")
            }
        }
    }

    @IBAction func backtolorchestre(_ sender: Any) {
        
        if(status == 0){ self.performSegue(withIdentifier: "backtolorchestre", sender: self)
            
        }
        
        if(status == 1)
        {
            webview.alpha=0
            status=0
        }
        
    }
    
    @IBAction func son_violon(_ sender: Any) {
        playSound(sound: "violon", type: "mp3")
    }
    
    @IBAction func info_violon(_ sender: Any) {
        webview.alpha = 1
        let urlreqviolon = URLRequest(url: urlviolon!)
        webview.load(urlreqviolon)
        status = 1
        
    }
    @IBAction func son_alto(_ sender: Any) {
        playSound(sound: "alto", type: "mp3")
    }
    
    @IBAction func info_alto(_ sender: Any) {
        
        webview.alpha = 1
        let urlreqalto = URLRequest(url:urlalto!)
        webview.load(urlreqalto)
        status = 1
    }
    
    @IBAction func son_harp(_ sender: Any) {
        playSound(sound: "harpe", type: "mp3")
    }
    
    @IBAction func info_harp(_ sender: Any) {
        webview.alpha = 1
        let urlreqharp = URLRequest(url: urlharp!)
        webview.load(urlreqharp)
        status = 1
        
    }
    
    @IBAction func son_violoncelle(_ sender: Any) {
        playSound(sound: "violoncelle", type: "mp3")
    }
    
    @IBAction func info_violoncelle(_ sender: Any) {
        webview.alpha = 1
        let urlreqvioloncelle = URLRequest(url:urlvioloncelle!)
        webview.load(urlreqvioloncelle)
        status = 1
        
    }
    
    @IBAction func son_contrebasse(_ sender: Any) {
        playSound(sound: "contrebasse", type: "mp3")
    }
    
    
    @IBAction func info_contrebasse(_ sender: Any) {
        webview.alpha = 1
        let urlreqcontrebasse = URLRequest(url:urlcontrebasse!)
        webview.load(urlreqcontrebasse)
        status = 1
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backtolorchestre"
        {
            
        let dest = segue.destination as! lorchestreViewController
            
        dest.hero.modalAnimationType = .selectBy(presenting: .zoomSlide(direction: .right), dismissing: .zoomSlide(direction: .left))
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
