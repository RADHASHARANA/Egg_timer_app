//
//  ViewController.swift
//  Boiled egg
//
//  Created by IIFLUSER on 28/10/21.
//

import UIKit
import AVFoundation
class ViewController: UIViewController{

    
    var player : AVAudioPlayer!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var tittleView: UILabel!
    var count: Float = 0.0
    var timer = Timer()
    /*let softTime = 5
    let mediumTime = 8
    let hardTime = 12*/
    var secondsRemaining = 0
    @IBOutlet weak var countDownTimer: UILabel!
    // Dictionary
    let eggTime = ["Soft":3, "Medium":480, "hard":720]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func hardnessSelected(_ sender: UIButton){
        timer.invalidate()
        tittleView.text = "How Do You Like?"
        progressView.progress = 0.0
        let hardness = sender.currentTitle!
        secondsRemaining = eggTime[hardness]!
        count = Float(1)/Float(secondsRemaining)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    
    @objc func update() {
        if(secondsRemaining > 0) {
            countDownTimer.text = String(secondsRemaining)
            //print("\(secondsRemaining) seconds")
            secondsRemaining-=1
            progressView.progress+=count
        }
        else
        {
            timer.invalidate()
            tittleView.text = "DONE!!"
            countDownTimer.text = String(secondsRemaining)
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }

  }

}
