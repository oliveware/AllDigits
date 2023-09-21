//
//  DynaDigit.swift
//  Knownbers
//
//  Created by Herve Crespel on 08/05/2022.
//

import SwiftUI
import Hexaglyphes
import Digiconf

public struct Chiffre: View {
    // valeur du chiffre dans la base et rang dans touches
    var index = 7
    var classifier : String = ""
    var numeration : Numeration
    var power: Int = 4
    var config: Digiconfig
    
   public var body: some View {
       if index < numeration.base {
           switch numeration.graphism {
               // case aztek
           case .bibi:
               Glyshape(index: index, color:config.lun,
                        weight:5,
                        set:bibibinaire)
               .frame(width: config.large, height: config.haut)
               .background(config.fond)
           case .maya:
               ChiffreMaya(index: index, config: config.scale(0.15))
           case .yiking:
               ChiffreHexa(index, config.scale(0.9), .yijing)
           case .none:
               Chiffretext(numeration:numeration,
                           power:power,
                           index:index,
                           config:config)
           }
       } else {
           Text("?")
       }
    }
}

struct Chiffretext: View {
    var symbols : [String]
    var index: Int
    var conf: Digiconfig

    
    init(numeration:Numeration, power:Int, index: Int, config: Digiconfig) {
        self.symbols = numeration.symbols(power)
        self.index = index
        self.conf = config.scale(0.7 * numeration.scale)
    }
    
    var body : some View {
        Text(symbols[index])
            .font(conf.font)
            .fontWeight(conf.weight)
            .frame(height:conf.haut)
    }
}

struct Chiffre_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Chiffre(numeration:Numeration(.farsi,10), config: Digiconfig())
            Chiffre(numeration:Numeration(.hanzi,10), config: Digiconfig())
            Chiffre(numeration:Numeration(.kanji,10), config: Digiconfig())
            Chiffre(numeration:Numeration(.kor,10), config: Digiconfig())
            Chiffre(numeration:Numeration(.telugu,10), config: Digiconfig())
            Chiffre(numeration:Numeration(.bibi,16), config: Digiconfig())
            Chiffre(numeration:Numeration(.maya,20), config: Digiconfig())
            Chiffre(numeration:Numeration(.yiking,64), config: Digiconfig())
        }
    }
}
