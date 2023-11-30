//
//  ViewController.swift
//  dlewis_proj3
//
//  Created by Derwin Alex-Lanier Lewis on 9/26/23.
//

import UIKit

class ViewController: UIViewController,  UITextFieldDelegate {
    @IBOutlet weak var t_C: UITextField!
    @IBOutlet weak var t_F: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        t_F.delegate = self
        t_C.delegate = self
        
        t_F.text = "32.0"
        t_C.text = "0.0"
    }
    
    //displayAlert(msgTitle: "Ready", msgContent: "Go")
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message: msgContent, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }


    //convert T in F to T in C //Instructor implements this function
    @IBAction func f2CAction(_ sender: Any) {
        //make the software keyboard disappear
        t_F.resignFirstResponder()
        t_C.resignFirstResponder()
        
        //do the calculation: F --> C
        if let tInF = Float(t_F.text!){
            // now we have the temperature in tInf
            let tInC = (tInF - 32.0) * 5.0 / 9.0
            // display C in the t_C textfield
            let tInC_Str = String(format: "%.1f", tInC)
            t_C.text = tInC_Str
            
        } else{
            displayAlert(msgTitle: "Input Error", msgContent: "Need value")
            return
        }
        
        
        //display C in the t_C textfield
    }
    //convert T in C to T in F //Studmets will implement this function
    @IBAction func c2FAction(_ sender: Any) {
        //make the software keyboard disappear
        t_F.resignFirstResponder()
        t_C.resignFirstResponder()

        //do the calculation: C --> F
        if let tInC = Float(t_C.text!){
            // now we have the temperature in tInC
            let tInF = tInC * 9.0 / 5.0 + 32.0
            // display F in the t_F textfield
            let tInF_Str = String(format: "%.1f", tInF)
            t_F.text = tInF_Str
            
        } else {
            displayAlert(msgTitle: "Input Error", msgContent: "Need value")
            return
        }
        
        
        //display F in the t_F textfield
    }
}

