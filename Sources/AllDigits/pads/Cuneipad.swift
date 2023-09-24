//
//  Cuneipad.swift
//  multikalk
//
//  Created by Herve Crespel on 23/11/2021.
//

import SwiftUI
import Digiconf

struct Digit60: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

  func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
          .frame(width: 120, height: 50)
          .font(.largeTitle)
          .padding(1)
          .foregroundColor(configuration.isPressed ? Color.green : .pink)
          .background(isEnabled ? Color.yellow : .gray)
          .cornerRadius(8)
  }
}

struct Cuneipad: View {
    
    var width : CGFloat = 600
    var height : CGFloat = 400

    var config = Digiconfig()
    
    var doubles : [String] = Mesopotamie.symbols(.sumerash)
    var tens : [String] = Mesopotamie.sumer
    var units : [String] = Mesopotamie.ash
    
    @Binding var chiffres : Chiffres
    @State var compose = Chiffres()
    
    var body: some View {
        VStack {
            HStack(alignment:.top) {
                Button(action: add) {
                    Text( compose.empty ? "" : doubles[compose.values[0]])
                }
                .buttonStyle(Digit60())
                .disabled(compose.empty)
            }.frame(width:width)
                .padding(.top, 5)
                .padding(.bottom,20)
            
            HStack(spacing:15) {
                Unipad(width:width*0.4, height: height,
                       config: config,
                       touches:tens,
                       chiffres: $compose)

                Unipad(width:width*0.6, height: height,
                       config:config,
                       touches:units,
                       chiffres: $compose)
            }
        }.padding(5)
    }
    
    func add() {
        chiffres.add(compose.values[0])
        compose.clear()
    }

}

struct Cuneipad_Previews: PreviewProvider {
    static var previews: some View {
        Cuneipad(chiffres:.constant( Chiffres()))
            
    }
}
