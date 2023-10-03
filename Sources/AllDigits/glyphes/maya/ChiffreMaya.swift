//
//  ChiffreMaya.swift
//  multikalk
//
//  Created by Herve Crespel on 23/11/2021.
//

import SwiftUI
import Digiconf





struct ChiffreMaya: View {
    
    var index = 15
    var config: Digiconfig
    
    var body: some View {
        VStack(alignment:.center, spacing:config.haut*0.5){
            if index == 0 {
                ChiffreImage(name:"zeromaya",
                             config:config, offset:(config.large/5,-config.haut/3))
            } else {
                CircleRow(nc: index % 5,
                          size: config.large, color:config.fore)
                BarStack(nb: (index - index % 5) / 5, spacing:config.haut*0.5,
                         size: config.large, color: config.fore)
            }
        }.frame(width: config.large*6, height: config.haut*6, alignment: .bottom)
        .padding(config.large/3)
        .background(config.mid)
        
    }
}

struct ChiffreMaya_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            ChiffreMaya(index:0, config:Digiconfig())
            ChiffreMaya(index:16, config:Digiconfig())
        }
    }
}


