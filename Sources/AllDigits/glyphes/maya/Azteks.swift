//
//  SwiftUIView.swift
//  
//
//  Created by Herve Crespel on 06/10/2023.
//

import SwiftUI
import Digiconf

struct Azteks: View {
    var config = Digiconfig().size(60,60)
    
    func name(_ index:Int) -> String {
        return "mayafacial\(index)"
    }
    
    var units: some View {
        HStack {
            ForEach(0..<5) {
                unit in
                Text("\(unit)")
                    .frame(width:config.large)
                    .padding(0)
            }
        }
    }
    var tens: some View {
        VStack() {
            ForEach(0..<4) {
                ten in
                Text("\(ten*4+1)")
                    .frame(height:config.haut)
                    .padding(0)
            }
        }.frame(alignment:.center)
            .padding(.top, 22)
    }
    
    var body: some View {
        HStack {
            tens
            VStack {
                units
                ForEach(0..<4) {
                    ten in
                    HStack {
                        ForEach(0..<5) {
                            unit in
                            ChiffreImage(name: name(5*ten+unit), config: config, original:true)
                                .frame(width:config.large)
                        }
                    }
                }
            }
        }.frame(width: 900)
    }
}

#Preview {
    Azteks()
}
