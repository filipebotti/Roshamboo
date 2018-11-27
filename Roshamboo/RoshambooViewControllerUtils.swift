//
//  RoshambooViewControllerUtils.swift
//  Roshamboo
//
//  Created by Filipe Botti on 27/11/18.
//  Copyright © 2018 Filipe Botti. All rights reserved.
//

import UIKit

extension UIViewController {

    func playerWon(playerMove: String, computerMove: String) -> Bool {
        return (playerMove == "S" && computerMove == "P") || (playerMove == "P" && computerMove == "R") || (playerMove == "R" && computerMove == "S")
    }
    
    func getLabel(_ result: String) -> String{
        switch(result) {
        case "SP", "PS":
            return "Scissors cuts Paper"
        case "PR", "RP":
            return "Paper covers Rock"
        case "RS", "SR":
            return "Rock crushes Scissors"
        default:
            return "Its a tie!"
        }
    }
    
}
