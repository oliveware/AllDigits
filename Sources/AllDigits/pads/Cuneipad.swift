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
    
    var width:CGFloat = 200
    var height:CGFloat = 180
    
    var symbols : [String] = Mesopotamie.sumergesh
    var config = Digiconfig()
    
    var base = 60
    var units = Mesopotamie.sumer
    var tens = Mesopotamie.geshu
    @State var chiffres = Chiffres(.sumergesh,60)
    @State var compose = Chiffres(.sumergesh,60)
    
    var body: some View {
        VStack {
            HStack(alignment:.top) {
                Button(action: add) {
                    Text(symbols[compose.values[0]])
                }
                .buttonStyle(Digit60())
                .disabled(compose.empty)
            }.frame(width:width)
                .padding(.top, 5)
                .padding(.bottom,20)
            
            HStack {
                Unipad(width:width*0.4, height: height,
                       nbtouches: 6, symbols:tens,
                       config:config, chiffres: $compose)

                Unipad(width:width*0.6, height: height,
                       nbtouches: 10, symbols:units,
                       config:config, chiffres: $compose)
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
        Cuneipad()
            
    }
}
