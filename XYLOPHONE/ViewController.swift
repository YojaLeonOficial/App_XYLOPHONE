//
//  ViewController.swift
//  XYLOPHONE
//
//  Created by Yojairo Jose Leon Escobar on 15/11/22.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Just One Button
    @IBAction func keyTapped(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
        
        
        //Reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.5
        
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
    }

    func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        
        do {
            // play the sound even the phone is on silent
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        /* shortfunc
         func playSound() {
         let url = Bundle.main.url(forResource: "C", withExtension: "wav")
         player = try! AVAudioPlayer(contentsOf: url!)
         player.play()
         }
         */
    }
}

