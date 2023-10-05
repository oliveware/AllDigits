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
        VStack(spacing:config.haut*0.05){
            if index == 0 {
                ChiffreImage(name:"zeromaya",
                             config:config) //offset:(config.large/5,-config.haut/5))
            } else {
                CircleRow(nc: index % 5,
                          size: config.large*0.15, color:config.fore)
                BarStack(nb: (index - index % 5) / 5, spacing:config.haut*0.05,
                         size: config.large*0.7, color: config.fore)
            }
        }.frame(width: config.large, height: config.haut, alignment: .center)
       // .padding(config.large/3)
        .background(config.mid)
        
    }
}

struct ChiffreMaya_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            ChiffreMaya(index:0, config:Digiconfig())
            ChiffreMaya(index:19, config:Digiconfig())
            Chiffreunicode(symbol:Dekaval.telugu[5], config: Digiconfig())
            Chiffregraphic(graphism:.bibi, config: Digiconfig())
            Chiffregraphic(graphism:.yiking, config: Digiconfig())
            ChiffreBabylonien()
        }
    }
}


