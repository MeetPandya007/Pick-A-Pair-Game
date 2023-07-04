//
//  DifficultyViewController.swift
//  CardGame
//
//  Created on 26/06/23.
//

import UIKit

class DifficultyViewController : UIViewController{
    
    
    
    @IBOutlet var arrSwitches: [UISwitch]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<arrSwitches.count{
            if i != Util.shared.getDifficulty(){
                arrSwitches[i].setOn(false, animated: true)
            }else{
                arrSwitches[i].setOn(true, animated: true)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickEasy(_ sender: UISwitch) {
        for thisSwitch in arrSwitches{
            if thisSwitch != sender.self{
                thisSwitch.setOn(false, animated: true)
            }
        }
        Util.shared.setDifficulty(difficulty: 0)
    }
    
    @IBAction func onClickMedium(_ sender: UISwitch) {
        for thisSwitch in arrSwitches{
            if thisSwitch != sender.self{
                thisSwitch.setOn(false, animated: true)
            }
        }
        Util.shared.setDifficulty(difficulty: 1)
    }
    
    @IBAction func onClickHard(_ sender: UISwitch) {
        for thisSwitch in arrSwitches{
            if thisSwitch != sender.self{
                thisSwitch.setOn(false, animated: true)
            }
        }
        Util.shared.setDifficulty(difficulty: 2)
    }
    @IBAction func onClickExtreme(_ sender: UISwitch) {
        for thisSwitch in arrSwitches{
            if thisSwitch != sender.self{
                thisSwitch.setOn(false, animated: true)
            }
        }
        Util.shared.setDifficulty(difficulty: 3)
    }
}

