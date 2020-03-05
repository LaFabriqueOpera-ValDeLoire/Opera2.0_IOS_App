//
//  ventcuivresViewController.swift
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
class ventcuivresViewController: UIViewController {

    
    var audioPlayer: AVAudioPlayer?
    var status = 0
    @IBOutlet weak var webview: WKWebView!
    let urlcors = URL(string: "https://fr.wikipedia.org/wiki/Cor_(musique)")
    let urltrompette = URL(string: "https://fr.wikipedia.org/wiki/Trompette")
    let urltuba = URL(string:"https://fr.wikipedia.org/wiki/Tuba_(instrument)")
    let urltrombone = URL(string: "https://fr.wikipedia.org/wiki/Trombone_(instrument)")
    
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
    
    @IBAction func son_cors(_ sender: Any) {
        playSound(sound: "cors", type: "mp3")
    }
    
    @IBAction func info_cors(_ sender: Any) {
        webview.alpha = 1
        let urlreqcors = URLRequest(url: urlcors!)
        webview.load(urlreqcors)
        
        
        status = 1
        
    }
    
    @IBAction func son_trompette(_ sender: Any) {
        playSound(sound: "trompette", type: "mp3")
    }
    
    @IBAction func info_trompette(_ sender: Any) {
        
        webview.alpha = 1
        let urlreqtrompette = URLRequest(url: urltrompette!)
        webview.load(urlreqtrompette)
        
        status = 1
    }
    
    @IBAction func son_tuba(_ sender: Any) {
    playSound(sound: "tuba", type: "mp3")
    }
    
    @IBAction func info_tuba(_ sender: Any) {
        webview.alpha = 1
        let urlreqtuba = URLRequest(url: urltuba!)
        webview.load(urlreqtuba)
        status = 1
        
    }
    
    @IBAction func son_trombone(_ sender: Any) {
        playSound(sound: "trombone", type: "mp3")
    }
    
    
    @IBAction func info_trombone(_ sender: Any) {
        webview.alpha = 1
        let urlreqtrombone = URLRequest(url: urltrompette!)
        webview.load(urlreqtrombone)
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
