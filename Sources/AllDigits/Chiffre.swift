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
    var power: Int = 0
    var config: Digiconfig
    
   public var body: some View {
       switch numeration.graphism {
        // case aztek
        case .bibi:
            Glyshape(index: index, set:bibibinaire)
                .frame(width: config.large, height: config.haut)
        case .maya:
           ChiffreMaya(index: index, config: config)
        case .yiking:
           ChiffreHexa(index, config, .yijing)
        case .none:
           Chiffretext(symbols:numeration.symbols(power),
                       index:index,
                       classifier:classifier, conf:config)
        }
    }
}

struct Chiffretext: View {
    var symbols : [String]
    var index: Int
    var classifier : String = ""
    var conf: Digiconfig
    
    init(symbols: [String], index: Int, classifier: String, conf: Digiconfig) {
        self.symbols = symbols
        self.index = index
        self.classifier = classifier
        self.conf = conf
    }
    
    var body : some View {
        let symbol = symbols[index]
        Text(symbol + (index == 0 ? "" : classifier))
            .font(conf.font)
            .fontWeight(conf.weight)
    }
}
