//
//  util.swift
//  CardGame
//
//  Created by on 27/06/23.
//

import Foundation
import UIKit
struct Util {
  static let shared = Util()
    private let ud = UserDefaults.standard
  

  private init() {  }
    
    func getTimeStamp() -> String{
        let d = Date()
        let df = DateFormatter()
        df.dateFormat = "yy-MM-dd H:mm:ss"
        return df.string(from: d)
    }
    
    func setDifficulty(difficulty: Int){
        ud.set(difficulty, forKey: "Difficulty")
    }
    func getDifficulty() -> Int{
        return ud.value(forKey: "Difficulty") as? Int ?? 0
    }
    
    func setSound(sound: Bool){
        ud.set(sound, forKey: "Sound")
    }
    func getSound() -> Bool{
        return ud.value(forKey: "Sound") as? Bool ?? false
    }
    
    func setMusic(music: Bool){
        ud.set(music, forKey: "Music")
    }
    func getMusic() -> Bool{
        return ud.value(forKey: "Music") as? Bool ?? false
    }
    
    func setVibrate(vibrate: Bool){
        ud.set(vibrate, forKey: "Vibrate")
    }
    func getVibrate() -> Bool{
        return ud.value(forKey: "Vibrate") as? Bool ?? false
    }
    
    func setNotification(notification: Bool){
        ud.set(notification, forKey: "Notification")
    }
    func getNotification() -> Bool{
        return ud.value(forKey: "Notification") as? Bool ?? false
    }
}
