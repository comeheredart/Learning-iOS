//
//  Card.swift
//  CardGame
//
//  Created by JEN Lee on 2021/01/18.
//

import Foundation
//UI independent!!!!!!!
//Model, not View

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    
}

