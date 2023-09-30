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
    
    public init(_ conf:Digiconfig,_ chiffres:Chiffres, _ numeration: Numeration = Numeration(.global, 10)) {
        self.numeration = numeration
        graphic = numeration.graphism != nil
        self.chiffres = chiffres
        config = conf
    }
    
    public var body: some View {
        VStack (alignment:.trailing) {
            HStack {
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
            }.frame(height: config.haut)
            Text("\(chiffres.global10)")
        }
    }
}

#Preview {
    Enchiffres(Digiconfig(30, 50), Chiffres(579, 10))
}
