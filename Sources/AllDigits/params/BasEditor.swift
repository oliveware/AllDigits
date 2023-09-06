//
//  BasEditor.swift
//  multikalk
//
//  Created by Herve Crespel on 19/11/2021.
//

import SwiftUI

struct BasEditor: View {
    
    @Binding var numeration:Numeration
    
    var w:CGFloat = 90
    var h:CGFloat = 25
    
    
    var body: some View {
        GroupBox(label:Text("base").font(.title2)) {
            VStack(alignment:.center,spacing: 5) {
               // Text("Base").font(.title2)
                
              /*  Button(action:{face.baselock.toggle()}){
                    Image(systemName:
                            face.baselock ? "lock.fill"  : "lock.open")
                }.fond(w: w, h: h)
                
                if face.notnativebase {
                    Button(action:face.preferredbase){
                        Text("native")
                    }.fond(w: w, h: h)
                }*/
                
                Button(action: inc){
                    Image(systemName: "chevron.up")
                }.fond(w: w, h: h)
                
                Text("base \(numeration.base)")
                    .font(.title2)
                    .frame(width: w)
                
                Button(action: dec){
                    Image(systemName: "chevron.down")
                }.fond(w: w, h: h)
                
            }.frame(width: w+30, alignment: .top)
        }
       /* VStack {
            HStack(spacing: 2) {
                
                if change {
                    Button(action: inc){
                        Image(systemName: "chevron.up")
                    }.param(w: h, h: h)
                }
                
                Button("base " + String(face.base))
                {change.toggle()}
                    .param(w: w * 0.4, h: h)
            
                if change {
                    Button(action: dec){
                        Image(systemName: "chevron.down")
                    }.param(w: h, h: h)
                }
            }.frame(width: w, height: h, alignment: .center)
        }.frame(width: w, alignment: .center)*/
            
    }
    
    func inc() {
        numeration.change(true)
    }
    
    func dec() {
        numeration.change(false)
    }

    
}

struct BasEditor_Previews: PreviewProvider {
    static var previews: some View {
        BasEditor(numeration:.constant(Numeration(.global,10)))
    }
}
