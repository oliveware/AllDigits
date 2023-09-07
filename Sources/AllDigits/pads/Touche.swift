//
//  SwiftUIView.swift
//  
//
//  Created by Herve Crespel on 05/09/2023.
//

import SwiftUI
import Digiconf

struct Touche: View {
    var index:Int = 3
    var numeration:Numeration = Numeration(.global,10)
    
    var width: CGFloat = 70
    var height: CGFloat = 100
    
    @Binding var chiffres: Chiffres
    @Binding var power:Int
    
    var body: some View {
        Button( action: {input(index)} )
            { Chiffre(
                index: index,
                numeration:numeration,
                power:power,
                config: Conf.pad.size(width,height)
                )
            }
            .modern(w: width, h:height)
             //   .keyboardShortcut(key)
            .disabled(index==0 && chiffres.empty)
    }
    

    
    func input (_ value:Int) {
        let max = numeration.powermax
        if max > 0 {
            power = max - chiffres.values.count
        } else {
            power = 0
        }
        if numeration.iscunei {
            chiffres.compose60( numeration.iscuneiten ? value * 10 : value)
        } else {
            chiffres.add(value)
        }
    }
}

struct Touche_Previews: PreviewProvider {
    static var previews: some View {
        Touche(chiffres:.constant(Chiffres()), power:.constant(0))
    }
}
