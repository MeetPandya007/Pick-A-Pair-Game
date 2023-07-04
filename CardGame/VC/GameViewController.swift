//
//  GameViewController.swift
//  CardGame
//
//  Created on 26/06/23.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var imgArr: [UIImageView]!
    
    @IBOutlet weak var lblScoreP1: UILabel!
    @IBOutlet weak var lblScoreP2: UILabel!
    
    @IBOutlet weak var imgAvatarP2: UIImageView!
    @IBOutlet weak var imgAvatarP1: UIImageView!
    
    
    @IBOutlet weak var lblWinningPlayer: UILabel!
    @IBOutlet weak var btnReplay: UIButton!
    
    let cardArr = ["2♠", "3♠", "4♠", "5♠", "6♠", "7♠", "8♠", "9♠", "10♠", "A♠", "J♠", "K♠", "Q♠", "2♦", "3♦", "4♦", "5♦", "6♦", "7♦", "8♦", "9♦", "10♦", "A♦", "J♦", "K♦", "Q♦", "2♣", "3♣", "4♣", "5♣", "6♣", "7♣", "8♣", "9♣", "10♣", "A♣", "J♣", "K♣", "Q♣", "2♥", "3♥", "4♥", "5♥", "6♥", "7♥", "8♥", "9♥", "10♥", "A♥", "J♥", "K♥", "Q♥"]
    
    //for 16 cards to show on screen
    var randomImageNameArr : [String] = []
    
    //For 2 cards being opened
    var pickedIndex1 = -1
    var pickedIndex2 = -1
    
    var scoreForP1 = 0
    var scoreForP2 = 0
    
    var isPlayer1 = true{
        didSet{
            if isPlayer1{
                imgAvatarP1.isHidden = false
                imgAvatarP2.isHidden = true
            }else{
                imgAvatarP1.isHidden = true
                imgAvatarP2.isHidden = false
            }
        }
    }
    
    var remainingImageCounter = 16{
        didSet{
            if remainingImageCounter == 0{
                lblWinningPlayer.text = scoreForP1 > scoreForP2 ? "Player 1 Won" : "Player 2 Won"
                if scoreForP1 == scoreForP2 {
                    lblWinningPlayer.text = "DRAW"
                }
                btnReplay.superview?.isHidden = false
                btnReplay.isUserInteractionEnabled = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetView()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickReplay(_ sender: Any) {
        resetView()
    }
    
    func resetView(){
        self.lblScoreP1.text = "Score: 0"
        self.lblScoreP2.text = "Score: 0"
        isPlayer1 = true
        
        btnReplay.superview?.isHidden = true
        
        setTag()
        setRandomImages()
        
        scoreForP1 = 0
        scoreForP2 = 0
        
        pickedIndex1 = -1
        pickedIndex2 = -1
    }
    //Set tags on the card for later access
    func setTag(){
        var i = 0
        for img in imgArr{
            img.tag = i
            
            img.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.onClickImage(_:)))
            img.addGestureRecognizer(tap)
            img.image = UIImage(named: "backofcard")
            i += 1
        }
    }
    
    //Set random 8 images in the arr and make it double to store 16 images of pairs
    func setRandomImages(){
        randomImageNameArr = []
        for _ in 0..<8{
            randomImageNameArr.append(cardArr[Int.random(in: 0..<52)])
        }
        randomImageNameArr.append(contentsOf: randomImageNameArr)
        randomImageNameArr.shuffle()
        print(randomImageNameArr)
    }
    
    @objc func onClickImage(_ sender: UITapGestureRecognizer? = nil)  {
        if pickedIndex2 == -1{
            openCard(index: sender?.view?.tag ?? 0)
        }
    }

    //to open card
    func openCard(index: Int){
        if imgArr[index].image == nil{
            return
        }
        imgArr[index].image = UIImage(named: randomImageNameArr[index])
        
        if pickedIndex1 == -1{
            pickedIndex1 = index
        }else{
            if index == pickedIndex1{
                return
            }
            pickedIndex2 = index
            
            
            DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: { [self] in
                if self.randomImageNameArr[self.pickedIndex1] == self.randomImageNameArr[self.pickedIndex2]{
                    self.imgArr[self.pickedIndex1].image = nil
                    self.imgArr[self.pickedIndex2].image = nil
                    if self.isPlayer1{
                        self.scoreForP1 += 10
                        self.lblScoreP1.text = "Score: \(self.scoreForP1)"
                    }else{
                        self.scoreForP2 += 10
                        self.lblScoreP2.text = "Score: \(self.scoreForP2)"
                    }
                    
                    remainingImageCounter -= 2
                }else{
                    self.imgArr[self.pickedIndex1].image = UIImage(named: "backofcard")
                    self.imgArr[self.pickedIndex2].image = UIImage(named: "backofcard")
                }
                self.isPlayer1 = !self.isPlayer1
                self.pickedIndex1 = -1
                self.pickedIndex2 = -1
            })
        }
       
    }
}





