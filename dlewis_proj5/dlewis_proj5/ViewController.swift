//
//  ViewController.swift
//  dlewis_proj5
//
//  Created by Derwin Alex-Lanier Lewis on 10/12/23.
//

import UIKit

var questions: [String] = []
var answers: [String] = []
var currentQuestionIndex = 0

class ViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    
    @IBAction func go2NextQuestion(_ sender: Any) {
        //check if we have cards yet
        if questions.count == 0 {
            displayAlert(msgTitle: "No card yet", msgContent: "")
            return
        }
        //now we know we have at least one card
        currentQuestionIndex = currentQuestionIndex + 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        questionLabel.text = questions[currentQuestionIndex]
        answerLabel.text = "????"
        
        
    }
    
    @IBAction func deleteCard(_ sender: Any) {
        // check if there is card to delete. If yes, you remove the current card from questions and answers If no, return.  questions.remove(at: currentQuestionIndex)
        
        if questions.count == 0 {
            displayAlert(msgTitle: "No card to delete", msgContent: "")
            return
        }
        // answers.remove(at: currentQuestionIndex)
        if currentQuestionIndex < questions.count {
            questions.remove(at: currentQuestionIndex)
            answers.remove(at: currentQuestionIndex)
        } else {
            displayAlert(msgTitle: "No more cards to delete", msgContent: "")
        }
    
        
        //check whether you still have card(s)
        // If no, return
        // If yes, adjust the pointer if needed
        if questions.count == 0 {
            currentQuestionIndex = 0
        } else if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
            
        }
        
        //display the new question and hide the answer with ???
        if !questions.isEmpty {
            questionLabel.text = questions[currentQuestionIndex]
            answerLabel.text = "????"
        } else {
                questionLabel.text = "No more cards. Add more"
                answerLabel.text = ""
            }
        
        

    }
    
    @IBAction func showMeAnswer(_ sender: Any) {
        if answers.count == 0 {
            displayAlert(msgTitle: "No card yet", msgContent: "")
            return
        }
        answerLabel.text = answers[currentQuestionIndex]
    }
    
    @IBAction func go2InputViewAction(_ sender: Any) {
        performSegue(withIdentifier: "goInputView", sender: nil)
    }
    
    
}

