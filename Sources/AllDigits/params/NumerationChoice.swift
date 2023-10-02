//
//  NumerationChoice.swift
//  Unicalc
//
//  Created by Herve Crespel on 03/09/2022.
//

import SwiftUI

struct NumerationChoice: View {
    
    @Binding var isPresented : Bool
    @Binding var numeration: Numeration
    @Binding var scalar: Chiffres
    
    @State var changebase = true

    var width: CGFloat = 420
    var height: CGFloat = 400
    
    let bs : CGFloat = 35
    
    var label: some View {
        HStack{
            Text(" chiffres ")
            Text(numeration.numicode.rawValue)
            Text(" en base \(numeration.base)")
        }.font(.title2)
            .frame(width: width)
        .padding(15)
    }
    
    var body: some View {
        VStack(alignment:.center) {
            GroupBox(label:label){
                HStack(alignment: .top, spacing: 2) {
                    NumiChooser(numeration:$numeration, nombre:$scalar,
                                height:height*0.75, w:width-120, h:bs, closable:!changebase)
                            .padding(.trailing, 7)
                    .frame(alignment: .top)
                    
                    if changebase {
                        VStack(alignment:.center) {
                            BasEditor(numeration:$numeration,nombre:$scalar, h:bs).padding(6)
                        }
                    }
                }.padding(10)
            }
            Button(action: {isPresented = false}){
                Image(systemName: "checkmark")
            }.fond(w: bs, h: bs)
        }.padding(10)

    }
    
}

struct NumerationChoice_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NumerationChoice(isPresented: .constant(true),  numeration:.constant(Numeration(.global, 10)), scalar:.constant(Chiffres(12)), changebase:false)
            NumerationChoice(isPresented: .constant(true),  numeration:.constant(Numeration(.global, 10)), scalar:.constant(Chiffres(12)))
        }
    }
}
