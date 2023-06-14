//
//  Cistercien.swift
//  Unicalc (iOS)
//
//  Created by Herve Crespel on 14/07/2022.
//

import SwiftUI
import Unombres

struct Cistercien: View {
    @EnvironmentObject var face: Manager
    
    var index = 0
    var suitindex = 0
    var groupindex = 0
    
    var size: CGFloat = 50
    var color = Color("glyph")
    
  // erreur à corriger suitindex
    var suite:[[Int]] {
        face.scalars[index].count == 0 ? [] :
            face.scalars[index][suitindex]
    }
    
    var value:[Int] {
        
        var val = [0,0,0,0]
        if suite.count == 0 {
            return val
        } else {
            print ("gi: ",groupindex)
            let group = suite[groupindex]
            switch group.count {
            case 0:
                break
            case 1:
                val[3] = group[0]
            case 2:
                val[2] = group[0]
                val[3] = group[1]
            case 3:
                val[1] = group[0]
                val[2] = group[1]
                val[3] = group[2]
            default:
                val = group
            }
            return val
        }
    }
    
    var body: some View {
        // condition pour le changement de groupby
        if suite.count > groupindex {
            Group{
                HStack(spacing:0) {
                    VStack(spacing:size) {
                        Cistdiz(value:value[2], size:size)
                        Cistmil(value:value[0], size:size)
                    }.frame(alignment:.trailing)
                    Rectangle().fill(color)
                        .frame(width:size/10, height: size*3)
                        .padding(0)
                    VStack(spacing:size) {
                        Cistunit(value:value[3], size:size)
                        Cistcent(value:value[1], size:size)
                    }.frame(alignment:.leading)
                }
            }.padding(0)
        }
    }
}

struct Cistercien_Previews: PreviewProvider {
    static var previews: some View {
        VStack {

            Cistercien()
                .environmentObject(Manager(.cister,10, Vector(Real(1896))))
            Cistercien()
                .environmentObject(Manager(.cister,10, Vector(Real(43))))
            Cistercien()
                .environmentObject(Manager(.cister,10, Vector(Real(752))))
            
        }
    }
}
