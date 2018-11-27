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
        self.roshambooLabel.text = getLabel(result)
        setImage(result)
        
        if self.computerValue != self.userValue {
            self.roshambooLabel.text = playerWon(playerMove: self.userValue!, computerMove: self.computerValue!) ? "\(self.roshambooLabel!.text!), you won!" : "\(self.roshambooLabel!.text!), you lose!"
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
