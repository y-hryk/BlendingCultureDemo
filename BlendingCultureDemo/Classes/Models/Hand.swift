//
//  Hand.swift
//  BlendingCultureDemo
//
//  Created by yamaguchi on 2016/03/28.
//  Copyright © 2016年 h.yamaguchi. All rights reserved.
//

import UIKit

struct Hand : DataType {

    private let deck = Deck()
    private var cards = [Card]()
 
    init() {
        
    }
    
    private init (deck: Deck, cards: [Card]) {
        self.cards = cards
        print("card\(cards)")
    }
    
    subscript(index: Int) -> Card {
        return cards[index]
    }
    
    var numberOfItems: Int {
        return cards.count
    }

    func addNewItemAtIndex(index: Int) -> Hand {
        return insertItem(deck.nextCard(), atIndex: index)
    }
    
    private func insertItem(card: Card, atIndex index: Int) -> Hand {
        var mutableCards = cards
        print("card\(cards)")
        mutableCards.insert(card, atIndex: index)
        return Hand(deck: deck, cards: mutableCards)
    }

    func deleteItemAtIndex(index: Int) -> Hand {
        var mutableCards = cards
        mutableCards.removeAtIndex(index)
        print("\(mutableCards)")
        print("card\(cards)")
        return Hand(deck: deck,cards: mutableCards)
    }
    
    func moveItem(fromIndex: Int, toIndex: Int) -> Hand {
        return deleteItemAtIndex(fromIndex)
            .insertItem(cards[fromIndex], atIndex: toIndex)
    }
}