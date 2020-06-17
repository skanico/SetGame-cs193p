//
//  Squiggle.swift
//  SetGame
//
//  Created by Nicolas Ska on 13/06/2020.
//  Copyright © 2020 Nicolas Ska. All rights reserved.
//

import SwiftUI

struct Squiggle: Shape {
    func path(in rect: CGRect) -> Path {
        
        // MARK: TODO : replace rectangle by real squiggle

        var p = Path()
        
        p.addRect(rect)
                
        return p
    }
}
