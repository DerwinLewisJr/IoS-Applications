//
//  ViewController.swift
//  dlewis_proj4
//
//  Created by Derwin Alex-Lanier Lewis on 10/3/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var pilotWord: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userInput.delegate = self
    }
    

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userInput.resignFirstResponder() //make the keyboard disappear
        
        if let input = userInput.text {
            if input.count == 0 || input.count > 1 || input.uppercased() < "A" || input.uppercased() > "Z" {
                //invalid input
                return true
            } else { // right input
                pilotWord.text = translate(letter: input)
            }
        }
        
        
        return true
    }

    
    func translate(letter: String) -> String {
            var pw = ""
            switch letter.uppercased() {
            case "A": pw = "Alpha"
            case "B": pw = "Bravo"
            case "C": pw = "Charlie"
            case "D": pw = "Delta"
            case "E": pw = "Echo"
            case "F": pw = "Foxtrot"
            case "G": pw = "Golf"
            case "H": pw = "Hotel"
            case "I": pw = "India"
            case "J": pw = "Juliett"
            case "K": pw = "Kilo"
            case "L": pw = "Lima"
            case "M": pw = "Mike"
            case "N": pw = "November"
            case "O": pw = "Oscar"
            case "P": pw = "Papa"
            case "Q": pw = "Quebec"
            case "R": pw = "Romeo"
            case "S": pw = "Sierra"
            case "T": pw = "Tango"
            case "U": pw = "Uniform"
            case "V": pw = "Victor"
            case "W": pw = "Whiskey"
            case "X": pw = "X-Ray"
            case "Y": pw = "Yankee"
            case "Z": pw = "Zulu"
            default: pw = "Error"
            }
        
        return pw
    }

}

