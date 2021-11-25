//
//  Card.swift
//  Set Game
//
//  Created by Tyler S Breese on 11/24/21.
//

import Foundation
import CoreText

//shapes: square, triangle, circle
//colors: red, green, purple
//count: oneSymbol, twoSymbol, threeSymbol
//shading: filled, outlined, striped

struct Card: Equatable {
    //a card contains shape, color, symbolCount and shading
    private let shape: cardProperty
    private let color: cardProperty
    private let symbolCount: cardProperty
    private let shading: cardProperty
    
    init(shape inShape: cardProperty, color inColor: cardProperty, symbolCount inSymbolCount: cardProperty, shading inShading: cardProperty) {
        shape = inShape
        color = inColor
        symbolCount = inSymbolCount
        shading = inShading
    }
    
    func getShape() -> (cardProperty) {
        return shape
    }
    
    func getColor() -> (cardProperty) {
        return color
    }
    
    func getSymbolCount() -> (cardProperty) {
        return symbolCount
    }
    
    func getShading() -> (cardProperty) {
        return shading
    }
    
}

enum cardProperty: Int, Equatable {
    case casePropertyOne = 0
    case casePropertyTwo
    case casePropertyThree
}
