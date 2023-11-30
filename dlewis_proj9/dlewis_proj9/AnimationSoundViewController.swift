//
//  AnimationSoundViewController.swift
//  dlewis_proj9
//
//  Created by Derwin Alex-Lanier Lewis on 11/16/23.
//

import UIKit
import AVFoundation

class AnimationSoundViewController: UIViewController {
    @IBOutlet weak var myPictureView: UIImageView!
    var songPlayer: AVAudioPlayer! //for playing a song
    var myImages: [UIImage] = []  //an array to hold a stack of images
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...6 {
            myImages.append(UIImage(named: "p\(i)")!)
        }
        
        myPictureView.animationImages = myImages
        myPictureView.animationDuration = 1.0 // seconds per cylce
        myPictureView.image = myImages[1]
        
        //setting for music player....
        let song = Bundle.main.path(forResource: "BadDay", ofType: "mp3")
        let url = URL(fileURLWithPath: song!)
        do {
            songPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("error")
        }
    }
    
    @IBAction func playStopAction(_ sender: Any) {
        if myPictureView.isAnimating { //needs to stop the animation
            myPictureView.stopAnimating()
            songPlayer.stop() //stop playing song
            myPictureView.image = myImages[1]
        } else { //start the animation
            myPictureView.startAnimating()
            songPlayer.play()
        }
    }
}
