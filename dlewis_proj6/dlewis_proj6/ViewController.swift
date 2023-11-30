//
//  ViewController.swift
//  dlewis_proj6
//
//  Created by Derwin Alex-Lanier Lewis on 10/24/23.
//

import UIKit
import AVFoundation

enum GameStatus {
    case start
    case win
    case lose
    case draw
}

enum Sign {
    case rock
    case paper
    case scissors
}
class ViewController: UIViewController {
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockBtn: UIButton!
    @IBOutlet weak var scissorsBtn: UIButton!
    @IBOutlet weak var paperBtn: UIButton!
    @IBOutlet weak var playAgainBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(forState: .start)
    }

    
    
    //function to cnotrol the appearance of the interface based on the game'status
    func updateUI(forState state: GameStatus) {
        switch state {
        case .start:
            view.backgroundColor = .gray
            signLabel.text = "🤖"
            playAgainBtn.isHidden = true
            rockBtn.isHidden = false
            paperBtn.isHidden = false
            scissorsBtn.isHidden = false
            statusLabel.text = "Rock, Paper, Scissors?"
        case .win:
            view.backgroundColor = UIColor(red: 0.065, green: 0.79, blue: 0.65, alpha: 1)
            statusLabel.text = "You Won!"
            AudioServicesPlaySystemSound(1016)
            
        case .lose:
            view.backgroundColor = UIColor(red: 0.85, green: 0.42, blue: 0.41, alpha: 1)
            statusLabel.text = "You lost!"
            AudioServicesPlaySystemSound(1006)
            
        case .draw:
            view.backgroundColor = .cyan
            statusLabel.text = "It's a draw!"
            AudioServicesPlaySystemSound(1116)
            
        }
        
        
    }
    
    
    @IBAction func rockBtnClicked(_ sender: Any) {
        checkResult(userChoice: .rock)
    }
    
    @IBAction func paperBtnClicked(_ sender: Any) {
        checkResult(userChoice: .paper)
    }
    
    @IBAction func scissorsBtnClicked(_ sender: Any) {
        checkResult(userChoice: .scissors)
    }
    
    @IBAction func playAgnClicked(_ sender: Any) {
        updateUI(forState: .start)
    }
    
    //check the game result based on user's choice
    func checkResult(userChoice: Sign) {
        // make a choice for the machine
        let i = Int.random(in: 0...2)
        var computerChoice: Sign = .rock
        switch i {
        case 0:
            computerChoice = .rock
            signLabel.text = "🪨"
        case 1:
            computerChoice = .paper
            signLabel.text = "📄"
        case 2:
            computerChoice = .scissors
            signLabel.text = "✄"
        default:
            print("nothing")
        }
        
        //hide all the signs
        rockBtn.isHidden = true
        paperBtn.isHidden = true
        scissorsBtn.isHidden = true
        playAgainBtn.isHidden = false
        
        
        //show up the user's choice
        if userChoice == .rock {
            rockBtn.isHidden = false
        } else if userChoice == .paper {
            paperBtn.isHidden = false
        } else {
            scissorsBtn.isHidden = false
        }
        
        // make a judgement
        if userChoice == computerChoice {
            updateUI(forState: .draw)
            return
        }
        
        var userStatus: GameStatus = .win
        switch userChoice {
        case .rock:
            if computerChoice == .paper {
                userStatus = .lose
            } else {
                userStatus = .win
            }
        case .scissors:
            if computerChoice == .rock {
                userStatus = .lose
            }  else {
                userStatus = .win
            }
        case .paper:
            if computerChoice == .scissors {
                userStatus = .lose
            } else {
                userStatus = .win
            }
        }
        updateUI(forState: userStatus)
        
    }
    
}

