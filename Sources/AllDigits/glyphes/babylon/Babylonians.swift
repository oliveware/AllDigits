//
//  SwiftUIView.swift
//  
//
//  Created by Herve Crespel on 05/10/2023.
//

import SwiftUI
import Digiconf

struct Babylonians: View {
    
    var index = 20
    var config = Digiconfig().size(60,60)
    
    var units: some View {
        HStack {
            ForEach(0..<10) {
                unit in
                Text("\(unit)")
                    .frame(width:config.large*1.3)
                    .padding(0)
            }
        }
    }
    var tens: some View {
        VStack() {
            ForEach(0..<6) {
                ten in
                Text("\(ten)")
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
                ForEach(0..<6) {
                    ten in
                    HStack {
                        ForEach(0..<10) {
                            unit in
                            ChiffreBabylonien(index:10*ten+unit)
                        }
                    }
                }
            }
        }.frame(width: 900)
    }
}

#Preview {
    Babylonians()
}
