//
//  SwiftUIView.swift
//  
//
//  Created by Herve Crespel on 15/10/2023.
//

import SwiftUI

struct Lettres: View {
    
    let scalar = Chiffres(1456237892, 10)
    let scripts: [Langue.Code] = [.fr, .en, .de, .nl]
    
    var body: some View {
        VStack {
            ForEach (0..<scripts.count, id:\.self) {
                i in
                Text(scalar.enlettres(scripts[i], .native, .partrois))
            }
            
            Text(scalar.enlettres(.zh, .native, .chinois))
        }
    }
}

#Preview {
    Lettres()
}
