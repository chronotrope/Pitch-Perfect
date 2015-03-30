//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Ruben Robles on 2/8/15.
//  Copyright (c) 2015 Integration Dojo. All rights reserved.
//

import UIKit
import AVFoundation

//Declared Globally
var audioRecorder:AVAudioRecorder!
var recordedAudio:RecordedAudio!


class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

  
    @IBOutlet weak var stopButton: UIButton!
   
    @IBOutlet weak var recordingInProgress: UILabel!
    
  
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
        resetRecordingView()    
        
    }
    
    
    @IBAction func recordAudio(sender: UIButton) {

        updateRecordingView()
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        // Initialize and prepare the recorder
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        if(flag){
        
        recordedAudio = RecordedAudio(filePathUrl: recorder.url, title: recorder.url.lastPathComponent!)
        
        //TODO:  Step 2 - Move to the next scene aka perform the sugue.
        self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        }else{
            println("Recording was not successful.")
            recordButton.enabled = true
            stopButton.hidden = true
        }
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) { if (segue.identifier == "stopRecording"){
        let playSoundsVC:PlaySoundsViewController = segue.destinationViewController as PlaySoundsViewController
        let data = sender as RecordedAudio
        playSoundsVC.receivedAudio = data
        
        }
        
    }
   
    func updateRecordingView() {
        //display the stop button
        stopButton.enabled = true
        stopButton.hidden = false
        //disable the record button
        recordButton.enabled = false
        recordingInProgress.text = "Recording..."
        
        
    }
    
    func resetRecordingView() {
        stopButton.hidden = true
        recordButton.enabled = true
        recordingInProgress.hidden = false
        recordingInProgress.text = "Tap to Record"
        
    }
    
    
    @IBAction func stopAudio(sender: UIButton) {
        
        recordingInProgress.hidden = true
        
        //Inside func stopAudio(sender: UIButton)
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    
    }
   
        
 
   
}

