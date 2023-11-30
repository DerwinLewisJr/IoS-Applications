//
//  ViewController.swift
//  dlewis_proj22
//
//  Created by Derwin Alex-Lanier Lewis on 9/21/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var clickCtLabel: UILabel!
    var clickCt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clickCtLabel.text = "Click count: 0"
    }

    @IBAction func btnClickedAction(_ sender: Any) {
        clickCt += 1
        clickCtLabel.text = "Click count: \(clickCt)"
        
    }
    
}

