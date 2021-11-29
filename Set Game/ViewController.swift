//
//  ViewController.swift
//  Set Game
//
//  Created by Tyler S Breese on 11/24/21.
//


//also, changing it so as long as three cards are selected, they are removed

import UIKit

class ViewController: UIViewController {
    //outlets
    @IBOutlet var cardViewArray: [UIButton]!
    
    @IBOutlet weak var gameButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    //actions
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let cardNumber = cardViewArray.firstIndex(of: sender), game.cardsOnTableCount() != 0, game.canUseCard(index: cardNumber) {
            game.selectCard(index: cardNumber)
            updateViewFromModel()
        }
    }
    @IBAction func gameButtonPressed(_ sender: UIButton) {
        if !game.gameOver() {
            game.dealCards()
            updateViewFromModel()
        } else {
            game = gameBoard()
            game.dealCards()
            updateViewFromModel()
        }
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
    
    //test
    var game = gameBoard()
    
    //functions
    //update functions
    //update veiw from model function
    func updateViewFromModel() {
        //draw cards
        for cardOnTable in 0..<game.cardsOnTableCount() {
            if game.canUseCard(index: cardOnTable) {
                drawCard(index: cardOnTable, selected: game.cardSelected(index: cardOnTable), card: game.getCardOnTable(index: cardOnTable))
            } else {
                eraseCard(index: cardOnTable)
            }
            
        }
        
        //draw score
        if (game.gameOver()) {
            scoreLabel.text = "Final Score: \(game.getScore())"
        } else {
            scoreLabel.text = "Score: \(game.getScore())"
        }
        
        //draw game button
        if (game.deckCount() == 0 && game.cardsOnTableCount() == 0) {
            gameButton.setTitle("Deal 3 More", for: UIControl.State.normal)
        } else if game.gameOver() {
            gameButton.setTitle("New Game", for: UIControl.State.normal)
        } else {
            gameButton.setTitle("Deal 3 More", for: UIControl.State.normal)
        }
        
        
    }
    
    //drawing card functions
    func drawCard (index: Int, selected: Bool, card: Card) {
        //need to draw:
        //whether card visible
        //button selection
        if selected == false {
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


