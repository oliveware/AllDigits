//
//  Unipad.swift
//  Knownbers
//
//  Created by Herve Crespel on 18/06/2022.
//

import SwiftUI
import Digiconf

struct Unipad: View {
        
    var width:CGFloat = 600
    var height:CGFloat = 400

    var config = Digiconfig()
    var linear = false
    var additif = false
    
    // touches du clavier
    var touches: [String]
    var nbtouches: Int = 10
    var graphism : Graphism?
    var zeroisknown = false
    
    // nombre saisi avec le clavier
    @Binding var chiffres : Chiffres
    @State var power: Int = 0
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(spacing:2) {
                ForEach(ranges, id: \.self) {
                    range in
                    HStack(spacing:2) {
                        ForEach(range, id: \.self) {
                            index in
                            if index != 0 || zeroisknown {
                                Touche(index:index,
                                       clavier:touches,
                                       graphism:graphism,
                                       width:wt, height:ht,
                                       config:config,
                                       chiffres:$chiffres,
                                       additif:additif
                                )
                            }
                        }
                    }.padding(0)
                }
            }
            .padding(0)
        }.frame(width: width, height: height, alignment: .center)
        .padding(0)
    }
    
    // calcul du nombre de colonnes et de lignes
    
    var ranges:[ClosedRange<Int>] {
        
        if linear {
            switch nbtouches {
            case 10,20,30,40:
                return lines(10)
            case 12,24,36,48:
                return lines(12)
            default:
                return lines(16)
            }
        } else {
            switch nbtouches {
            case 10,15,20:
                return lines(5)
            case 2,3:
                return[0...nbtouches-1]
            case 4:
                return lines(2)
            case 5:
                return[0...0, 1...2, 3...4]
            case 6,9:
                return lines(3)
            case 8,12,16:
                return lines(4)
            case 24...36:
                return lines(6)
            case 37...42:
                return lines(7)
            case 43...48:
                return lines(8)
            case 49...63:
                return lines(9)
            case 64...72:
                return lines(10)
            default:
                return lines(Int(sqrt(Double(nbtouches-1))) + 1)
            }
        }
    }
        
    func lines(_ nbc:Int)->[ClosedRange<Int>] {
        var rg :[ClosedRange<Int>] = []

        let last = nbtouches % nbc
        let nbl = (nbtouches - last) / nbc
        if nbl > 0 {
            for i in 1...nbl {
                rg.append((i-1)*nbc...i*nbc-1)
            }
        }
        if last > 0 {
            rg.append(nbtouches-last...nbtouches-1)
        }
        return rg
    }
    
    var wt:CGFloat{
        let w = width - 60
       // w = scientific ? w - 240 :  w
        if nbtouches == 5 {
            return (w-6)/2
        } else {
            let nbc = CGFloat(ranges[0].count)
            let wt = w-2*(nbc+1)
            return linear ? wt/(nbc+1) : wt/nbc
        }
    }
    
    var ht:CGFloat {
        let nbl = CGFloat(ranges.count)
        return (height-30 - 2*(nbl-1))/nbl
    }
}

/*struct Unipad_Previews: PreviewProvider {
    static var previews: some View {
        Unipad(width:300, height:200) //real:.constant((Real(123,45))))
        Unipad(width:600,height:70,linear:true)
        Unipad() //real:.constant((Real(123,45))))
        Unipad(width:700,height:500) //real:.constant((Real(123,45))))
        Unipad() //real:.constant((Real(123,45))))
        Unipad() //real:.constant((Real(123,45))))
    }
}*/

