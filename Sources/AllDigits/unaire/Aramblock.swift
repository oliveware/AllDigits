//
//  Aramblock.swift
//  Unicalc
//
//  Created by Herve Crespel on 02/09/2022.
//

import SwiftUI

enum Aramstyle {
    case egypt
    case méso
    case minos
    case palmyre
}

struct Aramblock: View {
    var value = 3
    var size :CGFloat = 3
    var color = Color("glyph")
    var style = Aramstyle.egypt
    
    var set: [[Glypath]] {
        switch style {
        case .egypt:
            return aramegypt
        case .méso:
            return arameso
        case .minos:
            return minoan
        case .palmyre:
            return aramegypt
        }
    }
    
    var body: some View {

            Glyshape(value:value,size:size,set:set)

    }
}

struct Aramblock_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ForEach ( 1...9 , id: \.self) { v in
                HStack {
                    Aramblock(value:v)
                    Aramblock(value:v, style:.méso)
                    Aramblock(value:v, style:.minos)
                }
            }
        }
    }
}
