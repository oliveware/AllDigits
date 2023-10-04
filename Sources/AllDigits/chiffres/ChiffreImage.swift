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
        VStack(alignment:.center){
            Image(resource:name, ofType:"png")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(config.fore)
               .frame(width: config.large*3, height: config.haut*5, alignment: .center)
               .padding(0)
                .background(config.mid)
                .offset(x:offset.x, y:offset.y)
        }.frame( alignment: .center)
        .padding(0)
        .background(config.mid)
    }
}

#Preview {
    
    HStack(spacing:0) {
        ChiffreImage()
        ChiffreImage(name:"dekapenta", config:Digiconfig().colore([.red]))
        ChiffreImage(name:"ata")
        ChiffreImage(name:"Babylon_20", config:Digiconfig().colore([.blue]))
    }
}

