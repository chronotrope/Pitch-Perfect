//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Ruben Robles on 2/24/15.
//  Copyright (c) 2015 Integration Dojo. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    var audioPlayer: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        println("Finished playing the song")
        
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")
        {
            var filePathUrl = NSURL.fileURLWithPath(filePath)
            audioPlayer = AVAudioPlayer(contentsOfURL: filePathUrl, error: nil)
            audioPlayer.enableRate = true
            
            }
        else {
            println("The file path is empty.")
        }
        
        
        
        
        
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
        
        /**
        // code from techbus.safari.com ios 8 swift cookbook
        
        let mainBundle = NSBundle.mainBundle()
        let filePath = mainBundle.pathForResource("movie_quote", ofType:"mp3")
        let path = filePath
        let fileData = NSData(contentsOfFile: path!)
        var error:NSError?
        self.audioPlayer = AVAudioPlayer(data: fileData, error: &error)
        self.audioPlayer?.play() 
        */
        // code from Udacity.com below
        //good practice to stop audio player before you start it
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.play()
        println("Finished playing the song")
       
        
        
        
    }
}
