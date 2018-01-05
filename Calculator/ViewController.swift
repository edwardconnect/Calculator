//
//  ViewController.swift
//  Calculator
//
//  Created by Edward on 21/12/2017.
//  Copyright © 2017 Edward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Adding lazy can allow "game" is made when it is fully iniialized
    
    lazy var game = Concentration(numberOfPairsOfCards: 4)
    
    var filpCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(filpCount)"
        }
    }
    
    var emojiChoices = ["👻","👾","🙈","🙊"]
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was no in cardButtons")
        }

        filpCount += 1
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            //card = game.cards is passed by reference
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ?#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 0):#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
        }
    }
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
}

	
