//
//  SetGameView.swift
//  SetGame
//
//  Created by Nicolas Ska on 11/06/2020.
//  Copyright © 2020 Nicolas Ska. All rights reserved.
//

import SwiftUI

struct SetGameView: View {
    
    @ObservedObject var viewModel: SetGameViewModel

    func borderColor(for card: SetGame<Features>.Card) -> Color {
        if (card.isNotMatching) {
            return Color.red
        } else if (card.isMatching) {
            return Color.green
        } else {
            return Color.black
        }
    }
    
    var body: some View {
        
        Group {
            Text("Set Game")
            
            Spacer()
            
            Grid (viewModel.dealtCards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.25)) {
                        self.viewModel.choose(card: card)
                    }
                }
                .aspectRatio(2/3, contentMode: .fit)
                .foregroundColor(self.borderColor(for: card))
                .padding(5)
            }
            .padding()
            
            Spacer()
            
            HStack {
                Button(action: {
                    withAnimation(.easeInOut) {
                        self.viewModel.dealThreeCards()
                    }
                }, label: { Text("Deal 3 more cards") })
                
                // MARK: TODO : disable button if deck empty
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        self.viewModel.newGame()
                    }
                }, label: { Text("New Game") })

            }
        }
    }
}

struct CardView: View {
    var card: SetGame<Features>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    var color: Color {
        switch(card.features.color) {
        case .red:
            return Color.red
        case .green:
            return Color.green
        case .purple:
            return Color.purple
        }
    }
    
    var shading: Double {
        switch(card.features.shading) {
        case .solid:
            return 1.0
        case .striped:
            return 0.3
        case .open:
            return 0.0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        ZStack {
            VStack {
                ForEach(0 ..< card.features.number.rawValue) {_ in
                    if self.card.features.shape == .diamond {
                        ZStack {
                            Diamond().stroke(lineWidth: self.lineWidth).foregroundColor(self.color)
                            Diamond().fill(self.color).opacity(self.shading)
                        }.aspectRatio(self.aspectRatio, contentMode: .fit)
                        } else if self.card.features.shape == .oval {
                        ZStack {
                            Oval().stroke(lineWidth: self.lineWidth).foregroundColor(self.color)
                            Oval().fill(self.color).opacity(self.shading)
                        }.aspectRatio(self.aspectRatio, contentMode: .fit)
                    } else {
                        ZStack {
                            Squiggle().stroke(lineWidth: self.lineWidth).foregroundColor(self.color)
                            Squiggle().fill(self.color).opacity(self.shading)
                        }.aspectRatio(self.aspectRatio, contentMode: .fit)
                    }
                }
            }
            .padding()
            .foregroundColor(color)
        }
        .cardify(isFaceUp: true, isSelected: card.isSelected)
        .transition(AnyTransition.scale)
    }
    
    // MARK: Drawing constants
    
    private let lineWidth: CGFloat = 2.0
    private let aspectRatio: CGFloat = 4/2
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(viewModel: SetGameViewModel())
    }
}
