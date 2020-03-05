//
//  ToventboisViewController.swift
//  opera_version_iOS
//
//  Created by yiliang fu on 17/02/2020.
//  Copyright © 2020 yiliang fu. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import WebKit
@available(iOS 13.0, *)
@available(iOS 13.0, *)
class ToventboisViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?
    let urlflute = URL(string: "https://fr.wikipedia.org/wiki/Fl%C3%BBte")
    let urlclarinette = URL(string: "https://fr.wikipedia.org/wiki/Clarinette")
   let urlhautbois = URL(string: "https://fr.wikipedia.org/wiki/Hautbois")
    let urlbasson = URL(string: "https://fr.wikipedia.org/wiki/Basson")
    var status = 0
    
    @IBOutlet weak var webview: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webview.alpha = 0
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
    
    
    
    @IBAction func son_flute(_ sender: Any) {
        playSound(sound: "flute", type: "mp3")
    }
    
  
    @IBAction func info_flute(_ sender: Any) {
        
        webview.alpha = 1
        let urlreqflute = URLRequest(url: urlflute!)
        webview.load(urlreqflute)
        status = 1
        
    }
    
    @IBAction func son_hautbois(_ sender: Any) {
        playSound(sound: "hautbois", type: "mp3")
    }
    
   
    @IBAction func info_hautbois(_ sender: Any) {
        webview.alpha = 1
        let urlreqhautbois = URLRequest(url: urlhautbois!)
        webview.load(urlreqhautbois)
        status = 1
        
    }
    
    @IBAction func son_bassons(_ sender: Any) {
        playSound(sound: "basson", type: "mp3")
    }
    
    @IBAction func info_bassons(_ sender: Any) {
        webview.alpha = 1
        let urlreqbassons = URLRequest(url: urlbasson!)
        webview.load(urlreqbassons)
        status = 1
    }
    
  
    @IBAction func son_clarinette(_ sender: Any) {
        playSound(sound: "clarinette", type: "mp3")
    }
    
    @IBAction func info_clarinette(_ sender: Any) {
        webview.alpha = 1
        let urlreqclarinette = URLRequest(url: urlclarinette!)
        webview.load(urlreqclarinette)
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
