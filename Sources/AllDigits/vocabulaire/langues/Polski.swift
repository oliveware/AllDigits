//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Polski: Languedata{
    
    let ecriture = Ecriture (
        langue: Langue.Code.pol,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" "),
        ordizun: false,
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
}
