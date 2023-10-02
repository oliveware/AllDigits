//
//  UnaryDigit.swift
//  Unicalc
//
//  Created by Herve Crespel on 01/08/2022.
//

import SwiftUI

var unarstyles:[Numicode] = [.unarbat, .unargat, .unarbar, .unardiag, .unarame, .unarV, .unaramh, .unarmino, .unarpalm, .unarcar, .unarX]

struct UnaryDigit: View {
    var value = 3
    var size :CGFloat = 10
    var color = Color.brown
    var style = Numicode.unarbat

    var unit: some View {
        HStack{
            switch style {
            case .unarbar, .unardiag, .unargat, .unarbat:
                Unarblock(value:upb, size:size, color:color, style:style)
            case .unarV, .unarX:
                Unartext(value:upb, size:size, color:color, style:style)
            case .unarcar:
                Glyshape(index:5, weight: 2,
                         set:carunar)
                .frame(width:5*size,height: 5*size)
            case .unarame:
                // correct si value < 20
                Glyshape(index:value > 9 ? value-9 : 0,
                         set:aramegypt)
                .frame(width:6*size,height: 6*size)
                
            default:
                Text(value > 9 ? "?" : "")
            }
        }
    }
    
    var block: some View {
        HStack{
            switch style {
            case .unarbar, .unardiag, .unargat, .unarbat:
                Unarblock(value:nu, size:size, color:color, style:style)
            case .unarV, .unarX:
                Unartext(value:nu, size:size, color:color, style:style)
            case .unarame:
                Glyshape(index:value > 9 ? 10 : nu,
                         set:aramegypt)
                    .frame(width:6*size,height: 6*size)
                    .offset(x:value > 9 ? -size*2.5 : 0, y: 0)
            case .unaramh:
                Glyshape(index:value > 9 ? 10 : value,
                         set:arameso)
                    .frame(width:7*size,height: 7*size)
            case .unarcar:
                Glyshape(index:nu, weight: 2,
                         set:carunar)
                    .frame(width:5*size,height: 5*size)
            case .unarmino:
                Glyshape(index:value, weight: 2,
                         set:minoan)
                .frame(width:7*size,height: 7*size)
            default:
                Text("tbd")
            }
        }
    }
    
    var upb : Int {  // units per block
        (style == .unarX || style == .unarame ) ? 10 : 5
    }
    
    var nu:Int {
        value % upb
    }
    
    var nb:Int {
        (value - nu) / upb
    }
    
    var body: some View {
        HStack(spacing:style == .unarbat ? size/2 : style == .unarcar ? 0 : size) {
            if nb > 0 {
                ForEach(0..<nb, id:\.self) {
                    _ in
                    unit
                }
            }
            if nu >= 0 {
                block
            }
            }
    }

}

