//
//  ViewController.swift
//  CardGame
//
//  Created by JEN Lee on 2021/01/18.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards: Int {
        get { return (CardButtons.count + 1) / 2 }
    } //compute property
    
    
    //didSet X
    
    var flipCount = 0 { didSet { countLabel.text = "Count : \(flipCount)"} }
    private var themeBackgroundColor: UIColor?
    private var themeCardColor: UIColor?
    private var themeEmojis: [String]?
   
    private let halloweenTheme = theme.init(backgroundColor: .black, Emojis: ["💋","🐽","🐤","🐶","👑","🦄"], cardColor: .orange)
    private let loveTheme = theme.init(backgroundColor: .systemPink, Emojis: ["💋","♥️","💕","🐶","💛","🦄"], cardColor: .purple)
    private let happyTheme = theme.init(backgroundColor: .green, Emojis: ["🍰","♥️","🌟","😊","🌈","☘️"], cardColor: .orange)
    
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet var CardButtons: [UIButton]!
    
    @IBOutlet weak var newButton: UIButton!
    
    
    
    @IBAction func NewGameTapped(_ sender: UIButton) {
        flipCount = 0
        game = Concentration(numberOfPairsOfCards: (CardButtons.count + 1) / 2)
        updateViewFromModel()
        setTheme()
    }
    
    
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
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : themeCardColor }
        }
    }
    
    func setTheme() {
        let themes: [theme] = [halloweenTheme, loveTheme]
        let random = Int(arc4random_uniform(UInt32(themes.count)))
        
        themeBackgroundColor = themes[random].backgroundColor
        themeCardColor = themes[random].cardColor
        themeEmojis = themes[random].Emojis
        
        view.backgroundColor = themeBackgroundColor
        countLabel.textColor = themeCardColor
    }
    
    var emojiDic = [Int:String]()

    func emoji(for card: Card) -> String {
        if emojiDic[card.identifier] == nil, themeEmojis?.count ?? 0 > 0 {
            emojiDic[card.identifier] = themeEmojis?.remove(at: themeEmojis!.count.arc4random)
        }
        //딕셔너리 안에 없을 수 있으니! 딕셔너리에서 무언갈 찾으면 옵셔널 리턴.
        return emojiDic[card.identifier] ?? "?"
    }


}


extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    
    }
}
