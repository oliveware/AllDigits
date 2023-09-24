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
    var clavier:[String] = Decimal.arab
    var graphism:Graphism?
    
    var width: CGFloat = 70
    var height: CGFloat = 100
    var config = Digiconfig()
    var scale: CGFloat = 1
    
    @Binding var chiffres: Chiffres
    var cuneiten = false
    var cuneiunit = false
    
    var body: some View {
        Button( action: {input(index)} )
        {   if graphism != nil {
            Chiffregraphic(
                index: index,
                graphism:graphism!,
                config: config.size(width,height)
            )
            } else {
                Chiffreunicode(symbol:clavier[index],
                    config: config.scale(0.7 * scale)
                )
            }
        }
        .modern(w: width, h:height)
         //   .keyboardShortcut(key)
        .disabled(index==0 && chiffres.empty)
    }
    

    
    func input (_ value:Int) {

        if cuneiten || cuneiunit {
            chiffres.compose60( cuneiten ? value * 10 : value)
        } else {
            chiffres.add(value)
        }
    }
}

struct Touche_Previews: PreviewProvider {
    static var previews: some View {
        Touche(chiffres:.constant(Chiffres()))
    }
}
