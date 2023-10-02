//
//  Unartext.swift
//  Unicalc
//
//  Created by Herve Crespel on 06/08/2022.
//

import SwiftUI

struct Unartext: View {
    var value = 3
    var size :CGFloat = 20
    var color = Color.brown
    var style = Numicode.unarbat
    
    func fontsize(_ glyph: String) -> CGFloat {
        glyph == "|" ? size*4 : size*4.9
    }
    func symbol(_ glyph: String) -> Text {
        Text(glyph)
            .font(Font(CTFontCreateUIFontForLanguage(.system, fontsize(glyph),  nil)! ))
            .fontWeight( glyph == "|" ? Font.Weight.bold : Font.Weight.regular)
            .foregroundColor(color)
            .baselineOffset(glyph == "|" ? 0 : size * -0.6)
    }
    
    var body: some View {
        switch value {
        case 1...4:
            HStack(spacing:size*0.2) {
                ForEach(0..<value, id: \.self) {
                    _ in
                    symbol("|")
                }
            }
        case 5:
            symbol("V")
        case 6...9:
            HStack(spacing:size*0.1) {
                Unartext(value: 5, size: size, color: color, style: style)
                Unartext(value: value-5, size: size, color: color, style: style)
            }
        case 10:
            if style == .unarV {
                HStack(spacing:size*0.2) {
                    symbol("V")
                    symbol("V")
                }
            } else {
                symbol("X")
            }

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
                    
                    Unartext(value: i + 5*line)
                    .frame(width: 120, height: 100)
                    .background(.clear)
                }
            }
        }
    }
}
