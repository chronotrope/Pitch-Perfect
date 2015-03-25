//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Ruben Robles on 3/23/15.
//  Copyright (c) 2015 Integration Dojo. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    var audioPlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!

    


        

    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
        
        
//        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")
//        {
//            var filePathUrl = NSURL.fileURLWithPath(filePath)
//            
//        }
//        else {
//            println("The file path is empty.")
//        }
        
       
            
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
                audioPlayer.enableRate = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

    @IBAction func playSlowAudio(sender: UIButton) {
        // Play audio sloooowly here...
        
        
        // code from Udacity.com below
        //good practice to stop audio player before you start it
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
        println("Finished playing slow audio")
    }
    
    @IBAction func playFastAudio(sender: UIButton) {
        // Play fast audio here...
        
        
        // code from Udacity.com below
        //good practice to stop audio player before you start it
        audioPlayer.stop()
        audioPlayer.rate = 2.0
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
        println("Finished playing slow audio")
        
    }

    @IBAction func stopAudioPlayer(sender: UIButton) {
        audioPlayer.stop()
        println("I stopped audio player")
    }
}
