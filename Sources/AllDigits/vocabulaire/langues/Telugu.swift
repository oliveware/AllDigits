//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Telugu: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.hnd,    // à rectifier
        ecriture:.telugu,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : [],
        feminin : [],
        neutre: [],
        dizaines : [],
        centaines : [],
        mille :  ("",nil),
        grands : [("",nil), ("","")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()

        return sp
    }
}
