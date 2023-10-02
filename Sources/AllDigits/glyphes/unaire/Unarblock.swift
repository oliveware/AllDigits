//
//  Unarblock.swift
//  Unicalc
//
//  Created by Herve Crespel on 01/08/2022.
//

import SwiftUI

struct Unarblock: View {
    var value = 3
    var size :CGFloat = 10
    var color = Color.brown
    var style = Numicode.unarbat
    
    var body: some View {
        switch value {
        case 1...4:
            HStack(spacing:size*0.5) {
                ForEach(0..<value, id: \.self) {
                    _ in
                    Vbar(size:size, color:color)
                }
            }
        case 5:
            if style == .unarbat || style == .unargat {
                HStack(spacing:size*0.5) {
                    ForEach(1...5, id: \.self) {
                        _ in
                        Vbar(size:size, color:color)
                    }
                }
            } else {  // .barre, .diag:
                ZStack {
                    HStack(spacing:size*0.5) {
                        ForEach(1...4, id: \.self) {
                            _ in
                            Vbar(size:size, color:color)
                        }
                    }
                    if style == .unarbar {
                        Rectangle().fill(color)
                            .frame(width:size*4.5, height: size*0.4)
                    } else {
                        Rectangle().fill(color)
                            .frame(width:size*5, height: size*0.4)
                            .rotationEffect(Angle(degrees: 30))
                    }
                }
            }
        case 6...9:
            HStack(spacing:0) {
                Unarblock(value: 5, size: size, color: color, style: style)
                Unarblock(value: value-5, size: size, color: color, style: style)
            }
        case 10:
            HStack(spacing:0) {
                Rectangle().fill(color)
                    .frame(width:size*4, height: size*0.4)
                    .rotationEffect(Angle(degrees: 70))
                    .offset(x: size*2)
                Rectangle().fill(color)
                    .frame(width:size*4, height: size*0.4)
                    .rotationEffect(Angle(degrees: 110))
                    .offset(x: -size*2)
            }.frame(width:size*3, height:size*5)
        default:
           Text(String(""))
        }
    }
}

#Preview {
    VStack{
        ForEach (0..<2, id:\.self) {
            line in
            HStack(spacing:40) {
                ForEach (1..<6, id:\.self)  {
                    i in
                    if  i + line*5 < 10 {
                        Unarblock(value: i + 5*line)
                        .frame(width: 50, height: 50)
                        .background(.clear)
                    }
                }
            }
        }
    }
}
