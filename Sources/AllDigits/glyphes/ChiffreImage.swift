//
//  SwiftUIView.swift
//  
//
//  Created by Herve Crespel on 02/10/2023.
//

import SwiftUI
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

struct ChiffreImage: View {

    var name:String = "zeromaya"
    var config = Digiconfig()
    var offset : (x:CGFloat,y:CGFloat) = (0,0)

    var body: some View {
        VStack(alignment:.center, spacing:config.haut*0.5){
           
            Image(resource:name, ofType:"png")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(config.fore)
                .frame(width: config.large*5, height: config.haut*5, alignment: .bottom)
                .padding(config.large/3)
                .background(config.mid)
                .offset(x:offset.x, y:offset.y)

        }.frame(width: config.large*6, height: config.haut*6, alignment: .bottom)
            .padding(config.large/3)
            .background(config.mid)
    }
}

#Preview {
    ChiffreImage()
}
#Preview {
    ChiffreImage(name:"ata")
}
#Preview {
    ChiffreImage(name:"Babylon_20", config:Digiconfig().colore([.blue]))
}
