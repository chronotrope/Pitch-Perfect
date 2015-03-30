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
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
                audioPlayer.enableRate = true
        
        //Create AVAudioEngine object to play with variable rate function (chipmunk and Darth Vader).
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func playWithRate(rate: Float){
        //This function optimizes the playSlow* playFast* functions by combining repeated blocks of code into one function.
        audioEngineStopReset()
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
        
        
        
    }
   

    @IBAction func playSlowAudio(sender: UIButton) {
        audioEngineStopReset()
        playWithRate(0.5)
    }
    
    @IBAction func playFastAudio(sender: UIButton) {
        
        playWithRate(2.0)
        
    }

    @IBAction func stopAudioPlayer(sender: UIButton) {
        audioEngineStopReset()
        println("I stopped audio player")
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    func audioEngineStopReset(){
        //Stops/resets audio engine and audio player.
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer.stop()
    }
    
    func playAudioWithVariablePitch(pitch: Float){
       // Setting up objects/variables for playing back with variable pitch.
        audioEngineStopReset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        // Attach AVAudioUnitTimePitch to AVAuioEngine
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        // Connect AVAudioUnitTimePitch to output (speaker).
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        //Play Sound
        audioPlayerNode.play()
    }
    
    @IBAction func playDarthvaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
}
