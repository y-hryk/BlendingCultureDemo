//
//  Deck.swift
//  BlendingCultureDemo
//
//  Created by yamaguchi on 2016/03/28.
//  Copyright © 2016年 h.yamaguchi. All rights reserved.
//

import UIKit

class Deck {
    private var cards: [Card]
    
    init() {
//        print("\(Suit.allSuits)")
//        print("\(Rank.allRanks)")
//        print("\(Suit.allSuits.map{ suit in Rank.allRanks.map { Card($0, suit)}})")
        
        self.cards = Suit.allSuits
            .map{ suit in
            Rank.allRanks.map { Card($0, suit)}
            }.flatMap{ $0 }
    }
    
    var isEmpty: Bool {
        return cards.isEmpty
    }
    
    func nextCard() -> Card {
        cards = cards.sort { _ in arc4random() < arc4random() }
        print("\(cards.removeLast())")
        return cards.removeLast()
    }
}
