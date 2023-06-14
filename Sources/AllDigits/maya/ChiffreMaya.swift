//
//  ChiffreMaya.swift
//  multikalk
//
//  Created by Herve Crespel on 23/11/2021.
//

import SwiftUI

struct ChiffreMaya: View {
    
    var value = 15
    var size :CGFloat = 3
    
    var body: some View {
        if value == 0 {
            Image("zeromaya")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color("yang"))
                .frame(width: size*5, height: size*5, alignment: .bottom)
                .padding(size/3)
        } else {
            VStack(alignment:.center, spacing:size*0.7){
                CircleRow(nc:value%5, size: size)
                BarStack(nb:(value-value%5)/5, size: size)
            }.frame(width: size*6, height: size*6, alignment: .bottom)
            .padding(size/3)
        }
    }
}

struct ChiffreMaya_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing:20) {
            HStack(spacing:12) {
                ForEach(0...4, id: \.self) {
                    index in
                    ChiffreMaya(value :index)
                }
            }
            HStack(spacing:12) {
                ForEach(5...9, id: \.self) {
                    index in
                    ChiffreMaya(value :index, size:4)
                }
            }
            HStack(spacing:12) {
                ForEach(10...14, id: \.self) {
                    index in
                    ChiffreMaya(value :index, size:5)
                }
            }
            HStack(spacing:12) {
                ForEach(15...19, id: \.self) {
                    index in
                    ChiffreMaya(value :index, size:7)
                }
            }
        }.background(Color.black)
    }
}
