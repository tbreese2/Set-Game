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
//            let tempSelected = cardViewArray[cardNumber].layer.borderColor == UIColor.black.cgColor
//            drawCard(index: cardNumber, selected: !tempSelected, inString: NSAttributedString(""))
        }
    }
    
    @IBAction func mainControlButtonPressed() {
    }
    
    
    
    //global vars
    //view dictionaries
    private let shapeDict = [cardShape.square:"■",cardShape.circle:"●",cardShape.triangle:"▲"]
    
    private let symbolCountDict = [cardSymbolCount.oneSymbol:1, cardSymbolCount.twoSymbol:2, cardSymbolCount.threeSymbol: 3]
    
    private let colorDict = [cardColor.blue: UIColor.blue, cardColor.red: UIColor.red, cardColor.green: UIColor.green]
    
    //for shadings, each will have their own shadeing
//    private let filled = [ NSAttributedString.Key.foregroundColor : UIColor.blue ]
//    private let outlined = [ NSAttributedString.Key.foregroundColor : UIColor.blue ]
//    private let striped = [ NSAttributedString.Key.foregroundColor : UIColor.blue ]
    private let shadeDict = [cardShading.filled, cardShading.outlined, cardShading.striped]
    
    //functions
    //update functions
    //drawing card functions
    func drawCard (index: Int, selected: Bool, inString: NSAttributedString) {
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
        
        //text
        cardViewArray[index].setAttributedTitle(inString, for: UIControl.State.normal)
    }
    
    func drawInvisibleCard (index: Int){
        //need to draw:
        //button selection
        cardViewArray[index].layer.borderColor = UIColor.white.cgColor
        
        //text
        cardViewArray[index].setAttributedTitle(NSAttributedString(""), for: UIControl.State.normal)
    }

}

