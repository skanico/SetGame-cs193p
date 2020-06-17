//
//  SetGame.swift
//  SetGame
//
//  Created by Nicolas Ska on 11/06/2020.
//  Copyright © 2020 Nicolas Ska. All rights reserved.
//

import Foundation

// Model

struct SetGame<Features> {
    
    private(set) var deck: [Card]
    private(set) var dealtCards: [Card]

    init(numberOfCards: Int, cardContentFactory: (Int) -> Features) {
        deck = [Card]()
        dealtCards = [Card]()

        for cardIndex in 0 ..< numberOfCards {
            deck.append(Card(id: cardIndex, features: cardContentFactory(cardIndex)))
        }
        
        deck.shuffle()
        
        // MARK: TODO, remove fixed value of 12
        
        for _ in 0 ..< 12 {
            dealtCards.append(deck.remove(at: deck.startIndex))
        }
    }
    
    private var chosenCards: [Card] {
        dealtCards.filter({$0.isSelected})
    }
    
    private func checkMatch(cards: [Card]) {
        
        let number1 = cards[0].features
        let number2 = cards[1].features
        let number3 = cards[2].features
        
        print(number1)
        print(number2)
        print(number3)
        
        // (cards[0].features.number == cards[1].features.number) && (cards[1].features.number == cards[2].features.number)
        // || (cards[0].features.number != cards[1].features.number) && (cards[1].features.number != cards[2].features.number)
    }
    
    mutating func dealThreeCards() {
        
        // MARK: TODO - check if there is a match --> replace cards (if deck not empty)

        if deck.count > 0 {
            for _ in 0 ..< 3 {
                dealtCards.append(deck.remove(at: deck.startIndex))
            }
        }
    }
    
    mutating func choose(card: Card) {
        
        if chosenCards.count < 3 {
            if let chosenCard = dealtCards.firstIndex(matching: card) {
                dealtCards[chosenCard].isSelected = !dealtCards[chosenCard].isSelected
            }
        } else if chosenCards.count == 3 {
            
            // MARK: TODO - check if match --> replace cards (if deck not empty) & select new card if other than previous set
            // MARK: TODO - check if mismatch --> deselect cards & select new card
            
        }
        
        if chosenCards.count == 3 { // Test if match or mismatch
            checkMatch(cards: chosenCards)
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var features: Features
        var isSelected: Bool = false
        var isMatching: Bool = false
        var isNotMatching: Bool = false
    }
}
