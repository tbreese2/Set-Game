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
    private var matchedCardsDeckEmpty: [Int]
    
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
    
    mutating func deselectCards() {
        indexsOfSelectedCards = [Int]()
    }
    
    mutating func selectCard(index: Int) {
        indexsOfSelectedCards.append(index)
    }
    
    func cardSelected(index: Int) -> Bool {
        return indexsOfSelectedCards.contains(index)
    }
    
    //deal function will deal 12 cards if non have been delt, and then will deal 3 more if cards are still on table
    //will go until all cards aree delt, but theres no point in calling after there are no more cards in the deck
    //so check the deckcount before calling
    mutating func dealCards() {
        if (self.cardsOnTableCount() == 0) {
            for _ in 0..<12 {
                cardsOnTable.append(deck.removeFirst())
            }
        } else {
            for _ in 0..<3 {
                cardsOnTable.append(deck.removeFirst())
            }
        }
    }
    
    //will replace cards if they match, else, it will just
    mutating func replaceMatchCards(firstIndex: Int, secondIndex: Int, thirdIndex: Int) {
        if (deck.count >= 3) {
            cardsOnTable[firstIndex] = deck.removeFirst()
            cardsOnTable[secondIndex] = deck.removeFirst()
            cardsOnTable[thirdIndex] = deck.removeFirst()
        } else {
            matchedCardsDeckEmpty.append(firstIndex)
            matchedCardsDeckEmpty.append(secondIndex)
            matchedCardsDeckEmpty.append(thirdIndex)
        }
    }
    
    //checks to see if a card should be drawn
    func canUseCard(index: Int) -> Bool {
        return !matchedCardsDeckEmpty.contains(index)
    }
    
    //returns card on table at specific index
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
        matchedCardsDeckEmpty = [Int]()
        fillDeck()
        deck.shuffle()
    }
}
