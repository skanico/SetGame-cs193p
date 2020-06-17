//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Nicolas Ska on 11/06/2020.
//  Copyright © 2020 Nicolas Ska. All rights reserved.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    
    @Published private var game: SetGame<Features> = SetGameViewModel.createSetGame()
    
    static private let numberOfCards = 81
    
    private static func createSetGame() -> SetGame<Features> {
        
        var features = [Features]()
        
        for number in Features.Number.allCases {
            for shape in Features.Shape.allCases {
                for color in Features.Color.allCases {
                    for shading in Features.Shading.allCases {
                        features.append(Features(number: number, shape: shape, color: color, shading: shading))
                    }
                }
            }
        }        
      
        return SetGame<Features>(numberOfCards: numberOfCards) { cardIndex in return features[cardIndex] }
    }
    
//    public struct Features {
//
//        public let number: Number
//        public let shape: Shape
//        public let color: Color
//        public let shading: Shading
//
//        enum Number: Int, CaseIterable {
//            case one = 1, two, three
//        }
//
//        enum Shape: CaseIterable {
//            case diamond, squiggle, oval
//        }
//
//        enum Color: CaseIterable {
//            case red, green, purple
//        }
//
//        enum Shading: CaseIterable {
//            case solid, striped, open
//        }
//    }
        
    func choose(card: SetGame<Features>.Card) {
        // print("card chosen: \(card)")
        game.choose(card: card)
    }

    func dealThreeCards() {
        game.dealThreeCards()
    }
    
    func newGame() {
        game = SetGameViewModel.createSetGame()
    }
    
    var dealtCards: [SetGame<Features>.Card] {
        game.dealtCards
    }
}
