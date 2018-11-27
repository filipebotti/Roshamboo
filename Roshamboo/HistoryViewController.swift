//
//  HistoryViewController.swift
//  Roshamboo
//
//  Created by Filipe Botti on 19/11/18.
//  Copyright © 2018 Filipe Botti. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var histories: [History] = []
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoshambooKeys.HistoryCellIdentifier)!
        let history = self.histories[(indexPath as NSIndexPath).row]
        
        // Set the name and image
        var title = ""
        if history.playerMove == history.computerMove {
            title = "Tie!"
        } else {
            title = history.won ? "Win!" : "Lose!"
        }
        
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = getLabel("\(history.playerMove)\(history.computerMove)")
        
        return cell    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return histories.count
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
