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
    private var score: Int
    
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
    
    private func selectedAreSet() -> Bool {
        //true of all if all arrays of properties are property sets
        let shapePropArr = [cardsOnTable[indexsOfSelectedCards[0]].getShape(), cardsOnTable[indexsOfSelectedCards[1]].getShape(), cardsOnTable[indexsOfSelectedCards[2]].getShape()]
        let shapeColorArr = [cardsOnTable[indexsOfSelectedCards[0]].getColor(), cardsOnTable[indexsOfSelectedCards[1]].getColor(), cardsOnTable[indexsOfSelectedCards[2]].getColor()]
        let shapeSymbolCountArr = [cardsOnTable[indexsOfSelectedCards[0]].getSymbolCount(), cardsOnTable[indexsOfSelectedCards[1]].getSymbolCount(), cardsOnTable[indexsOfSelectedCards[2]].getSymbolCount()]
        let shapeShadingArr = [cardsOnTable[indexsOfSelectedCards[0]].getShading(), cardsOnTable[indexsOfSelectedCards[1]].getShading(), cardsOnTable[indexsOfSelectedCards[2]].getShading()]
        
        //check if they are all property sets
        return shapePropArr.isPropertySet() && shapeColorArr.isPropertySet() && shapeShadingArr.isPropertySet() && shapeSymbolCountArr.isPropertySet()
    }
    
    private mutating func deselectCards() {
        indexsOfSelectedCards = [Int]()
    }
    
    mutating func selectCard(index: Int) {
        if matchedCardsDeckEmpty.count == 21 && indexsOfSelectedCards.count == 2 {
            matchedCardsDeckEmpty.append(indexsOfSelectedCards.removeFirst())
            matchedCardsDeckEmpty.append(indexsOfSelectedCards.removeFirst())
            matchedCardsDeckEmpty.append(index)
            score += 1
        } else if indexsOfSelectedCards.contains(index) {
            indexsOfSelectedCards.remove(at: indexsOfSelectedCards.firstIndex(of: index)!)
        } else if indexsOfSelectedCards.count < 3 {
            if !indexsOfSelectedCards.contains(index) {
                indexsOfSelectedCards.append(index)
            }
        } else {
            if !indexsOfSelectedCards.contains(index) {
                if selectedAreSet() { 
                    replaceMatchCards()
                    score += 1
                } else {
                    score -= 1
                }
                indexsOfSelectedCards = [Int]()
                indexsOfSelectedCards.append(index)
            }
        }
    }
    
    func cardSelected(index: Int) -> Bool {
        return indexsOfSelectedCards.contains(index)
    }
    
    //deal function will deal 12 cards if non have been delt, and then will deal 3 more if cards are still on table
    //will go until all cards aree delt, but theres no point in calling after there are no more cards in the deck
    //so check the deckcount before calling
    mutating func dealCards() {
        if self.cardsOnTableCount() == 0 {
            for _ in 0..<12 {
                cardsOnTable.append(deck.removeFirst())
            }
        } else if cardsOnTable.count < 24 {
            for _ in 0..<3 {
                cardsOnTable.append(deck.removeFirst())
            }
        }
    }
    
    //will replace cards if they match. Will make them unusable if there are not cards
    private mutating func replaceMatchCards() {
        let firstIndex = indexsOfSelectedCards[0]
        let secondIndex = indexsOfSelectedCards[1]
        let thirdIndex = indexsOfSelectedCards[2]
        if deck.count >= 3 {
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
    
    func getScore() -> Int {
        return score
    }
    
    func gameOver() -> Bool {
        if deckCount() == 0 && cardsOnTableCount() != 0 {
            for index in cardsOnTable.indices {
                if canUseCard(index: index) { return false }
            }
            return true
        }
        return false
    }
    
    init() {
        score = 0
        deck = [Card]()
        cardsOnTable = [Card]()
        indexsOfSelectedCards = [Int]()
        matchedCardsDeckEmpty = [Int]()
        fillDeck()
        deck.shuffle()
    }
}

extension Array where Element: Equatable {
    func isPropertySet() -> Bool {
        var allEqual = true
        for element in self {
            for element2 in self {
                if !(element == element2) { allEqual = false }
            }
        }
        if allEqual == true { return true }
        var allNotEqual = true
        for element in self.indices {
            for element2 in self.indices {
                if self[element] == self[element2], element != element2 { allNotEqual = false }
            }
        }
        if allNotEqual == true { return true }
        return false
    }
}
