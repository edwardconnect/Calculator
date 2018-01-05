//
//  Card.swift
//  Calculator
//
//  Created by Edward on 29/12/2017.
//  Copyright © 2017 Edward. All rights reserved.
//

import Foundation
//card is UI independent (It is a model but not related to UI
struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    //Static in class/obj is sth like global inside
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
