//
//  SwiftUIView.swift
//  
//
//  Created by Herve Crespel on 06/09/2023.
//

import SwiftUI
import Digiconf

public struct Show: View {
    
    @State var numeration = Numeration(.global,10)
    @State var scalar : Chiffres
    @State var linear = false
    @State var clavieradditif = false
    var width : CGFloat = 600
    var height : CGFloat = 400
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
            VStack {
                Enchiffres(configshow, scalar, numeration).frame(height: configshow.haut*1.2)
                Pad(configtouch, $scalar, numeration, linear, clavieradditif, width, height)
            }
            Spacer()
        }
    }
}

struct Show_Previews: PreviewProvider {
    static var previews: some View {
        Show(Digiconfig(90,40,10, .purple, .clear), Digiconfig(80,50), 51279, .global,10)
        Show(Digiconfig(90,40,10, .purple, .clear), Digiconfig(80,50), 51279, .babyash,60)
        Show(Digiconfig(90,40,10, .purple, .clear), Digiconfig(60,60,10), 51279, .maya,20)
    }
}
