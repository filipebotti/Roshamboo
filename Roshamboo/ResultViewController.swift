//
//  ResultViewController.swift
//  Roshamboo
//
//  Created by Filipe Botti on 13/10/18.
//  Copyright © 2018 Filipe Botti. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var userValue: String?
    var computerValue: String?
    
    @IBOutlet var roshambooImage: UIImageView!
    @IBOutlet var roshambooLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let result = "\(self.userValue!)\(self.computerValue!)"
        setLabel(result)
        setImage(result)
        
        if self.computerValue != self.userValue {
            self.roshambooLabel.text = userWon() ? "\(self.roshambooLabel!.text!), you won!" : "\(self.roshambooLabel!.text!), you lose!"
        }
    }
    
    func userWon() -> Bool {
        print(self.userValue!)
        print(self.computerValue!)
        return (self.userValue! == "S" && self.computerValue! == "P") || (self.userValue! == "P" && self.computerValue! == "R") || (self.userValue! == "R" && self.computerValue! == "S")
    }
    
    func setLabel(_ result: String) {
        switch(result) {
        case "SP", "PS":
            self.roshambooLabel.text = "Scissors cuts Paper"
        case "PR", "RP":
            self.roshambooLabel.text = "Paper covers Rock"
        case "RS", "SR":
            self.roshambooLabel.text = "Rock crushes Scissors"
        default:
            self.roshambooLabel.text = "Its a tie!"
        }
    }
    
    func setImage(_ result: String) {
        switch(result) {
        case "SP", "PS":
            self.roshambooImage.image = UIImage(named: "ScissorsCutPaper")
        case "PR", "RP":
            self.roshambooImage.image = UIImage(named: "PaperCoversRock")
        case "RS", "SR":
            self.roshambooImage.image = UIImage(named: "RockCrushesScissors")
        default:
            self.roshambooImage.image = UIImage(named: "itsATie")
        }
    }
    
    @IBAction func tryAgain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
