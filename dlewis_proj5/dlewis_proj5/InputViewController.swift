//
//  InputViewController.swift
//  dlewis_proj5
//
//  Created by Derwin Alex-Lanier Lewis on 10/12/23.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var qInput: UITextField!
    @IBOutlet weak var aInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        qInput.delegate = self
        aInput.delegate = self
    }
    
    // have a pop-up window to display message to user
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message:
                                                    msgContent, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default,
                                          handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func addNewCard(_ sender: Any) {
        //read the question string
        //read the answer string
        
        if let question = qInput.text, !question.isEmpty, let answer = aInput.text, !answer.isEmpty {
            questions.append(question)
            answers.append(answer)
            
            qInput.text = ""
            aInput.text = ""
            
            displayAlert(msgTitle: "New card added", msgContent: "")
            
        } else {
            displayAlert(msgTitle: "Need More Information", msgContent: "Enter a question and an answer")
        }
        
        //if question string and/or the answer string is/are empty, display alert, return
        
        //append the new card to the end of the card stack
        //questions.append("")
        //answer.append("")
        
    }
    


}
