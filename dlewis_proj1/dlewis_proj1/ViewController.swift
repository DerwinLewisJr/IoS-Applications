//
//  ViewController.swift
//  dlewis_proj1
//
//  Created by Derwin Alex-Lanier Lewis on 9/19/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myPic: UIImageView! //the name of that pic widget
    var alpha = 1.0
    
    override func viewDidLoad() { // similar to the main() in c++
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // when the button is clicked, this function is executed.
    @IBAction func btnClickedAction(_ sender: Any) {
        alpha = alpha - 0.2
        if alpha < 0.0 {
            alpha = 1.0
        }
        myPic.alpha = alpha
    }
    
}

