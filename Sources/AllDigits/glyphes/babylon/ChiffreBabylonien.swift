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
    var config = Digiconfig().size(60,60)
    
    var body: some View {
        VStack(alignment:.center){
            ChiffreImage(name:"Babylon_\(index)",
                         config:config.scale(0.2))
        }
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
                        if 10*(i + 2*l) < 60 { ChiffreBabylonien(index:10*(i + 2*l)) }
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
                        ChiffreBabylonien(index:i + 2*l)
                    }
                }
            }
        }
    }
}
