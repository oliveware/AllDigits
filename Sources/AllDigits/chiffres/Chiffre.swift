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
    // puissance du chiffre le plus puissant dans le nombre
    var powermax:Int
    // puissance du chiffre
    var power:Int
    // valeur du chiffre dans la base et rang dans les touches
    var index = 7
    var numeration:Numeration
    var config: Digiconfig
    
    public init(powermax: Int, power: Int, index: Int = 7, numeration: Numeration, config: Digiconfig) {
        self.powermax = powermax
        self.power = power
        self.index = index
        self.numeration = numeration
        self.config = config
    }
    
    public var body: some View {
        Group {
            if numeration.isgraphic {
                Chiffregraphic(
                    index:index,
                    graphism:numeration.graphism!,
                    config: config
                )
            } else {
                Chiffreunicode(
                    symbol:numeration.chiffre(powermax, power, index),
                    config: config
                )
            }
        }
    }
}

public struct Chiffregraphic: View {
    // valeur du chiffre dans la base et rang dans touches
    var index = 7
    var graphism: Graphism
    var config: Digiconfig
    
   public var body: some View {
       
           switch graphism {
           case .aztek:
               ChiffreImage(name: "mayafacial\(index)", config: config, original:true)
           case .babylon:
               ChiffreBabylonien(index, config)
                   .frame(width: config.large*1.7)
           case .bibi:
               Glyshape(index: index, color:config.fore,
                        weight:3,
                        set:bibibinaire)
               .frame(width: config.large, height: config.haut)
               .background(config.mid)
           case .maya:
               ChiffreMaya(index: index, config: config)
           case .yiking:
               ChiffreHexa(index, config.scale(0.9), .yijing)
           }
       
    }
}

struct Chiffreunicode: View {
    var symbol : String
    
    var config: Digiconfig
    
    var body : some View {
        
        if symbol.contains("𐅄") {
            if symbol.count == 1 {
                let substitut = Substitut.find(symbol)
                if substitut.kind == .image {
                    ChiffreImage(name:substitut.name, config:config.scale(substitut.scale))
                }
            } else {
                Chiffrehybride(symbols:split, config:config)
            }
        } else {
            Text(symbol)
                .font(config.font)
                .frame(height:config.haut)
                .foregroundColor(config.fore)
                .background(config.mid)
        }
    }
    
    var split: [Character] {
        var symb = symbol
        var cars : [Character] = []
        while symb.count > 0 {
            cars.append(symb[symb.startIndex])
            symb.remove(at: symb.startIndex)
        }
        return cars
    }
    

}

struct Chiffrehybride: View {
    var symbols: [Character]
    var config:Digiconfig
    var body:some View {
        HStack(spacing:0) {
            ForEach (0..<symbols.count, id:\.self) {
                car in
                Chiffreunicode(symbol:String(symbols[car]), config:config)
            }
            
        }
    }
}

struct Chiffre_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            VStack {
                Chiffreunicode(symbol:Dekaval.farsi[5], config: Digiconfig())
                Chiffreunicode(symbol:Chinois.hanziset[5], config: Digiconfig())
                Chiffreunicode(symbol:Hieroglyph.baton[5], config: Digiconfig().scale(1.5))
                Chiffreunicode(symbol:Chinois.kanji(5,4,5), config: Digiconfig())
                Chiffreunicode(symbol:Chinois.hangeul(5,4,5), config: Digiconfig())
            }
            VStack {
                Chiffreunicode(symbol:Dekaval.telugu[5], config: Digiconfig())
                Chiffregraphic(graphism:.bibi, config: Digiconfig())
                Chiffregraphic(graphism:.maya, config: Digiconfig())
                Chiffregraphic(graphism:.yiking, config: Digiconfig())
                Chiffreunicode(symbol:Grec.acrochiffre(5,4,7), config: Digiconfig(50,50))
            }.frame(width: 150)
            VStack {
                ChiffreImage(name:"mayafacial0",config: Digiconfig(50,50),original:true)
                ChiffreImage(name:"mayafacial1",config: Digiconfig(50,50),original:true)
                Chiffregraphic(graphism:.aztek, config: Digiconfig())
                ChiffreBabylonien(47, Digiconfig())
            }
        }
    }
}
