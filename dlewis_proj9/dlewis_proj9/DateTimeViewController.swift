//
//  DateTimeViewController.swift
//  dlewis_proj9
//
//  Created by Derwin Alex-Lanier Lewis on 11/16/23.
//

import UIKit

class DateTimeViewController: UIViewController {
    @IBOutlet weak var myDateLabel: UILabel!
    @IBOutlet weak var myTimeLabel: UILabel!
    var myTimer = Timer() // the timer we will use
    override func viewDidLoad() {
        super.viewDidLoad()
        // setup my timer
        updateTime()
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
    }

    @objc func updateTime () { // read date and time, display them on those wo labels
        let currentDate = NSDate() // read the latest date and time
        
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "MMMM, dd, yyyy"
        let convertedDateStr = myDateFormatter.string(from: currentDate as Date)
        myDateLabel.text = convertedDateStr
        
        //display time
        myDateFormatter.dateFormat = "hh:mm:ss"
        let convertedTimeStr = myDateFormatter.string(from: currentDate as Date)
        myTimeLabel.text = convertedTimeStr
    }

}
