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
    
    var graphism : Graphism?
    
    @Binding var chiffres : Chiffres
    @State var compose = 0
    
    var body: some View {
        VStack {
            HStack(alignment:.top) {
                Button(action: add) {
                    if graphism != nil {
                        ChiffreBabylonien(
                            compose, config)
                    } else {
                        Text( compose == 0 ? "" : doubles[compose])
                    }
                }
                .configTouch(config.size(100,60).colore([.blue,.clear,.purple]))
                .disabled(compose == 0 && graphism == nil)
            }.frame(width:width)
                .padding(.top, 5)
                .padding(.bottom,20)
            HStack(alignment: .top) {
                VStack(spacing:2) {
                    ForEach(0...2, id: \.self) {
                        line in
                        HStack(spacing:2) {
                            ForEach(1...2, id: \.self) {
                                col in
                                if line*2+col < 6 {
                                    Button( action: { seten(line*2+col) } )
                                    {  if graphism != nil {
                                        ChiffreBabylonien(
                                            10*(line*2+col),
                                            config)
                                        } else {
                                            Chiffreunicode(
                                                symbol:tens[line*2+col],
                                                config: config.scale(0.7)
                                            )
                                        }
                                    }
                                    .configTouch(config)
                                    .disabled(compose > 9)
                                }
                            }
                        }.padding(0)
                    }
                }
                .padding(5)
                VStack(spacing:2) {
                    ForEach(0...2, id: \.self) {
                        line in
                        HStack(spacing:2) {
                            ForEach(1...3, id: \.self) {
                                col in
                                Button( action: {
                                    setunit(line*3+col) } )
                                    {
                                        if graphism != nil {
                                            ChiffreBabylonien( line*3+col, config)
                                        } else {
                                            Chiffreunicode( symbol:units[line*3+col],
                                                            config: config.scale(0.5))
                                        }
                                    }
                                    .configTouch(config)
                                    .disabled(compose % 10 > 0)
                                }
                            }.padding(0)
                        }
                    } .padding(5)
                }.frame(width: width, height: height, alignment: .center)
                    .padding(0)
                
            }.padding(5)
        
    }
    
    func seten(_ input:Int) {
        if compose < 10 { compose += input * 10 }
    }
    
    func setunit(_ input:Int){
        if compose % 10 == 0 { compose += input }
    }
    
    func add() {
        chiffres.add(compose)
        compose = 0
    }

}

struct Cuneipad_Previews: PreviewProvider {
    static var previews: some View {
        Cuneipad(chiffres:.constant( Chiffres()))
        Cuneipad(graphism:.babylon, chiffres:.constant( Chiffres()))
    }
}
