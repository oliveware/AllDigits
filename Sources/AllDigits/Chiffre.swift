//
//  DynaDigit.swift
//  Knownbers
//
//  Created by Herve Crespel on 08/05/2022.
//

import SwiftUI
import Hexaglyphes
import Digiconf

public struct Chiffregraphic: View {
    // valeur du chiffre dans la base et rang dans touches
    var index = 7
    var graphism: Graphism
    var config: Digiconfig
    
   public var body: some View {
       
           switch graphism {
               // case aztek
           case .bibi:
               Glyshape(index: index, color:config.fore,
                        weight:5,
                        set:bibibinaire)
               .frame(width: config.large, height: config.haut)
               .background(config.back)
           case .maya:
               ChiffreMaya(index: index, config: config.scale(0.15))
           case .yiking:
               ChiffreHexa(index, config.scale(0.9), .yijing)
           }
       
    }
}

struct Chiffreunicode: View {
    var symbol : String
    
    var config: Digiconfig
    
    var body : some View {
        Text(symbol)
            .font(config.font)
            .fontWeight(.bold)
            .frame(height:config.haut)
            .foregroundColor(config.fore)
            .background(config.back)
    }
}

struct Chiffre_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Chiffreunicode(symbol:Decimal.farsi[5], config: Digiconfig())
            Chiffreunicode(symbol:Chinois.hanziset[5], config: Digiconfig())
            Chiffreunicode(symbol:Hieroglyph.baton[5], config: Digiconfig().scale(1.5))
            Chiffreunicode(symbol:Chinois.kanji(5,4,5), config: Digiconfig())
            Chiffreunicode(symbol:Chinois.hangeul(5,4,5), config: Digiconfig())
            Chiffreunicode(symbol:Decimal.telugu[5], config: Digiconfig())
            Chiffregraphic(graphism:.bibi, config: Digiconfig())
            Chiffregraphic(graphism:.maya, config: Digiconfig())
            Chiffregraphic(graphism:.yiking, config: Digiconfig())
        }
    }
}
