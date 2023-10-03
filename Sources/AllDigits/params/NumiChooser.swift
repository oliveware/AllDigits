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
    
    var width :CGFloat = 300
    var height:CGFloat = 300
    var h:CGFloat = 20
    
    var closable = true
    
    var choice : [Numicodeset] {
       return [
        Numicodeset(.live).othercodes([numeration.numicode]),
        Numicodeset(.artificial).othercodes([numeration.numicode]),
        Numicodeset(.ancient).othercodes([numeration.numicode]),
        ]
    }
    
    var body: some View {
        GroupBox(label:Text("chiffres").font(.title2)){
            HStack {
                ForEach(0..<choice.count, id: \.self) {
                    s in
                    VStack {
                        Text(choice[s].name)
                        if numeration.numicode == .global && s == 0 {
                            Button("global") {
                                choose(.global)
                            }.param(w: width/3, h: h)
                        }
                        ScrollView {
                            VStack(spacing:2){
                                ForEach(0..<choice[s].set.count, id: \.self) {
                                    index in
                                    Button(choice[s].set[index].rawValue) {
                                        choose(choice[s].set[index])
                                    }.param(w: width/3, h: h)
                                }
                            }.frame(alignment: .center)
                        }.frame(height:height)
                    }
                }
        }.frame(alignment: .center)
        .padding(10)
        }.padding(20)
    }
        
    func choose(_ numic:Numicode){
        numeration.change(numic , numeration.base)
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
