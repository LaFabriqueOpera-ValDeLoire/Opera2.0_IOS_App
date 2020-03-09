//
//  percuissionsViewController.swift
//  opera_version_iOS
//
//  Created by yiliang fu on 19/02/2020.
//  Copyright © 2020 yiliang fu. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import WebKit
import Hero
@available(iOS 13.0, *)
@available(iOS 13.0, *)
class percuissionsViewController: UIViewController {

    
    @IBOutlet weak var webview: WKWebView!
    var audioPlayer: AVAudioPlayer?
    var status = 0
    
    let urltimbale = URL(string: "https://fr.wikipedia.org/wiki/Timbales_(musique_classique)")
    
    let urlgrossecaisse = URL(string: "https://fr.wikipedia.org/wiki/Grosse_caisse")
    
    let urlxylophone = URL(string: "https://fr.wikipedia.org/wiki/Xylophone")
    
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
    
    
    @IBAction func son_timbale(_ sender: Any) {
        playSound(sound: "timbale", type: "mp3")
    }
    
    
    @IBAction func info_timbale(_ sender: Any) {
        webview.alpha = 1
        let urlreqtimbale = URLRequest(url: urltimbale!)
        webview.load(urlreqtimbale)
        status = 1
        
    }
    
    
    @IBAction func son_xylophone(_ sender: Any) {
        playSound(sound: "xylophone", type: "mp3")
    }
    
    
    @IBAction func info_xylophone(_ sender: Any) {
        webview.alpha = 1
        let urlreqxylophone = URLRequest(url: urlxylophone!)
        webview.load(urlreqxylophone)
        
        status = 1
    }
    
    
    @IBAction func son_grossecaisse(_ sender: Any) {
        playSound(sound: "grosse_caisse", type: "mp3")
        
    }
    
    @IBAction func info_grossecaisse(_ sender: Any) {
        webview.alpha = 1
        let urlreqgrossecaisse = URLRequest(url: urlgrossecaisse!)
        webview.load(urlreqgrossecaisse)
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
