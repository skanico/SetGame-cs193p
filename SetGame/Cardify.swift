//
//  Cardify.swift
//  Memorize
//
//  Created by Nicolas Ska on 07/06/2020.
//  Copyright © 2020 Nicolas Ska. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    var rotation: Double
    var isSelected: Bool
    
    init(isFaceUp: Bool, isSelected: Bool) {
        rotation = isFaceUp ? 0 : 180
        self.isSelected = isSelected
    }

    var isFaceUp: Bool {
        rotation < 90
    }

    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
    private let selectedEdgeLineWidth: CGFloat = 5
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: isSelected ? selectedEdgeLineWidth : edgeLineWidth)
                content
            }
        }
//        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
    }
}

extension View {
    func cardify(isFaceUp: Bool, isSelected: Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: true, isSelected: isSelected))
    }
}
