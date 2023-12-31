//
//  CircleRow.swift
//  multikalk
//
//  Created by Herve Crespel on 23/11/2021.
//

import SwiftUI

struct CircleRow: View {
    var nc = 3
    var size : CGFloat = 12
    var color = Color(.yellow)
    
    var circle : some View {
        Circle().fill(color)
            .frame(width:size, height: size)
    }
    
    var body: some View {
        if nc > 0 {
            let rg = 0..<nc
            HStack(spacing:size*0.3) {
                ForEach(rg, id: \.self) {
                    index in
                    circle
                }
            }
        }
    }
}


