//
//  Card.swift
//  Set Game
//
//  Created by Tyler S Breese on 11/24/21.
//

import Foundation

//shapes: square, triangle, circle
//colors: red, green, purple
//count: oneSymbol, twoSymbol, threeSymbol
//shading: filled, outlined, striped

struct Card {
    //a card contains shape, color, symbolCount and shading
    private let shape: cardShape
    private let color: cardColor
    private let symbolCount: cardSymbolCount
    private let shading: cardShading
    
    init(shape inShape: cardShape, color inColor: cardColor, symbolCount inSymbolCount: cardSymbolCount, shading inShading: cardShading) {
        shape = inShape
        color = inColor
        symbolCount = inSymbolCount
        shading = inShading
    }
    
    func getShape() -> cardShape {
        return self.shape
    }

    func getColor() -> cardColor {
        return self.color
    }
    
    func getSymbolCount() -> cardSymbolCount {
        return self.symbolCount
    }
    
    func getShading() -> cardShading {
        return self.shading
    }
}

//shapes: square, triangle, circle
//we'll have a dictionary in the main view,
//controller where:
//square, triangle, circle (with associated data)

enum cardShape {
    case square
    case triangle
    case circle
}

//colors: red, green, purple
//we'll have a dictionary in the main view,
//controller where:
//red, green, purple (with associated data)

enum cardColor {
    case red
    case green
    case blue
}

//count: oneSymbol, twoSymbol, threeSymbol
//we'll have a dictionary in the main view,
//controller where:
//oneSymbol, twoSymbol, threeSymbol (with associated data)

enum cardSymbolCount {
    case oneSymbol
    case twoSymbol
    case threeSymbol
}

//shading: filled, outlined, striped
//we'll have a dictionary in the main view,
//controller where:
//filled, outlined, striped (with associated data)

enum cardShading {
    case filled
    case outlined
    case striped
}
