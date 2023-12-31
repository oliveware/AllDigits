//
//  BarStack.swift
//  multikalk
//
//  Created by Herve Crespel on 23/11/2021.
//

import SwiftUI

struct BarStack: View {
    var nb = 3
    var spacing: CGFloat = 5
    var size :CGFloat = 10
    var color = Color.brown
    
    var bar: some View {
        Rectangle().fill(color)
            .frame(width:size, height: size*0.2)
    }
    
    var body: some View {
        if nb > 0 {
            let rg = 0..<nb
            VStack(spacing:spacing) {
                ForEach(rg, id: \.self) {
                    index in
                    bar
                }
            }
        }
    }
}


