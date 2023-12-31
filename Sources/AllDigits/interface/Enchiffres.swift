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
    var dekavalcaption = true
    
    public init(_ conf:Digiconfig,_ chiffres:Chiffres, _ numeration: Numeration = Numeration(.global, 10), _ dekaption: Bool = true) {
        self.numeration = numeration
        self.chiffres = chiffres
        config = conf
        dekavalcaption = dekaption
    }
    
    public var body: some View {
        VStack (alignment:.trailing) {
            if numeration.numicode == .maya || numeration.numicode == .aztek {
                VStack {
                    ForEach(0..<chiffres.values.count, id:\.self) {
                        power in
                        Chiffre(
                            powermax: chiffres.values.count - 1,
                            power: power,
                            index: chiffres.values[power],
                            numeration: numeration,
                            config: config.scale(numeration.scale)
                        )
                    }
                }
            } else {
                HStack(spacing:2) {
                    switch numeration.numicode {
                    case .cister :
                        ForEach(chiffres.grouper(par:4,10000), id:\.self) {
                            groupe in
                            Cistercien(groupe.values, config)
                        }

                    default:
                        ForEach(0..<chiffres.values.count, id:\.self) {
                            power in
                            Chiffre(
                                powermax: chiffres.values.count - 1,
                                power: power,
                                index: chiffres.values[power],
                                numeration: numeration,
                                config: config
                            )
                        }
                    }
                }.frame(height: config.haut)
            }
            if dekavalcaption && !chiffres.empty { Text("\(chiffres.global10)").font(.caption) }
        }
    }
}

#Preview {
    HStack {
        VStack {
            Enchiffres(Digiconfig(30, 30, 10, .pink, .clear), Chiffres(5979, 20), Numeration(.maya,20))
            Enchiffres(Digiconfig(30, 30, 10, .pink, .clear), Chiffres(8979, 20), Numeration(.aztek,20))
        }
        VStack {
            Enchiffres(Digiconfig(80, 30, 5, .white, .black), Chiffres(579, 10), Numeration(.kor,10))
            Enchiffres(Digiconfig(80, 30, 10, .blue, .clear), Chiffres(578979, 10), Numeration(.brahmi,10))
        //    Enchiffres(Digiconfig(10, 20, 10, .cyan, .clear), Chiffres(8979, 5), Numeration(.shadok5,5))
            
            
            Enchiffres(Digiconfig(50, 30, 10, .purple, .clear), Chiffres(578979, 10), Numeration(.alpha,10))
            Enchiffres(Digiconfig(20, 25, 10, .brown, .clear), Chiffres(578979, 16), Numeration(.bibi,16))
            Enchiffres(Digiconfig(60, 25, 10, .yellow, .clear), Chiffres(8972, 10), Numeration(.cister,10))
            Enchiffres(Digiconfig(30, 30, 10, .green, .clear), Chiffres(578979, 60), Numeration(.babylon,60))
        }.padding()
        
    }
    
}
