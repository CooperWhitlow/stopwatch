//
//  CountUpViewControler.swift
//  StopWatch
//
//  Created by Cooper Whitlow on 3/26/16.
//  Copyright © 2016 Cooper Whitlow. All rights reserved.
//

import UIKit

class StopwatchViewController: UIViewController {
   
    @IBOutlet weak var timeLabel: UILabel!
    
    //What is this? A class instance? Why the ()?
    var timer = NSTimer()
    
    var minutes = 0
    var seconds = 0
    
    func countTime() {
        if seconds < 60 {
            seconds += 1
        } else {
            seconds = 00
            minutes += 1
        }
        
        let displayTime = String(format: "%02d", minutes) + ":" + String(format: "%02d", seconds)
        timeLabel.text = displayTime
    }
    
    @IBAction func playButton(sender: AnyObject) {
        timer.invalidate()
        // Need explanation on this bit below
        timer = NSTimer.scheduledTimerWithTimeInterval(1,
                                                       target: self,
                                                       selector: #selector(self.countTime),
                                                       userInfo: nil,
                                                       repeats: true)
    }

    @IBAction func pauseButton(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func resetButton(sender: AnyObject) {
        timer.invalidate()
        timeLabel.text = "00:00"
        minutes = 0
        seconds = 0
    }
}