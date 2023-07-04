//
//  RulesViewController.swift
//  CardGame
//
//  Created on 26/06/23.
//

import UIKit

class RulesViewController: UIViewController {
          
    @IBOutlet weak var tableview: UITableView!
    let arrOfRules = ["Shuffle the deck of cards and lay them face-down in a grid.", "On their turn, a player flips over two cards of their choice.", "If the flipped cards match in rank, the player will get 10 points, and those card will get disappeared and other player will get turn.", "If the flipped cards don't match in rank, the player will not get any points, and those card will turned face-down and other player will get turn.", "The player with the most pairs wins."]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.registerTableViewCells()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func registerTableViewCells() {
        let cell = UINib(nibName: "ScoreViewCellTableViewCell",
                                  bundle: nil)
        self.tableview.register(cell,
                                forCellReuseIdentifier: "ScoreViewCellTableViewCell")
    }
}

extension RulesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrOfRules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreViewCellTableViewCell") as? ScoreViewCellTableViewCell {
            cell.lblText.text = "\(indexPath.row + 1). \(arrOfRules[indexPath.row])"
                return cell
            }
            
            return UITableViewCell()
    }
}
