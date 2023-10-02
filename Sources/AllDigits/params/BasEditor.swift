//
//  BasEditor.swift
//  multikalk
//
//  Created by Herve Crespel on 19/11/2021.
//

import SwiftUI

struct BasEditor: View {
    
    @Binding var numeration:Numeration
    @Binding var nombre:Chiffres
    
    var w:CGFloat = 60
    var h:CGFloat = 35
    
    
    var body: some View {
        GroupBox(label:Text("base").font(.title2)) {
            VStack(alignment:.center,spacing: 5) {
               // Text("Base").font(.title2)
                
                Button(action:{numeration.baselock()}){
                    Image(systemName:
                            numeration.baselocked ? "lock.fill"  : "lock.open")
                }.modern(w: w, h: h)
                
                if !numeration.baseisnative {
                    Button(action:{
                        numeration.setbasetonative()
                        nombre.change(numeration.base)
                    })
                    {
                        Text("native")
                    }.modern(w: w, h: h)
                }
                
                Button(action: inc){
                    Image(systemName: "chevron.up")
                }.modern(w: w, h: h)
                .disabled(numeration.baselocked)
                
                Text("base \(numeration.base)")
                    .font(.title2)
                    .frame(width: w)
                
                Button(action: dec){
                    Image(systemName: "chevron.down")
                }.modern(w: w, h: h)
                .disabled(numeration.baselocked)
                
            }.frame(width: w+30, alignment: .top)
        }
            
    }
    
    func inc() {
        numeration.change(true)
        nombre.change(numeration.base)
    }
    
    func dec() {
        numeration.change(false)
        nombre.change(numeration.base)
    }

    
}

struct BasEditor_Previews: PreviewProvider {
    static var previews: some View {
        BasEditor(
            numeration:.constant(Numeration(.global,10)),
            nombre:.constant(Chiffres(125))
        )
    }
}
