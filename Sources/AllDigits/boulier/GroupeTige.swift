//
//  GroupeTige.swift
//  Unicalc
//
//  Created by Herve Crespel on 04/11/2022.
//

import SwiftUI
import Unombres

struct GroupeTige: View {
    
    @ObservedObject var tigroup : Tigroup
    var nbt: Int {tigroup.tiges.count}
    
    var width: CGFloat = 800
    var height: CGFloat = 400
    
    var largeur :CGFloat { width - 200}
    var hauteur :CGFloat { height - 200}
    
    @State var edited = [-1, -1]
    
    var bs:CGFloat = 40
    var body: some View {
        VStack {
            Text(String(tigroup.power))
            HStack(spacing: -2) {
                ForEach(0..<nbt, id: \.self) {
                    tigindex in
                    Interactige(
                        tige:tigroup.tiges[tigindex],
                        width: largeur / CGFloat(nbt),
                        height:hauteur,
                        edited: $edited,
                        avechiffre: true)
                }
            }.frame(height: hauteur+120)
                .padding(0)
        }.frame(height: hauteur+120)
    }
}

struct GroupeTige_Previews: PreviewProvider {
    static var previews: some View {
        GroupeTige(tigroup:Tigroup(Tige([Pile(1,5,.enbas),Pile(5,1,.enhaut)]), 4, 0))
    }
}
