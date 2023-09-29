//
//  SwiftUIView.swift
//  
//
//  Created by Herve Crespel on 29/09/2023.
//

import SwiftUI

public struct NumerationSetting: View {
    @Binding var numeration:Numeration
    @Binding var chiffres:Chiffres
    
    var cote:CGFloat = 30
    
    @State var numerationsetting = false
    
    public init(numeration: Binding<Numeration>, chiffres: Binding<Chiffres>, cote: CGFloat = 30) {
        self._numeration = numeration
        self._chiffres = chiffres
        self.cote = cote
    }
    
    public var body: some View {
        Button(action: {  numerationsetting = true } )
        {
            Image(systemName: "123.rectangle" ).scaledToFill()
        }.fond(w: cote, h: cote)
            .sheet(isPresented:$numerationsetting) {
                NumerationChoice(isPresented: $numerationsetting, numeration: $numeration, scalar: $chiffres)
            }
    }
}

#Preview {
    NumerationSetting(
        numeration:.constant(Numeration(.global,10)),
        chiffres: .constant(Chiffres(123,10))
    )
}
