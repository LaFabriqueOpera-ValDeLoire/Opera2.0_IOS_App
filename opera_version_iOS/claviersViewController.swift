//
//  claviersViewController.swift
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
class claviersViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    var status = 0
    
    let urlcelesta = URL(string: "https://fr.wikipedia.org/wiki/C%C3%A9lesta")
    let urlpiano = URL(string: "https://fr.wikipedia.org/wiki/Piano")
    
  
    
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
    
    @IBAction func son_celesta(_ sender: Any) {
        
        playSound(sound: "celesta", type: "mp3")
    }
    
    @IBAction func info_celesta(_ sender: Any) {
        webview.alpha = 1
        let urlreqcelesta = URLRequest(url: urlcelesta!)
        webview.load(urlreqcelesta)
        status = 1
    }
    
    @IBAction func son_piano(_ sender: Any) {
        playSound(sound: "piano", type: "mp3")
    }
    
    @IBAction func info_piano(_ sender: Any) {
        webview.alpha = 1
        let urlreqpiano = URLRequest(url:urlpiano!)
        webview.load(urlreqpiano)
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
