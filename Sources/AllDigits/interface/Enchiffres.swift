//
//  SwiftUIView.swift
//  
//
//  Created by Herve Crespel on 30/09/2023.
//

import SwiftUI
import Digiconf

// Interface du package

// nombre écrit avec les chiffres de la numération
public struct Enchiffres: View {
    var numeration : Numeration
    var chiffres: Chiffres
    var config: Digiconfig
    var graphic = false
    var dekavalcaption = true
    
    public init(_ conf:Digiconfig,_ chiffres:Chiffres, _ numeration: Numeration = Numeration(.global, 10), _ dekaption: Bool = true) {
        self.numeration = numeration
        graphic = numeration.graphism != nil
        self.chiffres = chiffres
        config = conf
        dekavalcaption = dekaption
    }
    
    public var body: some View {
        VStack (alignment:.trailing) {
            HStack(spacing:0) {
                if numeration.numicode == .cister {
                    ForEach(chiffres.engroupes(4,10000), id:\.self) {
                        groupe in
                        Cistercien(groupe.values, config)
                    }
                } else {
                    ForEach(0..<chiffres.values.count, id:\.self) {
                        power in
                        if graphic {
                            Chiffregraphic(
                                index:chiffres.values[power],
                                graphism:numeration.graphism!,
                                config: config
                            )
                        } else {
                            Chiffreunicode(
                                symbol:numeration.chiffre(chiffres.values.count - 1 , power, chiffres.values[power]),
                                config: config
                            )
                        }
                    }
                }
            }.frame(height: config.haut)
            if dekavalcaption && !chiffres.empty { Text("\(chiffres.global10)") }
        }
    }
}

#Preview {
    VStack {
        Enchiffres(Digiconfig(20, 30, 5, .white, .black), Chiffres(579, 10), Numeration(.hanzi,10))
        Enchiffres(Digiconfig(30, 50, 10, .blue, .clear), Chiffres(578979, 10), Numeration(.brahmi,10))
    //    Enchiffres(Digiconfig(10, 20, 10, .cyan, .clear), Chiffres(8979, 5), Numeration(.shadok5,5))
        
        Enchiffres(Digiconfig(20, 20, 10, .pink, .clear), Chiffres(578979, 20), Numeration(.maya,20))
        Enchiffres(Digiconfig(30, 30, 10, .purple, .clear), Chiffres(578979, 10), Numeration(.alpha,10))
        Enchiffres(Digiconfig(20, 25, 10, .brown, .clear), Chiffres(578979, 16), Numeration(.bibi,16))
        Enchiffres(Digiconfig(20, 25, 10, .brown, .clear), Chiffres(8979, 10), Numeration(.cister,10))
    }.padding()
    
}
