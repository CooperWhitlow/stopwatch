//
//  CountDownViewController.swift
//  StopWatch
//
//  Created by Cooper Whitlow on 3/26/16.
//  Copyright © 2016 Cooper Whitlow. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController {
    
    var seconds = 0
    var minutes = 0
    var isCounting = false
    var timer = NSTimer()
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIBarButtonItem!

    func updateTimeLabel() {
        timeLabel.text = String(format: "%02d", minutes) + ":" + String(format: "%02d", seconds) //can I add an observer property to invalidate the timer if this hits 00:00? I think I might have to do this in the UIViewController class or whereever the property .text is defined and use didSet{}
    }
    
    
    override func viewWillLayoutSubviews() {
        let width = self.view.frame.size.width
        if width <= 480 {
            timeLabel.font = UIFont(name: "Helvetica", size: 130)
        } else {
            timeLabel.font = UIFont(name: "Helvetica", size: 240)
        }
    }
    
    func countTime() {
        if minutes == 0 && seconds == 0 {
            timer.invalidate()
        } else if seconds == 0 {
            minutes -= 1
            seconds = 59
        } else {
            seconds -= 1
        }
        
        updateTimeLabel()
    }
    
    @IBAction func addTenSecButton(sender: AnyObject) {
        if seconds == 50 {
            seconds = 0
            minutes += 1
        } else {
            seconds += 10
        }
        
        updateTimeLabel()
    }
    
    @IBAction func addOneMinButton(sender: AnyObject) {
        minutes += 1
        updateTimeLabel()
    }
 
    @IBAction func addTenMinButton(sender: AnyObject) {
        minutes += 10
        updateTimeLabel()
    }
    
    @IBAction func startCountdownButton(sender: AnyObject) {
        isCounting = !isCounting
        performActionForState(isCounting)
    }
    
    func performActionForState(state: Bool) {
        var image = UIImage(named: "pause.png")
        if state == true {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(self.countTime), userInfo: nil, repeats: true)
        } else {
            image = UIImage(named: "icon-play-128.png")
            timer.invalidate()
        }
        playPauseButton.image = image
    }
    
    @IBAction func resetCountdownButton(sender: AnyObject) {
        timer.invalidate()
        seconds = 0
        minutes = 0
        updateTimeLabel()
    }
    
}