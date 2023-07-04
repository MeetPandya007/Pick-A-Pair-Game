//
//  SettingsViewController.swift
//  CardGame
//
//  Created on 26/06/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var switchSound: UISwitch!
    @IBOutlet weak var switchMusic: UISwitch!
    @IBOutlet weak var switchNotification: UISwitch!
    @IBOutlet weak var switchVibration: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        switchSound.setOn(Util.shared.getSound(), animated: false)
        switchMusic.setOn(Util.shared.getMusic(), animated: false)
        switchNotification.setOn(Util.shared.getNotification(), animated: false)
        switchVibration.setOn(Util.shared.getVibrate(), animated: false)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickSoundSwitch(_ sender: Any) {
        switchSound.setOn(!Util.shared.getSound(), animated: true)
        Util.shared.setSound(sound: !Util.shared.getSound())
    }
    @IBAction func onClickMusicSwitch(_ sender: Any) {
        switchMusic.setOn(!Util.shared.getMusic(), animated: true)
        Util.shared.setMusic(music: !Util.shared.getMusic())
    }
    @IBAction func onClickNotificationSwitch(_ sender: Any) {
        switchNotification.setOn(!Util.shared.getNotification(), animated: true)
        Util.shared.setNotification(notification: !Util.shared.getNotification())
    }
    @IBAction func onClickVibrateSwitch(_ sender: Any) {
        switchVibration.setOn(!Util.shared.getVibrate(), animated: true)
        Util.shared.setVibrate(vibrate: !Util.shared.getVibrate())
    }
}
