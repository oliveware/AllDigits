//
//  SwiftUIView.swift
//  
//
//  Created by Herve Crespel on 06/09/2023.
//

import SwiftUI
import Digiconf

public struct Input: View {
    
    @State var numeration = Numeration(.global,10)
    @State var scalar : Chiffres
    @State var linear = false
    @State var clavieradditif = false
    var width : CGFloat = 900
    var height : CGFloat = 600
    var configtouch: Digiconfig
    var configshow: Digiconfig
    
    var cote:CGFloat = 30
    
    public init(_ show: Digiconfig, _ touch:Digiconfig,
                _ decival:Int,
                _ numic:Numicode, _ b:Int = 10, _ l:Bool = false,
                _ w: CGFloat = 600, _ h: CGFloat = 400) {
        numeration = Numeration(numic, b)
        linear = l
        width = w
        height = h
        configshow = show
        configtouch = touch
        scalar = Chiffres(decival,b)
    }
    
    var parambar: some View {
        VStack {
            Button(action: {  scalar.clear() } )
            {
                Image(systemName: "trash" )
            }.parambar(cote)
            Spacer()
            NumerationSetting(numeration: $numeration, chiffres: $scalar, cote:cote)
            Spacer()
            Button(action: {  linear.toggle() } )
            {
                Image(systemName: linear ? "square.split.2x2" : "rectangle.split.2x1" )
            }.parambar(cote)
            if numeration.isadditive {
                Button(action: {  clavieradditif.toggle() } )
                {
                    Image(systemName: clavieradditif ? "square" : "square.and.line.vertical.and.square" )
                }.parambar(cote)
                .disabled(!scalar.empty)
            }
        }
    }
    
    public var body: some View {
        HStack(spacing:50) {
            parambar
            Spacer()
            if numeration.numicode == .maya {
                HStack {
                    
                    Enchiffres(configshow, scalar, numeration).frame(width: configshow.large*1.5).padding(20)
                    
                    Pad(configtouch, $scalar, numeration, linear, clavieradditif, width*0.5, height*0.7)
                }
            } else {
                VStack {
                    Spacer()
                    Enchiffres(configshow, scalar, numeration).frame(height: configshow.haut*1.2)
                    Text(scalar.enlettres(Langue.Code.fr, Langue.KindOfScript.native,  Groupement.partrois))
                    Spacer()
                    Pad(configtouch, $scalar, numeration, linear, clavieradditif, width*0.8, height*0.6)
                }
            }
            Spacer()
        }.padding(10)
    }
}

struct Input_Previews: PreviewProvider {
    static var previews: some View {
        Input(Digiconfig(90,40,10, .purple, .clear), Digiconfig(80,50), 51279, .global,10)
        Input(Digiconfig(90,40,10, .purple, .clear), Digiconfig(80,50), 51279, .babyash,60)
        Input(Digiconfig(90,40,10, .purple, .clear), Digiconfig(60,60,10), 51279, .maya,20)
    }
}
