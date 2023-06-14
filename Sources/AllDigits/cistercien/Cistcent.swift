//
//  Cistcent.swift
//  Unicalc
//
//  Created by Herve Crespel on 15/07/2022.
//

import SwiftUI

struct Cistcent: View {
    var value = 2
    
    var size: CGFloat = 50
    var color = Color("glyph")
    var finesse: CGFloat {size/10}
    
    var body: some View {
        ZStack {
            if value == 1 || value == 5 || value == 7 || value == 9 {
            Rectangle().fill(color)
                .frame(width:size, height: finesse)
                .offset( y: size/2)
            }
            if value == 3 {
            Rectangle().fill(color)
                    .frame(width:size*sqrt(1.8), height: finesse)
                .rotationEffect(Angle(degrees:135))
            }
            if value == 4 || value == 5 {
            Rectangle().fill(color)
                    .frame(width:size*sqrt(1.8), height: finesse)
                .rotationEffect(Angle(degrees: 45))
            }
            if value == 2 || value == 8 || value == 9 {
                Rectangle().fill(color)
                    .frame(width:size, height: finesse)
                    .offset( y: -(size/2))
            }
            if value == 6 || value == 7 || value == 8 || value == 9 {
                Rectangle().fill(color)
                    .frame(width:finesse, height: size)
                    .offset( x: (size-finesse)/2)
            }

        }.frame(width: size, height: size)
            .offset(x: -finesse)
    }
}

struct Cistcent_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Cistcent(value:1)
            Cistcent(value:2)
            Cistcent(value:3)
            Cistcent(value:4)
            Cistcent(value:5)
            Cistcent(value:6)
            Cistcent(value:7)
            Cistcent(value:8)
            Cistcent(value:9)
        }
    }
}
