//
//  StopWatchViewController.swift
//  dlewis_proj9
//
//  Created by Derwin Alex-Lanier Lewis on 11/16/23.
//

import UIKit

class StopWatchViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    var isRunning = false //monitor the clock status: running/stopped
    var startTime = TimeInterval() //hold the time of starting moment
    var myTimer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = "00:00:00" //mm:ss:ms
        isRunning = false
    }
    
    @IBAction func btnAction(_ sender: Any) {
        if isRunning { //currently running and needs to stop
            isRunning = !isRunning
            myTimer.invalidate() // stops the timer
        } else { // currently not running and needs to start
            isRunning = !isRunning
            timeLabel.text = "00:00:00"
            startTime = NSDate.timeIntervalSinceReferenceDate // wite down the starting moment
            
            //Now start the timer
            myTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
        }
    }
        
    @objc func updateTime() {
        //subtract current time from the startTime
        //formatting the date
        //display it on the timeLabel
        let currentTime = NSDate.timeIntervalSinceReferenceDate // the number of seconds since Jan. 1st, 2001: 12: am
            
        var elapsedTime = currentTime - startTime
            
        //minutes
        let minutes = UInt8(elapsedTime/60.0)
            
        //seconds
        elapsedTime = elapsedTime - TimeInterval(minutes) * 60
        let seconds = UInt8(elapsedTime)
            
        // Find out the fraction of milliseconds to be displayed
        elapsedTime = elapsedTime - TimeInterval(seconds)
        let fraction = UInt8(elapsedTime * 100)
            
        //display
        let minutesStr = String(format: "%02d", minutes)
        let secondsStr = String(format: "%02d", seconds)
        let fractionStr = String(format: "%02d", fraction)
        timeLabel.text = minutesStr + ":" + secondsStr + ":" + fractionStr
            
        }
    
}
