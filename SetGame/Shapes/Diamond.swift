//
//  Diamond.swift
//  SetGame
//
//  Created by Nicolas Ska on 13/06/2020.
//  Copyright © 2020 Nicolas Ska. All rights reserved.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        
        let top = CGPoint(x: rect.midX, y: rect.maxY)
        let bottom = CGPoint(x: rect.midX, y: rect.minY)
        let right = CGPoint(x: rect.maxX, y: rect.midY)
        let left = CGPoint(x: rect.minX, y: rect.midY)

        var p = Path()
        
        p.move(to: top)
        p.addLine(to: right)
        p.addLine(to: bottom)
        p.addLine(to: left)
        p.addLine(to: top)
        
        return p
    }
}
