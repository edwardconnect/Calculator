//
//  Concentration.swift
//  Calculator
//
//  Created by Edward on 29/12/2017.
//  Copyright © 2017 Edward. All rights reserved.
//

import Foundation

class Concentration{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    //initializer
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            // Card() is a struct, so matchingCard is a copy of "card" instead of a reference
            cards += [card, card]
            
        }
    
        
        // TODO: Shuffie the card
//        for cardToBeSwap in 0..<cards.count{
//            let randomIndex = Int(arc4random_uniform(UInt32(cards.count-1)))
//            if cardToBeSwap==randomIndex{
//                continue
//            }else{
//                swap(&cards[cardToBeSwap], &cards[randomIndex])
//            }
//            
//        }

    }
}
