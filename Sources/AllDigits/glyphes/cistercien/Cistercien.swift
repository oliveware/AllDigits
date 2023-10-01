//
//  Cistercien.swift
//  Unicalc (iOS)
//
//  Created by Herve Crespel on 14/07/2022.
//

import SwiftUI
import Digiconf

struct Cistercien: View {
    var value: [Int] = [0,0,0,0]
    var size: CGFloat = 50
    var color = Color.brown
    var finesse: CGFloat = 3
    
    init(_ v:[Int], _ config:Digiconfig) {
        switch v.count {
        case 4:
            value = v
        case 3:
            value[1] = v[0]
            value[2] = v[1]
            value[3] = v[2]
        case 2:
            value[2] = v[0]
            value[3] = v[1]
        case 1:
            value[3] = v[0]
        case 0:
            break
        default:
            let vc = v.count - 4
            for i in 0...3 {
                value[i] = v[vc+i]
            }
        }
        size = (config.large + config.haut) / 8
        finesse = size/7
        color = config.fore
    }
    
    var body: some View {

        Group{
            HStack(spacing:0) {
                VStack(spacing:size) {
                    Cistdiz(value:value[2], size:size, color:color, finesse:finesse)
                    Cistmil(value:value[0], size:size, color:color, finesse:finesse)
                }.frame(alignment:.trailing)
                Rectangle().fill(color)
                    .frame(width:finesse, height: size*3)
                    .padding(0)
                VStack(spacing:size) {
                    Cistunit(value:value[3], size:size, color:color, finesse:finesse)
                    Cistcent(value:value[1], size:size, color:color, finesse:finesse)
                }.frame(alignment:.leading)
            }
        }.padding(0)

    }
}

#Preview {
    Cistercien([5,7,4,2], Digiconfig())
}
