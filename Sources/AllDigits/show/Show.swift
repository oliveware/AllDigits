//
//  SwiftUIView.swift
//  
//
//  Created by Herve Crespel on 06/09/2023.
//

import SwiftUI
import Digiconf

public struct Show: View {
    @State var numerationsetting = false
    @State var numeration = Numeration(.global,10)
    @State var scalar : Chiffres
    @State var linear = false
    var width : CGFloat = 600
    var height : CGFloat = 400
    var configtouch: Digiconfig
    var configshow: Digiconfig
    
    var cote:CGFloat = 50
    
    public init(_ show: Digiconfig, _ touch:Digiconfig,
                _ decimal:[Int] = [],
                _ numic:Numicode, _ b:Int = 10, _ l:Bool = false,
                _ w: CGFloat = 600, _ h: CGFloat = 400) {
        numeration = Numeration(numic, b)
        linear = l
        width = w
        height = h
        configshow = show
        configtouch = touch
        scalar = Chiffres(values:decimal)
    }
    
    public var body: some View {
        HStack(spacing:50) {
            VStack {
                Button(action: {  numerationsetting = true } )
                {
                    Image(systemName: "123.rectangle" )
                }.fond(w: cote, h: cote)
                    .sheet(isPresented:$numerationsetting) {
                        NumerationChoice(isPresented: $numerationsetting, numeration: $numeration)
                    }
            }
            Pad(Digiconfig(), Digiconfig(), scalar, numeration, linear, width, height)
        }
    }
}

struct Show_Previews: PreviewProvider {
    static var previews: some View {
        Show(Digiconfig(30, 50), Digiconfig(20,40),[5,9], .global,10)
    }
}
