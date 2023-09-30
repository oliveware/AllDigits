//
//  NumiChooser.swift
//  multikalk
//
//  Created by Herve Crespel on 10/02/2022.
//

import SwiftUI

struct NumiChooser: View {
    @Binding var numeration:Numeration
    @Binding var nombre:Chiffres
    
    var height:CGFloat = 300
    var w:CGFloat = 300
    var h:CGFloat = 25
    
    var closable = true
    
    var choice : [Numicodeset] {
       return [
        Numicodeset(.live).othercodes([numeration.numicode]),
        Numicodeset(.artificial).othercodes([numeration.numicode]),
        Numicodeset(.antik).othercodes([numeration.numicode]),
        ]
    }
    
    var body: some View {
        GroupBox(label:Text("chiffres").font(.title2)){
            HStack {
                ForEach(0..<choice.count, id: \.self) {
                    s in
                    VStack {
                        Text(choice[s].name)
                        
                        ScrollView {
                            VStack(spacing:2){
                                ForEach(0..<choice[s].set.count, id: \.self) {
                                    index in
                                    Button(choice[s].set[index].rawValue) {
                                        choose(s, index)
                                    }.param(w: w*0.3, h: h*0.5)
                                }
                            }.frame(alignment: .center)
                        }
                    }.frame(width: w*0.35)
                }
        }.frame(alignment: .center)
        .padding(10)
        }.padding(20)
    }
        
    func choose(_ set:Int,_ choix:Int){
        numeration.change( choice[set].set[choix], numeration.base)
        nombre.change(numeration.base)
    }
}

struct NumiChooser_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NumiChooser(
                numeration:.constant(Numeration(.global, 10)),
                nombre:.constant(Chiffres(125)))
        }
        

    }
}
