//
//  ViewController.swift
//  Set Game
//
//  Created by Tyler S Breese on 11/24/21.
//

import UIKit

class ViewController: UIViewController {
    //outlets
    
    @IBOutlet var cardViewArray: [UIButton]!
    
    //actions
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let cardNumber = cardViewArray.firstIndex(of: sender) {
            let tempSelected = cardViewArray[cardNumber].layer.borderColor == UIColor.black.cgColor
            drawCard(index: cardNumber, selected: !tempSelected)
        }
    }
    
    //global vars
    //view dictionaries
    private let shapeDict = [cardShape.square:"■",cardShape.circle:"●",cardShape.triangle:"▲"]
    
    private let symbolCountDict = [cardSymbolCount.oneSymbol:1, cardSymbolCount.twoSymbol:2, cardSymbolCount.threeSymbol: 3]
    
    private let colorDict = [cardColor.blue: UIColor.blue, cardColor.red: UIColor.red, cardColor.green: UIColor.green]
    
    //functions
    //update functions
    //drawing card functions
    func drawCard (index: Int, selected: Bool) {
        //need to draw:
        //button selection
        if selected == true {
            cardViewArray[index].layer.cornerRadius = 4.0
            cardViewArray[index].layer.borderColor = UIColor.black.cgColor
            cardViewArray[index].layer.borderWidth = 3.0
        } else {
            cardViewArray[index].layer.cornerRadius = 4.0
            cardViewArray[index].layer.borderWidth = 3.0
            cardViewArray[index].layer.borderColor = UIColor.blue.cgColor
        }
        //shape, color, symbolCount, shading
        
    }
    
    func eraseCard (index: Int){
        //need to draw:
        //button selection
        cardViewArray[index].layer.borderColor = UIColor.white.cgColor
        //shape, color, symbolCount, shading
        
    }

}

