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
    var clavier:[String] = Dekaval.kannada
    var graphism:Graphism?
    
    var width: CGFloat = 70
    var height: CGFloat = 100
    var config = Digiconfig()
    var scale: CGFloat = 1
    
    @Binding var chiffres: Chiffres
    var additif = false
    
    var body: some View {
        Button( action: {input(index)} )
        {   if graphism != nil {
            Chiffregraphic(
                index: index,
                graphism:graphism!,
                config: config.size(width*0.5,height*0.5)
            )
            } else {
                Chiffreunicode(symbol:clavier[index],
                    config: config.scale(0.6 * scale)
                )
            }
        }
        .configTouch(config)
        //.modern(w: width, h:height)
         //   .keyboardShortcut(key)
        // lorsque le clavier est additif la touche zéro est toujours active
        .disabled(index==0 && chiffres.empty && !additif)
    }
    
    func input (_ value:Int) {
        chiffres.add(value, additif)
    }
}

struct Touche_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Touche(chiffres:.constant(Chiffres()))
            Touche(index:12,graphism:.bibi, chiffres:.constant(Chiffres()))
            Touche(index:17,graphism:.maya, chiffres:.constant(Chiffres()))
            Touche(index:17,graphism:.yiking, chiffres:.constant(Chiffres()))
        }
    }
}
