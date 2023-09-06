//
//  ChiffreMaya.swift
//  multikalk
//
//  Created by Herve Crespel on 23/11/2021.
//

import SwiftUI
import Hexaglyphes
import Digiconf


struct ChiffreMaya: View {
    
    var index = 15
    var config: Digiconfig
    
    var body: some View {
        if index == 0 {
            Image("zeromaya")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(config.nul)
                .frame(width: config.large*5, height: config.haut*5, alignment: .bottom)
                .padding(config.large/3)
        } else {
            VStack(alignment:.center, spacing:config.haut*0.7){
                CircleRow(nc: index % 5,
                          size: config.large, color:config.lun)
                BarStack(nb: (index - index % 5) / 5,
                         size: config.large, color: config.lun)
            }.frame(width: config.large*6, height: config.haut*6, alignment: .bottom)
                .padding(config.large/3)
                .background(config.fond)
        }
    }
}


