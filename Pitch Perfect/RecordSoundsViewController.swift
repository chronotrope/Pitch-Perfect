//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Ruben Robles on 2/8/15.
//  Copyright (c) 2015 Integration Dojo. All rights reserved.
//

import UIKit
import AVFoundation


class RecordSoundsViewController: UIViewController {

  
   
    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!
  
    @IBOutlet weak var recordButton: UIButton!
    
   
    
    
    //Declared Globally
    
    //var audioRecorder:AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        //Hide the stop button
        stopButton.hidden = true
        recordButton.enabled = true
    }
    
    
    @IBAction func recordAudio(sender: UIButton) {
        //TODO:  Show text "recording in progress"
        recordingInProgress.hidden = false
        stopButton.hidden = false
        
        //TODO:  Record the user's voice
        println("in recordAudio")
        recordButton.enabled = false
        
    }
   
    
    @IBAction func stopAudio(sender: UIButton) {
        
        recordingInProgress.hidden = true
    }
   
}

