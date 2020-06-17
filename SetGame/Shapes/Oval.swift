//
//  Oval.swift
//  SetGame
//
//  Created by Nicolas Ska on 13/06/2020.
//  Copyright © 2020 Nicolas Ska. All rights reserved.
//

import SwiftUI

struct Oval: Shape {
    func path(in rect: CGRect) -> Path {
        
        // MARK: TODO : replace ellipse by real oval

        var p = Path()
        
        p.addEllipse(in: rect)
                
        return p
    }
}
