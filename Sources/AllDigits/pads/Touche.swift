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
    
    var width: CGFloat = 30
    var height: CGFloat = 30
    
    @Binding var chiffres: Chiffres
    @State var power:Int = 0
    
    var config:Digiconfig {
        var conf = Conf.show
        conf.size(width, height)
        return conf
    }
    
    var body: some View {
        Button( action: {input(index)} )
            { Chiffre(
                index: index,
                numeration:numeration,
                config: config
                )
            }
            .modern(w: width*3, h:height*3)
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
        chiffres.add(value)
    }
}

struct Touche_Previews: PreviewProvider {
    static var previews: some View {
        Touche(chiffres:.constant(Chiffres()))
    }
}
