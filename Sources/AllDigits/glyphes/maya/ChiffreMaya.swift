//
//  ChiffreMaya.swift
//  multikalk
//
//  Created by Herve Crespel on 23/11/2021.
//

import SwiftUI
import Hexaglyphes
import Digiconf


extension Image {
    init(resource name: String, ofType type: String) {
        #if canImport(UIKit)
        guard let path = Bundle.module.path(forResource: name, ofType: type),
              let image = UIImage(contentsOfFile: path) else {
            self.init(name)
            return
        }
        self.init(uiImage: image)
        #elseif canImport(AppKit)
        guard let path = Bundle.module.path(forResource: name, ofType: type),
              let image = NSImage(contentsOfFile: path) else {
            self.init(name)
            return
        }
        self.init(nsImage: image)
        #else
        self.init(name)
        #endif
    }
}


struct ChiffreMaya: View {
    
    var index = 15
    var config: Digiconfig
    let zeromaya = Bundle.module.path(forResource: "zeromaya", ofType: "png")
    
    var body: some View {
        if index == 0 {
            Image(resource:"zeromaya", ofType:"png")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(config.fore)
                .frame(width: config.large*5, height: config.haut*5, alignment: .bottom)
                .padding(config.large/3)
                .background(config.mid)
        } else {
            VStack(alignment:.center, spacing:config.haut*0.7){
                CircleRow(nc: index % 5,
                          size: config.large, color:config.fore)
                BarStack(nb: (index - index % 5) / 5,
                         size: config.large, color: config.fore)
            }.frame(width: config.large*6, height: config.haut*6, alignment: .bottom)
                .padding(config.large/3)
                .background(config.mid)
        }
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


