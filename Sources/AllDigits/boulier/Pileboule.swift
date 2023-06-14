//
//  Pileboule.swift
//  multikalk
//
//  Created by Herve Crespel on 22/11/2021.
//

import SwiftUI

struct Pileboule: View {
    @ObservedObject var pile:Pile
    
    var wb = CGFloat(45)
    var hb = CGFloat(25)
    var color = Color.yellow
    
    var height:CGFloat {
        (hb*1.12 )*(CGFloat(pile.height))
    }
    
    var body: some View {
        
        VStack(spacing: hb*0.05) {
            if pile.actif > 1 {
                ForEach(0..<pile.actif-1, id: \.self) {
                    i in
                    Boule(color: color, width:wb, height:hb)
                }
            }
            
            if pile.actif > 0 {
                Button (action: deactivate) {
                    Boule(color: color, width:wb, height:hb)
                }.boule(w: wb, h: hb)
                    .offset(y:-hb*0.05)
                HStack{}.frame(width:hb,height:hb)
            }
            
            if pile.passif > 0 {
                HStack{}.frame(width:wb, height: pile.actif == 0 ? hb*1.15 : 0)
                Button (action: activate) {
                    Boule(color: color, width:wb, height:hb)
                }.boule(w: wb, h: hb)
                    .offset(y:hb*0.05)
            }
            
            if pile.passif > 1 {
                ForEach(0..<pile.passif - 1, id: \.self) {
                    i in
                    Boule(color: color, width:wb, height:hb)
                }
            }
        }.frame(height:height, alignment: .top)
        .padding(0)
    }
    
    func activate() {
        pile.activate() ? 1 : 0
    }
    
    func deactivate() {
       pile.deactivate() ? -1 : 0
    }
    
}

struct Pileboule_Previews: PreviewProvider {
    static var previews: some View {
        
       VStack(spacing:25) {
            HStack(spacing:10) {
                Text("soroban").padding(.trailing,15)
                Pileboule(pile:Pile(4,0,.enhaut))
                Pileboule(pile:Pile(3,1))
                Pileboule(pile:Pile(2,2))
                Pileboule(pile:Pile(1,3))
                Pileboule(pile:Pile(0,4))
            }.padding(.bottom,25)
            HStack(spacing:5) {
                Text("chinois").padding(.trailing,15)
                Pileboule(pile:Pile(5,0))
                Pileboule(pile:Pile(4,1))
                Pileboule(pile:Pile(3,2))
                Pileboule(pile:Pile(2,3))
                Pileboule(pile:Pile(1,4))
                Pileboule(pile:Pile(0,5))
            }.padding(.bottom,25)
        }
        //    Boulier(boules:[1,4], avechiffres:true)
         //   Boulier(rangs:[2,5])
        //    Boulier(chiffres:[2,3,5,7],rangs:[2,5])
        //    Boulier(rangs:[7,7])
    }
}
