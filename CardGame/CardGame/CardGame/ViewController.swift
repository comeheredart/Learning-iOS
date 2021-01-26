//
//  ViewController.swift
//  CardGame
//
//  Created by JEN Lee on 2021/01/18.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: (CardButtons.count + 1) / 2)
    //didSet X
    
    var flipCount = 0 { didSet { countLabel.text = "Count : \(flipCount)"} }
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet var CardButtons: [UIButton]!

    
    @IBAction func tapButton(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = CardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            //Update View from the model
            updateViewFromModel()
            
        } else {
            print("nil")
        }
    }
    //button & card Match
    func updateViewFromModel() {
        for index in CardButtons.indices {
            let button = CardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1) }
        }
    }
    
    var emoji = [Int:String]()
    
    var emojiChoices = ["💋","🐽","🐤","🐶","👑","🦄"]
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        //딕셔너리 안에 없을 수 있으니! 딕셔너리에서 무언갈 찾으면 옵셔널 리턴.
        return emoji[card.identifier] ?? "?"
    }

}

