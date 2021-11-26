//
//  gameBoard.swift
//  Set Game
//
//  Created by Tyler S Breese on 11/26/21.
//

import Foundation

struct gameBoard {
    private var deck: [Card]
    private var cardsOnTable: [Card]
    private var indexsOfSelectedCards: [Int]
    
    private mutating func fillDeck() {
        for shape in 0...2 {
            for color in 0...2 {
                for symbolCount in 0...2 {
                    for getShading in 0...2 {
                        deck.append(Card(shape: cardProperty(rawValue: shape)!,color: cardProperty(rawValue: color)!,symbolCount: cardProperty(rawValue: symbolCount)!,shading: cardProperty(rawValue: getShading)!))
                    }
                }
            }
        }
    }
    
    //deal function will deal 12 cards if non have been delt, and then will deal 3 more if cards are still on table
    //will go until all cards aree delt, but theres no point in calling after there are no more cards in the deck
    //so check the deckcount before calling
//    func dealCards() {
//        if (cardsOnTable.count == 0) {
//            
//        }
//    }
    
    func getCardOnTable(index: Int) -> Card {
        return cardsOnTable[index]
    }
    
    func cardsOnTableCount() -> Int {
        return cardsOnTable.count
    }
    
    func deckCount() -> Int {
        return deck.count
    }
    
    init() {
        deck = [Card]()
        cardsOnTable = [Card]()
        indexsOfSelectedCards = [Int]()
        fillDeck()
    }
}
