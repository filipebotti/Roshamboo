//
//  ViewController.swift
//  Roshamboo
//
//  Created by Filipe Botti on 13/10/18.
//  Copyright © 2018 Filipe Botti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let options = ["R", "S", "P"]
    var histories = [History]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func paperTouched() {
        var controller: ResultViewController
        
        let computerMove = randomValue()
        
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        controller.userValue = "P"
        controller.computerValue = computerMove
        
        addHistory(playerMove: "P", computerMove: computerMove)
        
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func scissorsTouched() {
        self.performSegue(withIdentifier: "scissorSegue", sender: self)
    }
    
    func randomValue() -> String {
        let random = Int.random(in: 0..<3)
        
        return options[random]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let controller = segue.destination as? ResultViewController {
            
            controller.computerValue = randomValue()
            
            if segue.identifier != RoshambooKeys.ScissorSegue {
                controller.userValue = "S"
            } else {
                controller.userValue = "R"
            }
            
            addHistory(playerMove: controller.userValue!, computerMove: controller.computerValue!)
        }
        else if segue.identifier == RoshambooKeys.HistorySegue {
            
            let controller = segue.destination as! HistoryViewController
            controller.histories = histories
        }
    }

    func addHistory(playerMove: String, computerMove: String) {
        let won = playerWon(playerMove: playerMove, computerMove: computerMove)
        let history = History(won: won, playerMove: playerMove, computerMove: computerMove)
        histories.append(history)
    }

}

