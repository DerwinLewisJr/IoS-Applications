//
//  ViewController.swift
//  dlewis_proj2
//
//  Created by Derwin Alex-Lanier Lewis on 9/21/23.
//

import UIKit

class ViewController: UIViewController {
    
    var isLightOn: Bool = true
    
    
    override func viewDidLoad() { // main()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        isLightOn = true
        view.backgroundColor = .white
    }


    @IBAction func turnScreenOnOff(_ sender: Any) {
        isLightOn = !isLightOn
        if isLightOn {
            view.backgroundColor = .white
        }
        else {
            view.backgroundColor = .black
        }
    }
}

