//
//  Features.swift
//  SetGame
//
//  Created by Nicolas Ska on 16/06/2020.
//  Copyright © 2020 Nicolas Ska. All rights reserved.
//

import Foundation

struct Features {
    
    let number: Number
    let shape: Shape
    let color: Color
    let shading: Shading
    
    enum Number: Int, CaseIterable {
        case one = 1, two, three
    }
    
    enum Shape: CaseIterable {
        case diamond, squiggle, oval
    }
    
    enum Color: CaseIterable {
        case red, green, purple
    }
    
    enum Shading: CaseIterable {
        case solid, striped, open
    }
}
