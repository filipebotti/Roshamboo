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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func paperTouched() {
        var controller: ResultViewController
        
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        controller.computerValue = "P"
        controller.userValue = randomValue()
        
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
        
        let controller = segue.destination as! ResultViewController
        
        controller.computerValue = randomValue()
        
        if segue.identifier != nil {
            controller.userValue = "S"
        } else {
            controller.userValue = "R"
        }
    }


}

