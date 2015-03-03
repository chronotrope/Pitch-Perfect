//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Ruben Robles on 2/8/15.
//  Copyright (c) 2015 Integration Dojo. All rights reserved.
//

import UIKit

class RecordSoundsViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
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
    }
    @IBAction func recordAudio(sender: UIButton) {
        
        
        //TODO: Record the user's voice
        println("in recordAudio")
        recordingInProgress.hidden = false
        stopButton.hidden = false
        recordButton.enabled = false
    }
   
    @IBAction func stopButtonPressed(sender: UIButton) {
        println("stop button pressed...")
        recordingInProgress.hidden = true
    }
}

