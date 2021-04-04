//
//  ViewController.swift
//  HelloWorld
//
//  Created by Felipe Sepulveda on 20/04/2020.
//  Copyright © 2020 Felipe Sepulveda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Object from StartViewController
    //var exercises: StartViewController = StartViewController()
    
    var allCards = [String]()
    let num: [Int] = Array(1...13)
    let cardType: [String] = ["Clubs", "Dimonds", "Hearts", "Spades"]
    
    @IBOutlet weak var cardsLeft: UILabel!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var restartText: UILabel!
    @IBOutlet weak var cardPickerButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var cardImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        allCards = createDeck(number: num, cardsType: cardType)
    }
    
    
    func createDeck(number: [Int], cardsType: [String]) -> [String] {
        
        var listCards = [String]()
        
        for number in num {
            for card in cardType {
                listCards.append(card + " " + String(number))
            }
        }
        return listCards
    }
    
    func retrieve() ->String{
        let newList = allCards
                
        let randomCard: String = newList.randomElement() ?? "\(allCards.count) kort igjen"
        
        
        
        if (allCards.isEmpty){
                //restartText.isHidden = false
                cardPickerButton.isHidden = true
                restartButton.isHidden = false
                cardImage.isHidden = true
            }
            else if allCards.contains(randomCard){
                let index = allCards.firstIndex(of: randomCard)
                allCards.remove(at: index!)
                cardImage.image = UIImage(named: randomCard)
            }
        return randomCard
    }
    
    
    @IBAction func retrieveCard(_ sender: UIButton) {
        let randomCard = retrieve()
            
        cardsLeft.text = String(allCards.count)
        mainText.text = randomCard
        
    }
    
    @IBAction func restartButton(_ sender: Any) {
        viewDidAppear(true)
        //restartText.isHidden = true
        cardPickerButton.isHidden = false
        restartButton.isHidden = true
        cardImage.isHidden = false
    }
}
