//
//  SwiftUIView.swift
//  
//
//  Created by Herve Crespel on 02/10/2023.
//

import SwiftUI
import Digiconf

struct ChiffreBabylonien: View {
    var index = 20
    var config = Digiconfig().size(30,30)
    
    init(_ index: Int , _ config: Digiconfig) {
        self.index = index
        self.config = config
    }
    
    var body: some View {
        HStack(spacing:0){
            if index == 0 {
                ChiffreImage(name:"Babylon_0",
                             config:config.scale(0.9))
            } else {
            let unit = index % 10
            let ten = (index - unit )
            if ten > 0 {
                ChiffreImage(name:"Babylon_\(ten)",
                             config:config.scale(0.9))
            }
            if unit > 0 {
                ChiffreImage(name:"Babylon_\(unit)",
                                 config:config.scale(0.9))
                }
            }
        }.frame(width:config.large)
        .padding(0)
    }
}

#Preview {
    HStack (spacing:50){
        VStack {
            ForEach (0...2, id:\.self)  {
                l in
                HStack {
                    ForEach (1...2, id:\.self)  {
                        i in
                        if 10*(i + 2*l) < 60 { ChiffreBabylonien(10*(i + 2*l), Digiconfig()) }
                    }
                }
            }
        }
        VStack {
            ForEach (0...2, id:\.self)  {
                l in
            HStack {
                
                    ForEach (1...3, id:\.self)  {
                        i in
                        ChiffreBabylonien(i + 2*l, Digiconfig())
                    }
                }
            }
        }
    }
}


