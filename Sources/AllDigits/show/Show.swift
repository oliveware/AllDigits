//
//  SwiftUIView.swift
//  
//
//  Created by Herve Crespel on 06/09/2023.
//

import SwiftUI

public struct Show: View {
    @State var numerationsetting = false
    @State var numeration = Numeration(.global,10)
    @State var linear = false
    
    var cote:CGFloat = 25
    
    public init(_ numic:Numicode, _ b:Int, _ l:Bool = false) {
        numeration = Numeration(numic, b)
        linear = l
    }
    
    public var body: some View {
        HStack {
            Button(action: {  numerationsetting = true }
            ){
                Image(systemName: "123.rectangle" )
            }.fond(w: cote, h: cote)
            .sheet(isPresented:$numerationsetting) {
                NumerationChoice(isPresented: $numerationsetting, numeration: $numeration)
                }
            Pad(Conf.pad, numeration, linear)
        }
    }
}

struct Show_Previews: PreviewProvider {
    static var previews: some View {
        Show(.global,10)
    }
}
