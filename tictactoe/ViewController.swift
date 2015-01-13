//
//  ViewController.swift
//  tictactoe
//
//  Created by Ekrem Doğan on 13.01.2015.
//  Copyright (c) 2015 Ekrem Doğan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var turn = 1
    var winner = 0
    
    @IBOutlet var winnerText: UILabel!
    
    @IBOutlet var restartButton: UIButton!
    // 0 = empty, 1 = nought, 2 = cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    @IBAction func buttonPressed(sender: AnyObject) {
        if gameState[sender.tag] == 0 && winner == 0{
            
            var image = UIImage()
            
            if turn%2 == 0 {
                // cross
                gameState[sender.tag] = 2
                image = UIImage(named: "cross.png")!
            }
            else {
                // nought
                gameState[sender.tag] = 1
                image = UIImage(named: "nought.png")!
            }
            
            for combination in winningCombinations {
                if (gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[0]] != 0) {
                    winner = gameState[combination[0]]
                }
            }
            
            if winner != 0 {
                if winner == 1 {
                    winnerText.text = "Noughts Won!"
                }
                else {
                    winnerText.text = "Crosses Won!"
                }
                UIView.animateWithDuration(0.5, animations: {
                    self.winnerText.alpha = 0.85
                    self.restartButton.enabled = true
                    self.restartButton.alpha = 0.85
                })
            }
            
            turn++
            sender.setImage(image, forState: .Normal)
        }
    }
    @IBAction func restartPressed(sender: AnyObject) {
        winner = 0
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        turn = 1
        
        winnerText.alpha = 0
        restartButton.enabled = false
        restartButton.alpha = 0
        
        var button:UIButton
        for var i = 0; i < 9; i++ {
            button = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState: .Normal)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        winnerText.alpha = 0
        restartButton.enabled = false
        restartButton.alpha = 0
    }


}

