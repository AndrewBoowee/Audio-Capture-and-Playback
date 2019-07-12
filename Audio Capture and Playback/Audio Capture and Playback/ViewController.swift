//
//  ViewController.swift
//  Audio Capture and Playback
//
//  Created by Drew Boowee on 7/12/19.
//  Copyright © 2019 Drew Boowee. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {

    @IBOutlet weak var recordBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var playBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        recordBarButtonItem.isEnabled = false
        playBarButtonItem.isEnabled = false
        
        var audioSession: AVAudioSession?
        var audioRecorder: AVAudioRecorder?
       var audioPlayer: AVAudioPlayer?
        var audioFileURL: URL?
       
        

//               guard let _ = self.audioSession, let _ = self.audioRecorder else {
//               self.presentAlert(message: "Unable to initialize audio.")
//               return
 //
                
//                self.recordBarButtonItem.isEnabled = true
//            } else {
 //               self.Alert(message: "Access to recording was denied.")
  //          }
//        }
    }
    
    @IBAction func recordButton(_ sender: Any)
    {
     //   if (AVaudioRecorder?.isRecording == false) {
            playBarButtonItem.isEnabled = false
            recordBarButtonItem.image = UIImage(named: "stop")
//            AVaudioRecorder?.record()
  //      } else {
            playBarButtonItem.isEnabled = true
            recordBarButtonItem.image = UIImage(named: "record")
//            AVaudioRecorder?.stop()
        
    }

    
    func Alert(message: String)
    {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }



    func AudioRecord()
    {
    let recordingSettings =
        [AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue,
         AVEncoderBitRateKey: 16,
         AVNumberOfChannelsKey: 2,
         AVSampleRateKey: 44100.0] as [String : Any]
    
    do {
        
        audioRecorder?.delegate = self
        }
        catch
        {
       Alert(message: "Error initializing the audio recorder: \(error.localizedDescription)")
    }
}
    
    @IBAction func playButton(_ sender: Any)
    {
    //    guard let audioFileURL = audioFileURL else {
        //error message
//            presentAlert(message: "Audio file is not available to play.")
  //          return
   //     }

                playBarButtonItem.image = UIImage(named: "play")
                recordBarButtonItem.isEnabled = true
                return
        
        do {
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            recordBarButtonItem.isEnabled = false
            playBarButtonItem.image = UIImage(named: "stop")
            }
        catch
            {
            Alert(message: "Unable to create audio player.")
            return
        }
    }
    
    func playedAudio(_ player: AVAudioPlayer, successfully flag: Bool) {
        recordBarButtonItem.isEnabled = true
        playBarButtonItem.image = UIImage(named: "play")
    }

    func audioDidNotPlay(_ player: AVAudioPlayer, error: Error?) {
        guard let error = error  else {
            return
        }
        Alert(message: "Audio play decoding error: \(error.localizedDescription)")
    }
}
