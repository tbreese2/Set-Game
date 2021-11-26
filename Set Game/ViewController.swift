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
       
    }
    
    @IBAction func mainControlButtonPressed() {
        let game = gameBoard()
        print(game.deckCount())
    }
    
    
    
    //global vars
    //view dictionaries
    //property 1 = ■, property 2 = ●, property 3 = ▲
    private let shapeArr = ["■","●","▲"]
    
    //property 1 = 1, property 2 = 2, property 3 = 3
    private let symbolCountArr = [1, 2, 3]
    
    //property 1 = blue, property 2 = red, property 3 = green
    private let colorArr = [UIColor.blue, UIColor.red, UIColor.green]
    
    //for shadings, each will have their own shadeing
    //property 1 = empty, property 2 = stripped, property 3 = filled
    private func shadeArr(textColor: UIColor, property: Int) -> ([NSAttributedString.Key: Any]) {
        let arr = [[ NSAttributedString.Key.strokeWidth :  3.0, NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.strokeColor: textColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22.0)],
                   [ NSAttributedString.Key.strokeWidth :  0, NSAttributedString.Key.foregroundColor: textColor.withAlphaComponent(0.15), NSAttributedString.Key.strokeColor: textColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22.0)],
                   [ NSAttributedString.Key.strokeWidth :  0 , NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.strokeColor: textColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22.0)]]
        return arr[property]
    }
    
    //functions
    //update functions
    //drawing card functions
    func drawCard (index: Int, selected: Bool, card: Card) {
        //need to draw:
        //whether card visible
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
        
        //text in card
        var tempTitle = ""
        for _ in 0...card.getSymbolCount().rawValue {
            tempTitle += shapeArr[card.getShape().rawValue] + "\n"
        }
        let title = NSAttributedString(string: tempTitle, attributes: shadeArr(textColor: colorArr[card.getColor().rawValue], property: card.getShading().rawValue))
        cardViewArray[index].setAttributedTitle(title, for: UIControl.State.normal)
    }
    
    func eraseCard (index: Int){
        //need to draw:
        //button selection
        cardViewArray[index].layer.borderColor = UIColor.white.cgColor
        
        //text
        cardViewArray[index].setAttributedTitle(NSAttributedString(""), for: UIControl.State.normal)
    }

}


